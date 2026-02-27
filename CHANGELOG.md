## [v1.0] - 2026-02-12
### Added
- **硬件功能**: 将设备树`rk3588-lubancat-5io-csi.dtsi`修改成和imx415一致的格式。
- **内核**: 修改`kernel/aarch/arm64/config/rockchip_linux_defconfig`文件，将`CONFIG_VIDEO_ROCKCHIP_CIF`、`CONFIG_VIDEO_ROCKCHIP_ISP`、`CONFIG_VIDEO_ROCKCHIP_ISPP`、`CONFIG_PHY_ROCKCHIP_CSI2_DPHY`,由y设置为m，编译内核生成了独立的4个模块。并将4个模块添加至上电黑名单，防止其上电自动运行。
- **程序代码**: 在`enum_frame_interval`对应的回调函数中添加了图像长宽、间隔时间、编码格式的设定，修正了`rkcif_alloc_buffer failed ret:-22`的报错问题。

### Bug
- 在加载完驱动和系统环境之后，使用取数指令抓取原始数据，驱动依旧会存在无响应的问题。该问题后续需要查找修正。

## [v1.1] - 2026-02-25
### Added
- **硬件功能**: 将设备树`rk3588-lubancat-5io-csi.dtsi`修改成lane数量为1。
- **程序代码**: 在驱动中，设置为lane数量为1，帧率为60，pixel rate为1188MHz。参照isx031的驱动，在程序中添加了必要的回调函数。对`imx296_setup`函数内部设置参数进行了微调。

### Bug
- 能够正常输出raw格式数据，一帧数据大小为2228224，但dmesg中依旧会有`mipi0-csi2-hw ERR1:0x100 (f_seq,vc: 0)`错误打印。

## [v1.2] - 2026-02-26
### Added
- **程序代码**: 在驱动中，添加了vblank和hblank的相关设置功能。优化了probe的代码结构，将相关功能提取到`imx296_ctrls_init`和`imx296_subdev_init`函数中。目前抓取摄像头原始数据时，`dmesg`中已经没有了`f_seq`和`get vblank fail`的错误警告信息。isp相关的参数写入的是死值，不可调整。

## [v1.3] - 2026-02-27
### Added
- **程序代码**: 在驱动中，添加了`imx296_s_ctrl`函数的定义，能够使用v4l2-ctl指令，在线对摄像头的曝光时间、增益补偿量和vblank数值进行设置。可开启3588系统自带的guvcview软件，选择`rkisp_mainpath`节点，进行实时查看nv12格式的画面。因为没有进行自动调节和白平衡调节，所以画面偏绿偏暗，且会有横向条纹。
