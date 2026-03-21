---
name: linux-driver-development
description: >
  A structured 8-stage workflow for writing Linux kernel device drivers from scratch. Use this skill whenever the user wants to write a kernel module, device driver, or kernel subsystem integration — including character devices, block devices, network drivers, platform drivers, PCI drivers, USB drivers, I2C/SPI peripheral drivers, or any kernel-space code that interfaces with hardware. Also trigger when the user asks about device tree bindings, ACPI tables, probe/remove lifecycle, runtime power management, devm_ resource management, or how to register with a kernel subsystem (misc, input, IIO, regulator, etc.). If someone says "how do I write a driver for X" or "I need a kernel module that talks to Y hardware" — use this skill immediately.
---

# Linux Driver Development

You guide developers through writing a correct, idiomatic Linux kernel driver from scratch, stage by stage. The output is real, compilable kernel code with explanations of *why* each piece works the way it does — not just boilerplate to copy.

## How to use this skill

When a user asks to write a driver (or asks how to start), work through the 8 stages below. You don't need to mechanically complete every stage in sequence — if the user already knows their device type or has existing code, skip or compress the early stages. The goal is always to produce working, mergeable-quality code with enough explanation that the developer understands what they built.

**Always produce compilable code.** Skeleton code with `/* TODO */` stubs is fine for later stages, but every code block you emit should be syntactically correct C that a developer can actually `make` and `insmod`.

---

## Stage 1 — Identify Device Type

Determine which kernel subsystem owns this hardware. The choice drives everything else — the API, the registration mechanism, the probe/remove callbacks, and the sysfs/devnode interface.

| Device class | Kernel subsystem | Registration function | User interface |
|---|---|---|---|
| Simple char device | misc or cdev | `misc_register()` / `cdev_add()` | `/dev/mydev` |
| Memory-mapped peripheral | platform | `platform_driver_register()` | sysfs |
| PCI/PCIe card | PCI | `pci_register_driver()` | `/dev/` or net |
| USB device | USB | `usb_register()` | varies |
| I2C sensor/peripheral | I2C client | `i2c_add_driver()` | IIO / hwmon / input |
| SPI device | SPI | `spi_register_driver()` | IIO / misc |
| Network adapter | net | `register_netdev()` | `ethN` / `wlanN` |
| Industrial I/O sensor | IIO | `iio_device_register()` | `/sys/bus/iio/` (sysfs reads) or triggered buffer for `iio_readdev` streaming |
| Input device | input | `input_register_device()` | `/dev/input/eventN` |
| Regulator | regulator | `regulator_register()` | regulator framework |
| GPIO controller | gpio/pinctrl | `gpiochip_add_data()` | `/sys/class/gpio/` |
| Block device | block | `add_disk()` | `/dev/sdX` |

Ask the user if it's not obvious. The wrong subsystem choice causes pain later — it's worth spending a sentence or two here to confirm.

---

## Stage 2 — Review Subsystem Architecture

Once the subsystem is identified, orient the developer to how that subsystem works before writing any code. This prevents the common mistake of writing a driver that *compiles* but fights the kernel's model.

Cover these points for the chosen subsystem:

- **Core data structure**: what struct represents this device in the kernel? (e.g., `platform_device`, `pci_dev`, `i2c_client`, `iio_dev`)
- **Ownership model**: who allocates the device struct? (almost always the core, not the driver)
- **Lifecycle**: when does probe run? When does remove run? What triggers them?
- **Resource management**: introduce `devm_*` APIs early — `devm_kzalloc`, `devm_ioremap_resource`, `devm_request_irq`. Explain that `devm_` resources are automatically released on device detach, which eliminates entire classes of resource leak bugs.
- **Locking model**: what locks does the subsystem hold during callbacks? What can you sleep in vs. not?
- **IIO note**: if the subsystem is IIO, clarify the two access modes upfront — (1) **sysfs one-shot reads** (`cat /sys/bus/iio/devices/iio:device0/in_temp_raw`) work with just `iio_device_register()` + `read_raw`; (2) **streaming via `iio_readdev`** requires additional triggered buffer infrastructure (`iio_triggered_buffer_setup()`, `iio_pollfunc_store_time`, hardware or hrtimer trigger). Ask the user which they need before writing code — the implementation differs significantly.

Keep this section concise — one paragraph plus a pointer to relevant kernel docs or a reference driver (`drivers/` tree) is ideal.

---

## Stage 3 — Analyze Existing Drivers

Before writing a line, point the user at 1–2 reference drivers in the kernel tree that are similar to what they're building. Real drivers encode tribal knowledge that no tutorial covers.

Good places to look:

```bash
# Find drivers using the same subsystem
ls drivers/misc/         # simple misc char devices
ls drivers/platform/     # platform drivers
ls drivers/iio/          # IIO sensors by type
ls drivers/net/ethernet/ # network drivers by vendor

# Search for your chip or a similar one
grep -r "YOUR_CHIP_NAME" drivers/ --include="*.c" -l

# Find the simplest driver in a subsystem
wc -l drivers/misc/*.c | sort -n | head -10
```

Recommend starting with the *smallest* driver in the subsystem that does something similar, not the most feature-complete one. Feature-complete drivers are intimidating and full of edge cases that obscure the core pattern.

---

## Stage 4 — Implement Minimal Driver Skeleton

Write the complete, compilable minimum viable driver. This is the foundation everything else builds on.

### Module boilerplate (always required)

```c
// SPDX-License-Identifier: GPL-2.0
/**
 * mydriver.c - Brief description of what this driver does
 *
 * Copyright (C) 2024 Your Name <email@example.com>
 */
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
/* Add subsystem-specific headers after this */

MODULE_AUTHOR("Your Name <email@example.com>");
MODULE_DESCRIPTION("Brief description");
MODULE_LICENSE("GPL");
```

### Makefile

```makefile
# For out-of-tree builds:
obj-m += mydriver.o

KDIR ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

# For in-tree: add obj-y += mydriver.o to the parent Makefile
# and obj-$(CONFIG_MY_DRIVER) += mydriver.o for Kconfig-gated builds
```

### Private state struct

Always define a `struct mydriver_priv` to hold all per-device state. Never use global variables for device state — the kernel may instantiate your driver for multiple devices simultaneously.

```c
struct mydriver_priv {
    struct device *dev;         /* back-pointer for dev_err/dev_info */
    void __iomem *base;         /* MMIO base address, if applicable */
    int irq;                    /* interrupt line, if applicable */
    /* ... subsystem-specific fields ... */
};
```

Use `dev_set_drvdata(dev, priv)` in probe to store this, and `dev_get_drvdata(dev)` in all other callbacks to retrieve it.

---

## Stage 5 — Add Device Tree / ACPI Bindings

For platform drivers (and I2C/SPI devices), hardware description lives in Device Tree or ACPI tables — the driver must declare what it supports.

### Device Tree (ARM/RISC-V/embedded)

**In the driver:**
```c
static const struct of_device_id mydriver_of_match[] = {
    { .compatible = "vendor,mydevice-v1" },
    { .compatible = "vendor,mydevice-v2", .data = &mydevice_v2_cfg },
    { /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, mydriver_of_match);
```

**In a board DTS file:**
```dts
mydevice@40000000 {
    compatible = "vendor,mydevice-v1";
    reg = <0x40000000 0x1000>;   /* MMIO base and size */
    interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
    clocks = <&clk_sys>;
    clock-names = "sys";
    /* vendor-specific properties go here */
};
```

**DT binding schema** (required for upstream submission, good practice always):
Write a YAML schema in `Documentation/devicetree/bindings/` describing every property. The `dt-schema` tool validates DTS files against it.

### ACPI (x86/server)

```c
static const struct acpi_device_id mydriver_acpi_match[] = {
    { "VEND0001", 0 },   /* ACPI HID from vendor */
    { }
};
MODULE_DEVICE_TABLE(acpi, mydriver_acpi_match);
```

**Reading DT properties in probe:**
```c
/* Read a required u32 property */
ret = of_property_read_u32(np, "vendor,timeout-ms", &priv->timeout_ms);
if (ret) {
    dev_err(dev, "missing vendor,timeout-ms property\n");
    return ret;
}

/* Read an optional boolean property */
priv->invert = of_property_read_bool(np, "vendor,active-low");
```

---

## Stage 6 — Implement probe / remove

`probe` is called when the kernel matches your driver to a device. `remove` is called on unbind or module unload. These are the most important functions in your driver.

### probe — the right pattern

```c
static int mydriver_probe(struct platform_device *pdev)
{
    struct device *dev = &pdev->dev;
    struct mydriver_priv *priv;
    struct resource *res;
    int ret;

    /* 1. Allocate private state — devm_ ties lifetime to device */
    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    if (!priv)
        return -ENOMEM;
    priv->dev = dev;
    dev_set_drvdata(dev, priv);

    /* 2. Map hardware resources */
    priv->base = devm_platform_ioremap_resource(pdev, 0);
    if (IS_ERR(priv->base))
        return PTR_ERR(priv->base);

    /* 3. Get and configure clock/reset/regulator if needed */
    priv->clk = devm_clk_get(dev, "sys");
    if (IS_ERR(priv->clk))
        return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get clock\n");
    ret = clk_prepare_enable(priv->clk);
    if (ret)
        return ret;
    /* Note: if using devm_clk_get_enabled(), the enable/disable is automatic */

    /* 4. Get IRQ and register handler */
    priv->irq = platform_get_irq(pdev, 0);
    if (priv->irq < 0)
        return priv->irq;
    ret = devm_request_irq(dev, priv->irq, mydriver_irq_handler,
                           IRQF_SHARED, dev_name(dev), priv);
    if (ret)
        return dev_err_probe(dev, ret, "failed to request IRQ\n");

    /* 5. Initialize hardware to a known state */
    ret = mydriver_hw_init(priv);
    if (ret)
        return ret;

    /* 6. Register with the subsystem (last — device is live after this) */
    ret = misc_register(&priv->miscdev);
    if (ret)
        return dev_err_probe(dev, ret, "failed to register misc device\n");

    dev_info(dev, "mydevice probed successfully\n");
    return 0;
}
```

**Why `devm_` first, subsystem registration last:** if registration fails, the kernel unwinds `devm_` resources automatically. If you registered with the subsystem first, user-space could start making calls before resources are ready.

**Why `dev_err_probe()`:** it suppresses `-EPROBE_DEFER` errors from the log (those are normal — it just means a dependency isn't ready yet and the kernel will retry), and it formats the error message consistently.

### remove

```c
static void mydriver_remove(struct platform_device *pdev)
{
    struct mydriver_priv *priv = dev_get_drvdata(&pdev->dev);

    /* Unregister from subsystem first — stop new user-space calls */
    misc_deregister(&priv->miscdev);

    /* Hardware shutdown */
    mydriver_hw_shutdown(priv);

    /* devm_ resources (IRQ, ioremap, kzalloc) are freed automatically */
}
```

---

## Stage 7 — Add Power Management

Power management is not optional for upstream-quality drivers. Even if the hardware doesn't have aggressive PM, implement the hooks so the system can suspend/resume correctly.

### System sleep (suspend/resume)

**Shortcut when system sleep and runtime idle are the same state:** If your hardware's runtime suspend (e.g., clock gating) is identical to its system sleep state (register state preserved, no power rail cut), route system sleep through the runtime PM callbacks instead of writing a separate implementation:

```c
static const struct dev_pm_ops mydriver_pm_ops = {
    SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
    RUNTIME_PM_OPS(mydriver_runtime_suspend, mydriver_runtime_resume, NULL)
};
```

This avoids duplicating clock-gating logic. Use explicit `suspend`/`resume` callbacks only when system sleep requires more than idle (e.g., saving to NVRAM, cutting a power rail, resetting the device on resume).

**Full system sleep callbacks** (when needed):

```c
static int mydriver_suspend(struct device *dev)
{
    struct mydriver_priv *priv = dev_get_drvdata(dev);

    /* Stop DMA, flush pending work, save state to priv->saved_* */
    mydriver_hw_stop(priv);
    clk_disable_unprepare(priv->clk);
    return 0;
}

static int mydriver_resume(struct device *dev)
{
    struct mydriver_priv *priv = dev_get_drvdata(dev);
    int ret;

    ret = clk_prepare_enable(priv->clk);
    if (ret)
        return ret;
    /* Restore saved state, re-initialize hardware */
    return mydriver_hw_init(priv);
}
```

### Runtime PM (for idle power gating)

```c
/* In probe, after hardware is initialized: */
pm_runtime_set_active(dev);
pm_runtime_enable(dev);

/* In remove, before hardware shutdown: */
pm_runtime_disable(dev);

/* In driver ops that need the device awake: */
ret = pm_runtime_get_sync(dev);
if (ret < 0) {
    pm_runtime_put_noidle(dev);
    return ret;
}
/* ... do work ... */
pm_runtime_put(dev);

/* Runtime PM callbacks: */
static int mydriver_runtime_suspend(struct device *dev) { ... }
static int mydriver_runtime_resume(struct device *dev) { ... }
```

### Wiring it together

```c
static const struct dev_pm_ops mydriver_pm_ops = {
    SYSTEM_SLEEP_PM_OPS(mydriver_suspend, mydriver_resume)
    RUNTIME_PM_OPS(mydriver_runtime_suspend, mydriver_runtime_resume, NULL)
};

static struct platform_driver mydriver_driver = {
    .probe  = mydriver_probe,
    .remove = mydriver_remove,
    .driver = {
        .name           = "mydriver",
        .of_match_table = mydriver_of_match,
        .pm             = pm_ptr(&mydriver_pm_ops),
    },
};
module_platform_driver(mydriver_driver);
```

`pm_ptr()` is a macro that sets the `pm` field to NULL when `CONFIG_PM` is disabled, avoiding dead code.

---

## Stage 8 — Add Error Handling

Correct error handling is what separates a toy driver from a production-quality one. The kernel enforces strict rules about cleanup order and resource ownership.

### The devm_ philosophy

Prefer `devm_*` variants of every resource allocation function. They register a cleanup callback that runs when the device is detached, in reverse order of registration — like a LIFO stack. This means you almost never need explicit cleanup code in the probe error path.

```c
/* Prefer this: */
priv->buf = devm_kzalloc(dev, size, GFP_KERNEL);

/* Over this: */
priv->buf = kzalloc(size, GFP_KERNEL);
/* ...now you must remember to kfree() in every error path and in remove() */
```

### Error logging conventions

```c
/* dev_err_probe() — use in probe for errors from deferred dependencies */
return dev_err_probe(dev, ret, "failed to get regulator: %d\n", ret);
/* (suppresses -EPROBE_DEFER from dmesg — those are normal and verbose) */

/* dev_err() — use everywhere else */
dev_err(dev, "hardware init failed: %d\n", ret);

/* dev_warn() — for recoverable issues */
dev_warn(dev, "IRQ not available, falling back to polling\n");

/* Never use printk() in drivers — always use dev_*() or pr_*() */
```

### IS_ERR / PTR_ERR

```c
/* Functions that return an ERR_PTR use this pattern: */
priv->regmap = devm_regmap_init_mmio(dev, priv->base, &mydriver_regmap_cfg);
if (IS_ERR(priv->regmap))
    return dev_err_probe(dev, PTR_ERR(priv->regmap), "regmap init failed\n");
```

### IRQ handler rules

```c
static irqreturn_t mydriver_irq_handler(int irq, void *data)
{
    struct mydriver_priv *priv = data;
    u32 status;

    /* Read and clear interrupt status atomically */
    status = readl(priv->base + REG_IRQ_STATUS);
    if (!(status & EXPECTED_IRQ_BITS))
        return IRQ_NONE;    /* Not our interrupt (shared IRQ line) */

    writel(status, priv->base + REG_IRQ_CLEAR);

    /* For heavy work, schedule a workqueue or threaded IRQ */
    /* Do NOT sleep, allocate memory, or take non-IRQ-safe locks here */
    wake_up(&priv->wait_queue);

    return IRQ_HANDLED;
}
```

---

## Output format

For each stage you complete, produce:

1. **Explanation** (2–4 sentences): what this stage does and why it matters
2. **Code block(s)**: complete, compilable C code with inline comments explaining non-obvious choices
3. **What to verify**: how to confirm this stage works before proceeding (insmod, dmesg, sysfs check, etc.)

If the user wants the full driver in one pass, produce all stages in sequence. If they're working iteratively, complete one stage at a time and wait for confirmation before proceeding.

### Verification commands (use throughout)

```bash
# Build out-of-tree
make -C /lib/modules/$(uname -r)/build M=$PWD modules

# Load and check
sudo insmod mydriver.ko
dmesg | tail -20

# Verify probe ran
ls /sys/bus/platform/drivers/mydriver/
cat /sys/bus/platform/drivers/mydriver/*/uevent

# Check sysfs attributes
ls /sys/class/misc/mydevice/

# Unload cleanly
sudo rmmod mydriver
dmesg | tail -5   # Should show no errors/warnings on unload
```

---

## Upstream submission checklist

If the user plans to submit to mainline, remind them of these requirements at the end:

- [ ] `checkpatch.pl --strict` passes with 0 errors
- [ ] DT binding YAML schema written and validated with `dt-schema`
- [ ] `sparse` and `smatch` static analysis clean
- [ ] Tested with `CONFIG_DEBUG_LOCK_ALLOC`, `CONFIG_LOCKDEP`, `CONFIG_KASAN` enabled
- [ ] Power management tested: `echo mem > /sys/power/state` suspend/resume cycle
- [ ] Cover letter describes what the hardware does, links to datasheet
- [ ] `get_maintainer.pl` used to find the right mailing list and reviewer
