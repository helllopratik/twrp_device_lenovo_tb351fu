#!/bin/bash
# Automatically clean up the problematic root/vendor directory before each build
rm -rf out/target/product/tb351fu/root/vendor
rm -rf out/target/product/tb351fu/recovery/root/vendor

# Path to the prebuilt stock ramdisk
STOCK_RAMDISK_LZ4="device/lenovo/tb351fu/prebuilt/vendor_ramdisk.cpio"

# Use system lz4 if prebuilt is missing
LZ4=$(which lz4)
if [ -z "$LZ4" ]; then
    # Fallback to a common prebuilt path if system lz4 is missing
    LZ4="prebuilts/misc/linux-x86/lz4/lz4"
fi

# Forcefully copy the stock ramdisk to the target intermediate path
TARGET_LZ4="out/target/product/tb351fu/obj/PACKAGING/vendor_boot_intermediates/vendor_ramdisk.cpio.lz4"
mkdir -p $(dirname "$TARGET_LZ4")
echo "Forcing stock ramdisk into $TARGET_LZ4 using $LZ4"
if [ -f "$STOCK_RAMDISK_LZ4" ]; then
    cp "$STOCK_RAMDISK_LZ4" "$TARGET_LZ4"
fi

# Modify bootconfig to force recovery mode
BOOTCONFIG_PREBUILT="device/lenovo/tb351fu/prebuilt/bootconfig"
if [ -f "$BOOTCONFIG_PREBUILT" ]; then
    printf "androidboot.force_normal_boot=0\nkernel.rcu_nocbs=all\nkernel.rcutree.enable_rcu_lazy=1\nkernel.rcupdate.rcu_cpu_stall_cputime=1\n" > "$BOOTCONFIG_PREBUILT"
fi

# Populate the directory for dependencies
mkdir -p out/target/product/tb351fu/vendor_ramdisk
if [ ! -f out/target/product/tb351fu/vendor_ramdisk/init ] && [ -f "$STOCK_RAMDISK_LZ4" ] && [ -x "$LZ4" ]; then
    echo "Populating out/target/product/tb351fu/vendor_ramdisk for dependencies..."
    cd out/target/product/tb351fu/vendor_ramdisk
    $LZ4 -d < "../../../$STOCK_RAMDISK_LZ4" | cpio -idm
    cd -
fi
