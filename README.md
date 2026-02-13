# imx296_driver

基于 V4L2 框架的 Sony IMX296 传感器 Linux 驱动。
使用Lanes数量为2

## 1. 项目简介
* **平台**: Rockchip RK3588
* **内核**: Linux Kernel 6.1
* **接口**: MIPI CSI-2
* **功能**: 支持基本影像捕获、增益/曝光控制、触发模式。

## 2. 硬件连接
| 信号线 | SoC 引脚 | 备注 |
| :--- | :--- | :--- |
| MIPI_CLK | MIPI_CSI0_CLK | |
| I2C_ADDR | $0x1A$ | 默认 I2C 地址 |

## 3. 编译与运行
可结合`Makefile`进行编译
```bash
# 清除文件
make clean

# 编译驱动
make

# 加载驱动
sudo insmod imx296.ko
```
