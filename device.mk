# Enable A/B update support
AB_OTA_UPDATER := true

# Mandatory A/B Partition List
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    init_boot \
    lk \
    preloader \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot

# Use the recovery ramdisk logic for Vendor Boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# Include stock vendor ramdisk files (excluding VINTF to avoid build errors)
PRODUCT_COPY_FILES += $(foreach f,$(shell find $(LOCAL_PATH)/prebuilt/vendor_ramdisk -type f -not -path "*/vintf/*"),$(f):$(subst $(LOCAL_PATH)/prebuilt/vendor_ramdisk/,,$(f)))

# Add VINTF fragments properly
DEVICE_MANIFEST_FILE += $(wildcard $(LOCAL_PATH)/prebuilt/vintf/*.xml)

# Enable EROFS support (Required for ZUI 17)
PRODUCT_FS_COMPRESSION := true
TARGET_RECOVERY_FSTYPE_MOUNT_LIST := erofs
