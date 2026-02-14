KSRC := /home/lx/rk3588_sdk/lubancat_imx296/ubuntu-rockchip/kernel-6.1
KOBJ := /home/lx/rk3588_sdk/lubancat_imx296/ubuntu-rockchip/build/linux-rockchip

CROSS_COMPILE := aarch64-linux-gnu-
export ARCH := arm64

PWD := $(shell pwd)

obj-m += src/imx296.o

all:
	$(MAKE) -C $(KSRC) O=$(KOBJ) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) modules
clean:
	$(MAKE) -C $(KSRC) O=$(KOBJ) M=$(PWD) clean