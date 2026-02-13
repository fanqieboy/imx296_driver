## [v1.0] - 2026-02-12
### Added
- **硬件功能**: 将设备树`rk3588-lubancat-5io-csi.dtsi`修改成和imx415一致的格式。
- **内核**: 修改`kernel/aarch/arm64/config/rockchip_linux_defconfig`文件，将`CONFIG_VIDEO_ROCKCHIP_CIF`、`CONFIG_VIDEO_ROCKCHIP_ISP`、`CONFIG_VIDEO_ROCKCHIP_ISPP`、`CONFIG_PHY_ROCKCHIP_CSI2_DPHY`,由y设置为m，编译内核生成了独立的4个模块。并将4个模块添加至上电黑名单，防止其上电自动运行。
- **程序代码**: 在`enum_frame_interval`对应的回调函数中添加了图像长宽、间隔时间、编码格式的设定，修正了`rkcif_alloc_buffer failed ret:-22`的报错问题。

### Bug
- 在加载完驱动和系统环境之后，使用取数指令抓取原始数据，驱动依旧会存在无响应的问题。该问题后续需要查找修正。