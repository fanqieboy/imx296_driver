#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/export-internal.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif


static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x3b041f4, "i2c_register_driver" },
	{ 0xb6e6d99d, "clk_disable" },
	{ 0xb077e70a, "clk_unprepare" },
	{ 0xb431b4ce, "gpiod_set_value_cansleep" },
	{ 0xa6b29cb3, "_dev_info" },
	{ 0x92997ed8, "_printk" },
	{ 0x5b1db3f9, "mutex_lock" },
	{ 0x107491dd, "mutex_unlock" },
	{ 0x3ea1b6e4, "__stack_chk_fail" },
	{ 0xc2413246, "i2c_transfer" },
	{ 0xdcb764ad, "memset" },
	{ 0x5792f848, "strlcpy" },
	{ 0xed5ce3ce, "v4l2_async_unregister_subdev" },
	{ 0xe8e90bbf, "v4l2_subdev_cleanup" },
	{ 0xdf22226b, "v4l2_ctrl_handler_free" },
	{ 0x9947e844, "__pm_runtime_disable" },
	{ 0x6620daa8, "__pm_runtime_set_status" },
	{ 0x1db13024, "i2c_del_driver" },
	{ 0xc3055d20, "usleep_range_state" },
	{ 0x7c9a7371, "clk_prepare" },
	{ 0x815588a6, "clk_enable" },
	{ 0x9043039f, "devm_kmalloc" },
	{ 0x4bf1939c, "of_property_read_variable_u32_array" },
	{ 0x9ae4e63a, "of_property_read_string" },
	{ 0xd48b94f3, "devm_gpiod_get_optional" },
	{ 0xb82acaed, "devm_clk_get" },
	{ 0x713584f, "_dev_err" },
	{ 0x556e4390, "clk_get_rate" },
	{ 0x76d9b876, "clk_set_rate" },
	{ 0x5bc579b9, "of_graph_get_next_endpoint" },
	{ 0xb9a71ac0, "v4l2_fwnode_endpoint_parse" },
	{ 0x99e2ab4b, "of_node_put" },
	{ 0xa9325e33, "__mutex_init" },
	{ 0x88dfb97b, "v4l2_ctrl_handler_init_class" },
	{ 0xc66e33a2, "v4l2_ctrl_new_int_menu" },
	{ 0x2a88710, "v4l2_ctrl_new_std" },
	{ 0x59b40a52, "v4l2_i2c_subdev_init" },
	{ 0x15c00612, "media_entity_pads_init" },
	{ 0x656e4a6e, "snprintf" },
	{ 0x1b598e20, "v4l2_async_register_subdev_sensor" },
	{ 0xe7dff6cf, "pm_runtime_enable" },
	{ 0xbc5ce1cd, "__pm_runtime_idle" },
	{ 0xcd66e7f8, "__pm_runtime_resume" },
	{ 0x85558f46, "v4l2_subdev_link_validate" },
	{ 0x5b77efca, "module_layout" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "3FE3110BF7606D4F645D070");
