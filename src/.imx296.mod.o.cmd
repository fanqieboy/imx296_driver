cmd_/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o := aarch64-linux-gnu-gcc -Wp,-MMD,/home/lx/3588_drivers/camera_driver_ws/src/.imx296.mod.o.d -nostdinc -I/home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include -I./arch/arm64/include/generated -I/home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include -I./include -I/home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi -I./include/generated/uapi -include /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler-version.h -include /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kconfig.h -include /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT= -fmacro-prefix-map=/home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=1 -Wno-psabi -mabi=lp64 -fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protection=pac-ret+leaf -Wa,-march=armv8.5-a -DARM64_ASM_ARCH='"armv8.5-a"' -DKASAN_SHADOW_SCALE_SHIFT= -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -Os --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=1336 -DMODULE -DKBUILD_BASENAME='"imx296.mod"' -DKBUILD_MODNAME='"imx296"' -D__KBUILD_MODNAME=kmod_imx296 -c -o /home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o /home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.c

source_/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o := /home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.c

deps_/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o := \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/RETPOLINE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler_attributes.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler-gcc.h \
    $(wildcard include/config/GCC_ASM_GOTO_OUTPUT_WORKAROUND) \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/compiler.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/ARCH_WANTS_MODULES_DATA_IN_VMALLOC) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/list.h \
    $(wildcard include/config/DEBUG_LIST) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/container_of.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/build_bug.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/compiler_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/rwonce.h \
    $(wildcard include/config/LTO) \
    $(wildcard include/config/AS_HAS_LDAPR) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/rwonce.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/int-ll64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/int-ll64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitsperlong.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/bitsperlong.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/posix_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/stddef.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/stddef.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/posix_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/posix_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/err.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/errno.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/errno-base.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/const.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/const.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/const.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/barrier.h \
    $(wildcard include/config/ARM64_PSEUDO_NMI) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/barrier.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/stat.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/COMPAT) \
  arch/arm64/include/generated/uapi/asm/stat.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/stat.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/kernel.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/sysinfo.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/cache.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bitops.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bits.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/bits.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/typecheck.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/generic-non-atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/bitops.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/builtin-__ffs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/builtin-ffs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/builtin-__fls.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/builtin-fls.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/ffz.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/fls64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/sched.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/hweight.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/arch_hweight.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/const_hweight.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/cmpxchg.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/ARM64_LSE_ATOMICS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/atomic_ll_sc.h \
    $(wildcard include/config/CC_HAS_K_CONSTRAINT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/stringify.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/atomic/atomic-long.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/atomic/atomic-instrumented.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/instrumented.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kmsan-checks.h \
    $(wildcard include/config/KMSAN) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/instrumented-atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/lock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/instrumented-lock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/non-atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/non-instrumented-non-atomic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/le.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/byteorder.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/byteorder/little_endian.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/byteorder/little_endian.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/swab.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/swab.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/byteorder/generic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kasan-enabled.h \
    $(wildcard include/config/KASAN) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/static_key.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/bug.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/brk-imm.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/once_lite.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/stdarg.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/init.h \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
    $(wildcard include/config/STRICT_KERNEL_RWX) \
    $(wildcard include/config/STRICT_MODULE_RWX) \
    $(wildcard include/config/LTO_CLANG) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kern_levels.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/TRIM_UNUSED_KSYMS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/linkage.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ratelimit_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/param.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/param.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/param.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/spinlock_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/qrwlock_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/dynamic_debug.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/cputype.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/BROKEN_GAS_INST) \
    $(wildcard include/config/ARM64_PA_BITS_52) \
    $(wildcard include/config/ARM64_4K_PAGES) \
    $(wildcard include/config/ARM64_16K_PAGES) \
    $(wildcard include/config/ARM64_64K_PAGES) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kasan-tags.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/gpr-num.h \
  arch/arm64/include/generated/asm/sysreg-defs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bitfield.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/alternative.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/alternative-macros.h \
  arch/arm64/include/generated/asm/cpucaps.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/insn-def.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/mte-def.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/math.h \
  arch/arm64/include/generated/asm/div64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/div64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/math64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/time64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/time64.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/time.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/time_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/time32.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/timex.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/timex.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/timex.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/ARM_ARCH_TIMER_OOL_WORKAROUND) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/hwcap.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/hwcap.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/ARM64_PAN) \
    $(wildcard include/config/ARM64_SW_TTBR0_PAN) \
    $(wildcard include/config/ARM64_SVE) \
    $(wildcard include/config/ARM64_SME) \
    $(wildcard include/config/ARM64_CNP) \
    $(wildcard include/config/ARM64_PTR_AUTH) \
    $(wildcard include/config/ARM64_MTE) \
    $(wildcard include/config/ARM64_DEBUG_PRIORITY_MASKING) \
    $(wildcard include/config/ARM64_BTI) \
    $(wildcard include/config/ARM64_TLB_RANGE) \
    $(wildcard include/config/ARM64_PA_BITS) \
    $(wildcard include/config/ARM64_HW_AFDBM) \
    $(wildcard include/config/ARM64_AMU_EXTN) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
    $(wildcard include/config/PROVE_LOCKING) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/align.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/limits.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/limits.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/limits.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kstrtox.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/minmax.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/instruction_pointer.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/DEBUG_PREEMPT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/errno.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/errno.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bitmap.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/find.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/overflow.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/string.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/string.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/gfp_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/numa.h \
    $(wildcard include/config/NODES_SHIFT) \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/smp_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/cleanup.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/preempt.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/HARDENED_USERCOPY) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/restart_block.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/current.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/thread_info.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/ARM64_VA_BITS) \
    $(wildcard include/config/KASAN_SHADOW_OFFSET) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/EFI) \
    $(wildcard include/config/ARM_GIC_V3_ITS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sizes.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/ARM64_PAGE_SHIFT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
    $(wildcard include/config/SPARSEMEM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/pfn.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/stack_pointer.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/ARM64_ACPI_PARKING_PROTOCOL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/percpu.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/percpu.h \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/ARM_ARCH_TIMER) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/timecounter.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/timex.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/time32.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/time.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/compat.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/IOMMU_SVA) \
    $(wildcard include/config/CPU_SUP_INTEL) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/ARCH_TASK_STRUCT_ON_STACK) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/DEBUG_RSEQ) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/sched.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/pid.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/irqflags.h \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/irqflags.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/ptrace.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/ptrace.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/sve_context.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bottom_half.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/KUSER_HELPERS) \
    $(wildcard include/config/ARM64_FORCE_52BIT) \
    $(wildcard include/config/HAVE_HW_BREAKPOINT) \
    $(wildcard include/config/ARM64_PTR_AUTH_KERNEL) \
    $(wildcard include/config/ARM64_TAGGED_ADDR_ABI) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/processor.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/vdso/processor.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/hw_breakpoint.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/virt.h \
    $(wildcard include/config/KVM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/sections.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/sections.h \
    $(wildcard include/config/HAVE_FUNCTION_DESCRIPTORS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/kasan.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/mte-kasan.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/pgtable-types.h \
    $(wildcard include/config/PGTABLE_LEVELS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/pgtable-nop4d.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/ARM64_CONT_PTE_SHIFT) \
    $(wildcard include/config/ARM64_CONT_PMD_SHIFT) \
    $(wildcard include/config/ARM64_VA_BITS_52) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/pointer_auth.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/prctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/once.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/random.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/ioctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/ioctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/irqnr.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/irqnr.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/prandom.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/percpu.h \
    $(wildcard include/config/NEED_PER_CPU_EMBED_FIRST_CHUNK) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/archrandom.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/arm-smccc.h \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/HAVE_ARM_SMCCC) \
    $(wildcard include/config/ARM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/spectre.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/fpsimd.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/sigcontext.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcutree.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/wait.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/spinlock.h \
  arch/arm64/include/generated/asm/mmiowb.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/spinlock_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rwlock_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/spinlock.h \
  arch/arm64/include/generated/asm/qspinlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/qspinlock.h \
  arch/arm64/include/generated/asm/qrwlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/qrwlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rwlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/wait.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/refcount.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sem.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/sem.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ipc.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/highuid.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rhashtable-types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mutex.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/osq_lock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/debug_locks.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ktime.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/jiffies.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/vdso/ktime.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/clocksource_ids.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/ipcbuf.h \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/sembuf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/shm.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/page.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/personality.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/personality.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/getorder.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/shm.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/shmbuf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/shmparam.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/shmparam.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kmsan_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/plist.h \
    $(wildcard include/config/DEBUG_PLIST) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/hrtimer_defs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rbtree.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rbtree_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/seqlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/timerqueue.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/seccomp.h \
    $(wildcard include/config/SECCOMP) \
    $(wildcard include/config/HAVE_ARCH_SECCOMP_FILTER) \
    $(wildcard include/config/SECCOMP_FILTER) \
    $(wildcard include/config/CHECKPOINT_RESTORE) \
    $(wildcard include/config/SECCOMP_CACHE_DEBUG) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/seccomp.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/seccomp.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/unistd.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/unistd.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/unistd.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/seccomp.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/unistd.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/resource.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/resource.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/resource.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/latencytop.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/prio.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/signal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/signal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/signal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/signal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/signal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/signal-defs.h \
  arch/arm64/include/generated/uapi/asm/siginfo.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/siginfo.h \
  arch/arm64/include/generated/uapi/asm/siginfo.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/syscall_user_dispatch.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
    $(wildcard include/config/SPLIT_PTLOCK_CPUS) \
    $(wildcard include/config/ARCH_ENABLE_SPLIT_PMD_PTLOCK) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/posix-timers.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/rseq.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kcsan.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  arch/arm64/include/generated/asm/kmap_size.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/task_stack.h \
    $(wildcard include/config/STACK_GROWSUP) \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/magic.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/stat.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/buildid.h \
    $(wildcard include/config/CRASH_CORE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/KSM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/auxvec.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/auxvec.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/auxvec.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kref.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE_VERBOSE) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/completion.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/swait.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/uprobes.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/uprobes.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/debug-monitors.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/esr.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/insn.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/probes.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/sparsemem.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/mmu.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kmod.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/umh.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/PM_SLEEP) \
    $(wildcard include/config/CONTIG_ALLOC) \
    $(wildcard include/config/CMA) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/page-flags.h \
    $(wildcard include/config/ARCH_USES_PG_UNCACHED) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/local_lock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/local_lock_internal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/memory_hotplug.h \
    $(wildcard include/config/HAVE_ARCH_NODEDATA_EXTENSION) \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/notifier.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/SRCU) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcu_segcblist.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/srcutree.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/arch_topology.h \
    $(wildcard include/config/ACPI_CPPC_LIB) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/topology.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/topology.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/sysctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/elf.h \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/elf.h \
    $(wildcard include/config/COMPAT_VDSO) \
  arch/arm64/include/generated/asm/user.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/user.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/elf.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/elf-em.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/fs.h \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/wait_bit.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kdev_t.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/kdev_t.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/dcache.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rculist_bl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/list_bl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/bit_spinlock.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/path.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/list_lru.h \
    $(wildcard include/config/MEMCG_KMEM) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kconfig.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/mm.h \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ioasid.h \
    $(wildcard include/config/IOASID) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/radix-tree.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/capability.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/capability.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/semaphore.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/fcntl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/uapi/asm/fcntl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/asm-generic/fcntl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/openat2.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/migrate_mode.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/percpu-rwsem.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcuwait.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
    $(wildcard include/config/PROC_FS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/jobctl.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/uaccess.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/kernel-pgtable.h \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/boot.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/asm-extable.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/mte.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/cred.h \
    $(wildcard include/config/DEBUG_CREDENTIALS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/WATCH_QUEUE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/percpu_counter.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ratelimit.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rcu_sync.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/delayed_call.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/uuid.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/uuid.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/errseq.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/ioprio.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sched/rt.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/ioprio.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/fs_types.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mount.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/mnt_idmapping.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/slab.h \
    $(wildcard include/config/DEBUG_SLAB) \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/ROCKCHIP_KMALLOC_NO_USE_ARCH_DMA_MINALIGN) \
    $(wildcard include/config/SLAB) \
    $(wildcard include/config/SLUB) \
    $(wildcard include/config/SLOB) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/percpu-refcount.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/fs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/dqblk_xfs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/dqblk_v1.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/dqblk_v2.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/dqblk_qtree.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/projid.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/uapi/linux/quota.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/nfs_fs_i.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/sysfs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/idr.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/kobject_ns.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/IA64) \
    $(wildcard include/config/PPC64) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/rbtree_latch.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/error-injection.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/error-injection.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/tracepoint-defs.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/module.h \
    $(wildcard include/config/ARM64_MODULE_PLTS) \
    $(wildcard include/config/DYNAMIC_FTRACE) \
    $(wildcard include/config/ARM64_ERRATUM_843419) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
    $(wildcard include/config/MODULES_USE_ELF_REL) \
    $(wildcard include/config/MODULES_USE_ELF_RELA) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/build-salt.h \
    $(wildcard include/config/BUILD_SALT) \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/elfnote.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/elfnote-lto.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/export-internal.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/include/linux/vermagic.h \
    $(wildcard include/config/PREEMPT_BUILD) \
  include/generated/utsrelease.h \
  /home/lx/3588sdk/raw/ubuntu-rockchip/kernel-6.1/arch/arm64/include/asm/vermagic.h \

/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o: $(deps_/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o)

$(deps_/home/lx/3588_drivers/camera_driver_ws/src/imx296.mod.o):
