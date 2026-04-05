# Enable A/B update support
AB_OTA_UPDATER := true

# Use the recovery ramdisk logic for Vendor Boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel \
    $(LOCAL_PATH)/prebuilt/dtb:dtb

# Standard AOSP/TWRP partitions
PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc \
    libqcom_metadata \
    vold_prepare_subdirs

# Enable EROFS support (Required for ZUI 17)
PRODUCT_FS_COMPRESSION := true
TARGET_RECOVERY_FSTYPE_MOUNT_LIST := erofs
