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

# Force Recovery Binary & UI
PRODUCT_PACKAGES += \
    recovery \
    librecovery_ui_default \
    librecovery_utils \
    otacerts

# Enable EROFS support (Required for ZUI 17)
PRODUCT_FS_COMPRESSION := true
TARGET_RECOVERY_FSTYPE_MOUNT_LIST := erofs,f2fs,ext4
