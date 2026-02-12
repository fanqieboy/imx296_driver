#include <linux/clk.h>
#include <linux/device.h>
#include <linux/delay.h>
#include <linux/gpio/consumer.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/pm_runtime.h>
#include <linux/rk-camera-module.h>
#include <media/media-entity.h>
#include <media/v4l2-async.h>
#include <media/v4l2-ctrls.h>
#include <media/v4l2-subdev.h>
#include <media/v4l2-fwnode.h>
#include <linux/of_graph.h>

#ifndef KBUILD_BASENAME
#define KBUILD_BASENAME "imx296"
#endif

#define IMX296_NAME                     "imx296"

#define IMX296_PIXEL_ARRAY_WIDTH		1456
#define IMX296_PIXEL_ARRAY_HEIGHT		1088
const struct v4l2_fract IMX296_MAX_FPS = {.numerator = 1, .denominator = 30};
#define IMX296_FRAME_INTERVAL           IMX296_MAX_FPS

/* 寄存器位宽宏：从地址中提取长度 */
#define IMX296_REG_8BIT(n)              ((1 << 16) | (n))
#define IMX296_REG_16BIT(n)             ((2 << 16) | (n))
#define IMX296_REG_24BIT(n)             ((3 << 16) | (n))
#define IMX296_GET_LEN(n)               (((n) >> 16) & 0x03)
#define IMX296_REG_ADDR_MASK			0xffff
#define IMX296_REG_SIZE_SHIFT			16
#define IMX296_REG_SIZE_MASK            0x3
#define IMX296_SENSOR_INFO_IMX296LQ		0x4a00
#define IMX296_GAINDLY_1FRAME			0x09
#define IMX296_FRAME_CODE               MEDIA_BUS_FMT_SRGGB10_1X10

/* 核心寄存器定义 */
#define IMX296_CTRL00                   IMX296_REG_8BIT(0x3000)
#define IMX296_CTRL00_STANDBY           BIT(0)
#define IMX296_CTRL08                   IMX296_REG_8BIT(0x3008)
#define IMX296_CTRL08_REGHOLD           BIT(0)
#define IMX296_CTRL0A					IMX296_REG_8BIT(0x300a)
#define IMX296_CTRL0A_XMSTA				BIT(0)
#define IMX296_CTRL0B					IMX296_REG_8BIT(0x300b)
#define IMX296_CTRL0B_TRIGEN			BIT(0)
#define IMX296_CTRL0D					IMX296_REG_8BIT(0x300d)
#define IMX296_CTRL0D_WINMODE_ALL		(0 << 0)
#define IMX296_CTRL0D_WINMODE_FD_BINNING	(2 << 0)
#define IMX296_CTRL0D_HADD_ON_BINNING	BIT(5)
#define IMX296_CTRL0D_SAT_CNT			BIT(6)
#define IMX296_CTRL0E					IMX296_REG_8BIT(0x300e)
#define IMX296_CTRL0E_VREVERSE			BIT(0)
#define IMX296_CTRL0E_HREVERSE			BIT(1)
#define IMX296_VMAX					    IMX296_REG_24BIT(0x3010)
#define IMX296_HMAX					    IMX296_REG_16BIT(0x3014)
#define IMX296_INCKSEL(n)				IMX296_REG_8BIT(0x3089 + (n))
#define IMX296_SHS1                     IMX296_REG_24BIT(0x308d)
#define IMX296_LOWLAGTRG				IMX296_REG_8BIT(0x30ae)
#define IMX296_SENSOR_INFO				IMX296_REG_16BIT(0x3148)
#define IMX296_GAIN                     IMX296_REG_16BIT(0x3204)
#define IMX296_GAINDLY					IMX296_REG_8BIT(0x3212)
#define IMX296_BLKLEVEL					IMX296_REG_16BIT(0x3254)
#define IMX296_FID0_ROI					IMX296_REG_8BIT(0x3300)

#define IMX296_GTTABLENUM				IMX296_REG_8BIT(0x4114)
#define IMX296_MIPIC_AREA3W				IMX296_REG_16BIT(0x4182)
#define IMX296_CTRL418C					IMX296_REG_8BIT(0x418c)

#define to_imx296(sd) container_of(sd, struct imx296, subdev)

static const s64 imx296_link_freqs[] = {
    594000000, // 371.25 MHz (注意是 3.7 亿)
};

static const s64 imx296_pixel_rate[] = {
    237600000,
};


static long imx296_ioctl(struct v4l2_subdev *sd, 
    unsigned int cmd, void *arg);

static int imx296_s_stream(struct v4l2_subdev *sd, int on);
static int imx296_g_frame_interval(struct v4l2_subdev *sd,
    struct v4l2_subdev_frame_interval *fi);

static int imx296_enum_mbus_code(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_mbus_code_enum *code);
static int imx296_enum_frame_size(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_frame_size_enum *fse);
static int imx296_enum_frame_interval(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_frame_interval_enum *fie);
static int imx296_get_fmt(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_format *fmt);
static int imx296_set_fmt(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_format *fmt);
static int imx296_get_mbus_config(struct v4l2_subdev *sd,
    unsigned int pad_id,
    struct v4l2_mbus_config *cfg);
static int imx296_entity_init_cfg(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state);

static int imx296_runtime_suspend(struct device *dev);
static int imx296_runtime_resume(struct device *dev);
static int imx296_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);

static const struct v4l2_subdev_core_ops imx296_core_ops = {
    .ioctl = imx296_ioctl,
};

static const struct v4l2_subdev_video_ops imx296_video_ops = {
    .s_stream = imx296_s_stream,
    .g_frame_interval = imx296_g_frame_interval,
};

static const struct v4l2_subdev_pad_ops imx296_pad_ops = {
    .init_cfg = imx296_entity_init_cfg,
    .enum_mbus_code = imx296_enum_mbus_code,
    .enum_frame_size = imx296_enum_frame_size,
    .enum_frame_interval = imx296_enum_frame_interval,
    .get_fmt = imx296_get_fmt,
    .set_fmt = imx296_set_fmt,
    .get_mbus_config = imx296_get_mbus_config,
};

static const struct v4l2_subdev_ops imx296_subdev_ops = {
    .core = &imx296_core_ops,
    .video = &imx296_video_ops,
    .pad = &imx296_pad_ops,
};

static const struct v4l2_subdev_internal_ops imx296_internal_ops = {
	.open = imx296_open,
};

static const struct dev_pm_ops imx296_pm_ops = {
	SET_RUNTIME_PM_OPS(imx296_runtime_suspend, imx296_runtime_resume, NULL)
};

static const struct media_entity_operations imx296_subdev_entity_ops = {
	.link_validate = v4l2_subdev_link_validate,
};

struct regval {
    u32 addr;
    u32 val;
};

struct imx296_mode {
	u32 bus_fmt;
	u32 width;
	u32 height;
	struct v4l2_fract max_fps;
	u32 hts_def;
	u32 vts_def;
	u32 exp_def;
	u32 bpp;
	const struct regval *reg_list;
	u32 hdr_mode;
	u32 vc[PAD_MAX];
};

/* 1. 初始化序列 (从树莓派驱动移植) */
static const struct regval imx296_init_setting[] = {
    { IMX296_REG_8BIT(0x3005), 0xf0 },
    { IMX296_REG_8BIT(0x309e), 0x04 },
    { IMX296_REG_8BIT(0x30a0), 0x04 },
    { IMX296_REG_8BIT(0x30a1), 0x3c },
    { IMX296_REG_8BIT(0x30a4), 0x5f },
    { IMX296_REG_8BIT(0x30a8), 0x91 },
    { IMX296_REG_8BIT(0x30ac), 0x28 },
    { IMX296_REG_8BIT(0x30af), 0x0b },
    { IMX296_REG_8BIT(0x30df), 0x00 },
    { IMX296_REG_8BIT(0x3165), 0x00 },
    { IMX296_REG_8BIT(0x3169), 0x10 },
    { IMX296_REG_8BIT(0x316a), 0x02 },
    { IMX296_REG_8BIT(0x31c8), 0xf3 },
    { IMX296_REG_8BIT(0x31d0), 0xf4 },
    { IMX296_REG_8BIT(0x321a), 0x00 },
    { IMX296_REG_8BIT(0x3226), 0x02 },
    { IMX296_REG_8BIT(0x3256), 0x01 },
    { IMX296_REG_8BIT(0x3541), 0x72 },
    { IMX296_REG_8BIT(0x3516), 0x77 },
    { IMX296_REG_8BIT(0x350b), 0x7f },
    { IMX296_REG_8BIT(0x3758), 0xa3 },
    { IMX296_REG_8BIT(0x3759), 0x00 },
    { IMX296_REG_8BIT(0x375a), 0x85 },
    { IMX296_REG_8BIT(0x375b), 0x00 },
    { IMX296_REG_8BIT(0x3832), 0xf5 },
    { IMX296_REG_8BIT(0x3833), 0x00 },
    { IMX296_REG_8BIT(0x38a2), 0xf6 },
    { IMX296_REG_8BIT(0x38a3), 0x00 },
    { IMX296_REG_8BIT(0x3a00), 0x80 },
    { IMX296_REG_8BIT(0x3d48), 0xa3 },
    { IMX296_REG_8BIT(0x3d49), 0x00 },
    { IMX296_REG_8BIT(0x3d4a), 0x85 },
    { IMX296_REG_8BIT(0x3d4b), 0x00 },
    { IMX296_REG_8BIT(0x400e), 0x58 },
    { IMX296_REG_8BIT(0x4014), 0x1c },
    { IMX296_REG_8BIT(0x4041), 0x2a },
    { IMX296_REG_8BIT(0x40a2), 0x06 },
    { IMX296_REG_8BIT(0x40c1), 0xf6 },
    { IMX296_REG_8BIT(0x40c7), 0x0f },
    { IMX296_REG_8BIT(0x40c8), 0x00 },
    { IMX296_REG_8BIT(0x4174), 0x00 },
};

static const struct imx296_mode supported_modes[] = {

};

struct imx296 {
    struct i2c_client *client;
    struct v4l2_subdev subdev;

    struct gpio_desc *pwdn_gpio;

    u32 module_index;
    const char *module_facing;
    const char *module_name;
    const char *len_name;

    bool streaming;
    struct clk *clk;

    struct media_pad pad;
    struct v4l2_fwnode_endpoint bus_cfg;
    struct mutex mutex;

    struct v4l2_mbus_framefmt current_format;
    struct v4l2_ctrl_handler ctrls;
    struct v4l2_ctrl *link_freq;
	struct v4l2_ctrl *pixel_rate;
};

static int imx296_write_reg(struct i2c_client *client, u32 addr, u32 val)
{
    u16 reg = addr & IMX296_REG_ADDR_MASK;
    u32 len = (addr >> IMX296_REG_SIZE_SHIFT) & IMX296_REG_SIZE_MASK;
    u8 buf[5];
    struct i2c_msg msg;

    buf[0] = reg >> 8;
    buf[1] = reg & 0xff;

    buf[2] = val & 0xff;
    if (len >= 2) buf[3] = (val >> 8) & 0xff;
    if (len >= 3) buf[4] = (val >> 16) & 0xff;

    msg.addr = client->addr;
    msg.flags = 0;
    msg.len = 2 + len;
    msg.buf = buf;

    return (i2c_transfer(client->adapter, &msg, 1) == 1) ? 0 : -EIO;
}

static int imx296_read_reg(struct i2c_client *client, u32 addr, u32 *val)
{
    u8 data[3] = { 0, 0, 0 };
    u16 reg = addr & IMX296_REG_ADDR_MASK;
    u32 len = (addr >> IMX296_REG_SIZE_SHIFT) & IMX296_REG_SIZE_MASK;
    u8 addr_buf[2] = {reg >> 8, reg & 0xff};
    struct i2c_msg msgs[2];
    int ret;

    msgs[0].addr = client->addr;
    msgs[0].flags = 0;
    msgs[0].len = 2;
    msgs[0].buf = addr_buf;

    msgs[1].addr = client->addr;
    msgs[1].flags = I2C_M_RD;
    msgs[1].len = len;
    msgs[1].buf = data;

    ret = i2c_transfer(client->adapter, msgs, 2);
    if (ret != 2) {
        dev_err(&client->dev, "I2C read failed: reg 0x%04x, len %d\n", reg, len);
        return -EIO;
    }

    *val = (data[2] << 16) | (data[1] << 8) | data[0];
    return 0;
}

static int imx296_open(
    struct v4l2_subdev *sd, 
    struct v4l2_subdev_fh *fh)
{
    struct imx296 *imx296 = to_imx296(sd);
    struct v4l2_mbus_framefmt *try_fmt = 
        v4l2_subdev_get_try_format(sd, fh->state, 0);
    
    mutex_lock(&imx296->mutex);

    try_fmt->width = IMX296_PIXEL_ARRAY_WIDTH;
    try_fmt->height = IMX296_PIXEL_ARRAY_HEIGHT;
    try_fmt->code = IMX296_FRAME_CODE;
    try_fmt->field = V4L2_FIELD_NONE;

    mutex_unlock(&imx296->mutex);
    return 0;
}

static long imx296_ioctl(
    struct v4l2_subdev *sd, 
    unsigned int cmd, 
    void *arg)
{
    struct imx296 *imx296 = to_imx296(sd);
    struct rkmodule_channel_info *ch_info;
    printk("--- [IMX296] ioctl called, cmd: 0x%08x ---\n", cmd);

    switch (cmd) {
    case RKMODULE_GET_CSI_DSI_INFO:
    case RKMODULE_GET_HDMI_MODE:
    case RKMODULE_GET_HDR_CFG:
    case RKMODULE_GET_START_STREAM_SEQ:
        return 0;
    case RKMODULE_GET_CAPTURE_MODE: {
        struct rkmodule_capture_info *cap_info = (struct rkmodule_capture_info *)arg;
        memset(cap_info, 0, sizeof(*cap_info));
        cap_info->mode = 0; 
        return 0;
    }
    case RKMODULE_GET_CHANNEL_INFO:
        ch_info = (struct rkmodule_channel_info *)arg;
        ch_info->index = 0;
        ch_info->vc = 0;
        ch_info->width = IMX296_PIXEL_ARRAY_WIDTH;
        ch_info->height = IMX296_PIXEL_ARRAY_HEIGHT;
        ch_info->bus_fmt = IMX296_FRAME_CODE;
        ch_info->data_type = 0x2b;
        ch_info->data_bit = 10;
        return 0;
    case RKMODULE_GET_MODULE_INFO: {
        struct rkmodule_inf *inf = (struct rkmodule_inf *)arg;
        memset(inf, 0, sizeof(*inf));
        strlcpy(inf->base.sensor, IMX296_NAME, sizeof(inf->base.sensor));
        strlcpy(inf->base.module, imx296->module_name, sizeof(inf->base.module));
        strlcpy(inf->base.lens, "default", sizeof(inf->base.lens));
        return 0;
    }
    case RKMODULE_GET_CSI_DPHY_PARAM: {
        struct rkmodule_csi_dphy_param *dphy_param = (struct rkmodule_csi_dphy_param *)arg;
        memset(dphy_param, 0, sizeof(*dphy_param));
        dphy_param->vendor = 0;
        return 0;
    }
    default:
        return -ENOIOCTLCMD;
    }
}

static int imx296_setup(struct imx296 *imx296, struct v4l2_subdev_state *state)
{
    struct i2c_client *client = imx296->client;
    unsigned int i;
    int ret = 0;

    for (i = 0; i < ARRAY_SIZE(imx296_init_setting); ++i) {
        imx296_write_reg(client, imx296_init_setting[i].addr, 
                         imx296_init_setting[i].val);
    }

    imx296_write_reg(client, IMX296_FID0_ROI, 0);
    imx296_write_reg(client, IMX296_MIPIC_AREA3W, IMX296_PIXEL_ARRAY_HEIGHT);

    imx296_write_reg(client, IMX296_CTRL0D, 0);

    imx296_write_reg(client, IMX296_HMAX, 1100);
    imx296_write_reg(client, IMX296_VMAX, 1125);

    imx296_write_reg(client, IMX296_INCKSEL(0), 0x80);
    imx296_write_reg(client, IMX296_INCKSEL(1), 0x0b);
    imx296_write_reg(client, IMX296_INCKSEL(2), 0x80);
    imx296_write_reg(client, IMX296_INCKSEL(3), 0x08);
    imx296_write_reg(client, IMX296_GTTABLENUM, 0xc5);
    imx296_write_reg(client, IMX296_CTRL418C, 116);

    imx296_write_reg(client, IMX296_GAINDLY, IMX296_GAINDLY_1FRAME);
    imx296_write_reg(client, IMX296_BLKLEVEL, 0x03c);

    return ret;
}

static int imx296_stream_on(struct imx296 *imx296)
{
    struct i2c_client *client = imx296->client;
    int ret = 0;

    // ret = __v4l2_ctrl_handler_setup(&imx296->ctrls);
    // if (ret) return ret;

    imx296_write_reg(client, IMX296_CTRL00, 0);
	usleep_range(2000, 5000);

    imx296_write_reg(client, IMX296_CTRL0B, 0);
    imx296_write_reg(client, IMX296_LOWLAGTRG, 0);

    imx296_write_reg(client, IMX296_CTRL0A, 0);

    return ret;
}

static int imx296_stream_off(struct imx296 *imx296)
{
    struct i2c_client *client = imx296->client;
    int ret = 0;

    imx296_write_reg(client, IMX296_CTRL0A, IMX296_CTRL0A_XMSTA);
    imx296_write_reg(client, IMX296_CTRL00, IMX296_CTRL00_STANDBY);

    return ret;
}

static int imx296_s_stream(struct v4l2_subdev *sd, int on)
{
    struct imx296 *imx296 = to_imx296(sd);
    struct i2c_client *client = imx296->client;
    int ret = 0;

    dev_info(&imx296->client->dev, "s_stream: %d. %dx%d\n", on, 
        IMX296_PIXEL_ARRAY_WIDTH, IMX296_PIXEL_ARRAY_HEIGHT);
    
    mutex_lock(&imx296->mutex);
    on = !!on;
    if (on) {
        ret = pm_runtime_get_sync(&client->dev);
        if (ret < 0) {
            pm_runtime_put_noidle(&client->dev);
            goto unlock_and_return;
        }

        ret = imx296_setup(imx296, NULL);
        if (ret) {
            dev_err(&client->dev, "Failed to setup sensor registers\n");
            goto err_pm;
        }

        ret = imx296_stream_on(imx296);
        if (ret) {
            dev_err(&client->dev, "Failed to start streaming\n");
            goto err_pm;
        }

        imx296->streaming = true;
    }
    else {
        imx296_stream_off(imx296);

        pm_runtime_put(&client->dev);
        imx296->streaming = false;
    }

    mutex_unlock(&imx296->mutex);
    return 0;

err_pm:
    pm_runtime_put_sync(&client->dev);
unlock_and_return:
    mutex_unlock(&imx296->mutex);
    return ret;
}

static int imx296_g_frame_interval(
    struct v4l2_subdev *sd,
    struct v4l2_subdev_frame_interval *fi)
{
    fi->interval = IMX296_FRAME_INTERVAL;

    return 0;
}

static int imx296_entity_init_cfg(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state)
{
    struct v4l2_subdev_format fmt = { 0 };

	fmt.which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
	fmt.format.width = IMX296_PIXEL_ARRAY_WIDTH;
	fmt.format.height = IMX296_PIXEL_ARRAY_HEIGHT;

	imx296_set_fmt(sd, state, &fmt);

	return 0;
}

static int imx296_enum_mbus_code(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_mbus_code_enum *code)
{
    if (code->index != 0) return -EINVAL;

    code->code = IMX296_FRAME_CODE;

    return 0;
}

static int imx296_enum_frame_size(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_frame_size_enum *fse)
{
    printk("fse->index: %d, fse->code: %d\n", fse->index, fse->code);
    if (fse->index > 0) return -EINVAL;
    if (fse->code != 0 && fse->code != IMX296_FRAME_CODE) return -EINVAL;

    fse->min_width = IMX296_PIXEL_ARRAY_WIDTH;
    fse->max_width = IMX296_PIXEL_ARRAY_WIDTH;
    fse->min_height = IMX296_PIXEL_ARRAY_HEIGHT;
    fse->max_height = IMX296_PIXEL_ARRAY_HEIGHT;

    return 0;
}

static int imx296_enum_frame_interval(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_frame_interval_enum *fi)
{
    fi->interval = IMX296_FRAME_INTERVAL;
    fi->width = IMX296_PIXEL_ARRAY_WIDTH;
    fi->height = IMX296_PIXEL_ARRAY_WIDTH;
    fi->code = IMX296_FRAME_CODE;
    fi->reserved[0] = 0;

    return 0;
}

static int imx296_get_fmt(
    struct v4l2_subdev *sd, 
    struct v4l2_subdev_state *state, 
    struct v4l2_subdev_format *fmt)
{
    struct imx296 *imx296 = to_imx296(sd);
    
    printk("in get fmt\n");

    mutex_lock(&imx296->mutex);

    if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
        fmt->format = *v4l2_subdev_get_try_format(sd, state, fmt->pad);
    }
    else {
        fmt->format.width = IMX296_PIXEL_ARRAY_WIDTH;
        fmt->format.height = IMX296_PIXEL_ARRAY_HEIGHT;
        fmt->format.code = IMX296_FRAME_CODE;
        fmt->format.field = V4L2_FIELD_NONE;
        fmt->reserved[0] = 0;

        fmt->format.colorspace = V4L2_COLORSPACE_RAW;
        fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
        fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
        fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
    }

    printk("DEBUG_IMX296: get_fmt called with pad: %u, which: %u\n", fmt->pad, fmt->which);
    printk("DEBUG_IMX296: width: %d, height: %d, code: %d, field: %d\n", fmt->format.width, fmt->format.height, fmt->format.code, fmt->format.field);

    mutex_unlock(&imx296->mutex);

    return 0;
}

static int imx296_set_fmt(struct v4l2_subdev *sd,
    struct v4l2_subdev_state *state,
    struct v4l2_subdev_format *fmt)
{
    struct imx296 *imx296 = to_imx296(sd);
    // struct v4l2_mbus_framefmt *format;

    printk("in set fmt\n");
    
    mutex_lock(&imx296->mutex);

    fmt->format.width = IMX296_PIXEL_ARRAY_WIDTH;
    fmt->format.height = IMX296_PIXEL_ARRAY_HEIGHT;
    fmt->format.code = IMX296_FRAME_CODE;
    fmt->format.field = V4L2_FIELD_NONE;

    fmt->format.colorspace = V4L2_COLORSPACE_RAW;
    fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
    fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
    fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;

    // if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
    //     format = v4l2_subdev_get_try_format(sd, state, fmt->pad);
    //     // *v4l2_subdev_get_try_format(sd, state, fmt->pad) = fmt->format;
    // }
    // else {
    //     if (imx296->link_freq)
    //         __v4l2_ctrl_s_ctrl(imx296->link_freq, imx296_link_freqs[0]);
    //     if (imx296->pixel_rate)
    //         __v4l2_ctrl_s_ctrl_int64(imx296->pixel_rate, imx296_pixel_rate[0]);
    // }

    // *format = fmt->format;

    printk("DEBUG_IMX296: width: %d, height: %d, code: %d, field: %d\n", fmt->format.width, fmt->format.height, fmt->format.code, fmt->format.field);

    mutex_unlock(&imx296->mutex);

    return 0;
}

static int imx296_get_mbus_config(
    struct v4l2_subdev *sd, 
    unsigned int pad_id, 
    struct v4l2_mbus_config *config)
{
    config->type = V4L2_MBUS_CSI2_DPHY;
    config->bus.mipi_csi2.num_data_lanes = 2;

    return 0;
}

static int __imx296_power_on(struct imx296 *imx296)
{
    if (imx296->pwdn_gpio)
        gpiod_set_value_cansleep(imx296->pwdn_gpio, 1);

    usleep_range(1500, 2000);

    if (imx296->clk) {
        clk_prepare_enable(imx296->clk);
    }

    return 0;
}

static int __imx296_power_off(struct imx296 *imx296)
{
    if (imx296->clk){
        clk_disable_unprepare(imx296->clk);
    }

    if (imx296->pwdn_gpio)
        gpiod_set_value_cansleep(imx296->pwdn_gpio, 0);

    return 0;
}

static int imx296_runtime_resume(struct device *dev)
{
    struct i2c_client *client = to_i2c_client(dev);
    struct v4l2_subdev *sd = i2c_get_clientdata(client);
    struct imx296 *imx296 = to_imx296(sd);

    dev_info(dev, "imx296 power on\n");
    return __imx296_power_on(imx296);
}

static int imx296_runtime_suspend(struct device *dev)
{
    struct i2c_client *client = to_i2c_client(dev);
    struct v4l2_subdev *sd = i2c_get_clientdata(client);
    struct imx296 *imx296 = to_imx296(sd);

    dev_info(dev, "imx296 power off\n");
    return __imx296_power_off(imx296);
}

static int imx296_check_sensor_id(struct imx296 *imx296)
{
    struct i2c_client *client = imx296->client;
    u32 val = 0;
    int model, ret;

    ret = imx296_write_reg(client, IMX296_CTRL00, 0);
    if (ret < 0) {
        dev_err(&client->dev, "Failed to exit standby (%d)\n", ret);
        return ret;
    }

    usleep_range(2000, 5000);

    ret = imx296_read_reg(client, IMX296_SENSOR_INFO, &val);
    if (ret < 0) {
        dev_err(&client->dev, "Failed to read sensor info\n");
        goto done;
    }

    model = (val >> 6) & 0x1ff;

    if (model != 296 && model != 297) {
        dev_err(&client->dev, "Invalid device model IMX%u (raw: 0x%04x)\n", model, val);
        ret = -ENODEV;
        goto done;
    }

    dev_info(&client->dev, "Found IMX%u Sensor ID!\n", model);
    ret = 0;

done:
    imx296_write_reg(client, IMX296_CTRL00, IMX296_CTRL00_STANDBY);
    return ret;
}

/* 3. Probe 函数：只做最核心的注册动作 */
static int imx296_probe(struct i2c_client *client)
{
    struct device *dev = &client->dev;
    struct device_node *node = dev->of_node;
    struct device_node *endpoint;
    unsigned long rate;
    struct imx296 *imx296;
    struct v4l2_subdev *sd;
    int ret;

    printk("--- [IMX296] Probe Start ---\n");

    imx296 = devm_kzalloc(dev, sizeof(*imx296), GFP_KERNEL);
    if (!imx296) return -ENOMEM;

    ret = of_property_read_u32(node, RKMODULE_CAMERA_MODULE_INDEX, &imx296->module_index);
    ret |= of_property_read_string(node, RKMODULE_CAMERA_MODULE_FACING, &imx296->module_facing);
    ret |= of_property_read_string(node, RKMODULE_CAMERA_MODULE_NAME, &imx296->module_name);
    if (ret) return -EINVAL;

    imx296->client = client;

    imx296->pwdn_gpio = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);

    imx296->clk = devm_clk_get(dev, "xvclk");
    if (IS_ERR(imx296->clk)) {
        dev_err(dev, "Failed get RK3588 clock\n");
        return PTR_ERR(imx296->clk);
    }

    rate = clk_get_rate(imx296->clk);
    dev_info(dev, "Clock frequency from DTS: %lu Hz\n", rate);

    ret = clk_set_rate(imx296->clk, 37125000);
    if (ret) {
        dev_err(dev, "Failed set RK3588 clock 37125000");
        // clk_put(imx296->clk);
        return ret;
    }

    /* A. 解析 Endpoint (握手的前提) */
    endpoint = of_graph_get_next_endpoint(node, NULL);
    if (!endpoint) return -EINVAL;
    v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), &imx296->bus_cfg);
    of_node_put(endpoint);

    mutex_init(&imx296->mutex);

    /* B. 初始化 Subdev */
    sd = &imx296->subdev;
    imx296_entity_init_cfg(sd, NULL);

    v4l2_ctrl_handler_init(&imx296->ctrls, 2);

    imx296->link_freq = v4l2_ctrl_new_int_menu(&imx296->ctrls, NULL, V4L2_CID_LINK_FREQ, 
                                               ARRAY_SIZE(imx296_link_freqs) - 1, 0, imx296_link_freqs);
    imx296->pixel_rate = v4l2_ctrl_new_std(&imx296->ctrls, NULL, V4L2_CID_PIXEL_RATE, 
                                           0, imx296_pixel_rate[0], 1, imx296_pixel_rate[0]);

    sd->ctrl_handler = &imx296->ctrls;

    if (imx296->ctrls.error) {
        ret = imx296->ctrls.error;
        goto err_free_handler;
    }

    v4l2_i2c_subdev_init(sd, client, &imx296_subdev_ops);

    sd->internal_ops = &imx296_internal_ops;
    sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
    sd->dev = &client->dev;
    sd->entity.ops = &imx296_subdev_entity_ops;
    sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;

    imx296->pad.flags = MEDIA_PAD_FL_SOURCE;
    ret = media_entity_pads_init(&sd->entity, 1, &imx296->pad);
    if (ret < 0) goto err_free_handler;

    ret = __imx296_power_on(imx296);
    if (ret) goto err_clean_entity;

    ret = imx296_check_sensor_id(imx296);
    if (ret) goto err_power_off;

    /* D. 名字拼装 (名字一定要对齐) */
    snprintf(sd->name, sizeof(sd->name), "m%02d_%c_%s %s", imx296->module_index, 
             imx296->module_facing[0], IMX296_NAME, dev_name(dev));

    /* E. 异步注册 */
    ret = v4l2_async_register_subdev_sensor(sd);
    if (ret) {
        printk("--- [IMX296] Register Failed: %d ---\n", ret);
        goto err_power_off;
    }

    pm_runtime_set_active(dev);
    pm_runtime_enable(dev);
    pm_runtime_idle(dev);

    printk("--- [IMX296] Register Success, Waiting for Handshake... ---\n");
    return 0;

err_power_off:
    __imx296_power_off(imx296);
err_clean_entity:
    media_entity_cleanup(&sd->entity);
err_free_handler:
    v4l2_ctrl_handler_free(&imx296->ctrls);

    mutex_destroy(&imx296->mutex);

    return ret;
}

static void imx296_remove(struct i2c_client *client)
{
    struct v4l2_subdev *sd = i2c_get_clientdata(client);
    struct imx296 *imx296 = to_imx296(sd);

    v4l2_async_unregister_subdev(sd);
    media_entity_cleanup(&sd->entity);

    v4l2_subdev_cleanup(sd);
    v4l2_ctrl_handler_free(&imx296->ctrls);

    mutex_destroy(&imx296->mutex);

    pm_runtime_disable(&client->dev);
    if (!pm_runtime_status_suspended(&client->dev)) {
        __imx296_power_off(imx296);
    }
    pm_runtime_set_suspended(&client->dev);
}

static const struct of_device_id imx296_of_match[] = {
    { .compatible = "sony,imx296" },
    { },
};

static struct i2c_driver imx296_i2c_driver = {
    .probe_new = imx296_probe,
    .remove = imx296_remove,
    .driver = {
        .name = IMX296_NAME,
        .pm = &imx296_pm_ops,
        .of_match_table = imx296_of_match,
    },
};

module_i2c_driver(imx296_i2c_driver);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("Sony IMX296 Sensor Driver for RK3588");