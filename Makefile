KSRC := /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1
KOBJ := /home/lx/3588sdk/raw/ubuntu-rockchip/build/linux-rockchip

CROSS_COMPILE := aarch64-linux-gnu-
export ARCH := arm64

obj-m += src/imx296.o

all:
	$(MAKE) -C $(KSRC) O=$(KOBJ) M=$(PWD) CROSS_COMPILE=$(CROSS_COMPILE) modules
clean:
	$(MAKE) -C $(KSRC) O=$(KOBJ) M=$(PWD) clean