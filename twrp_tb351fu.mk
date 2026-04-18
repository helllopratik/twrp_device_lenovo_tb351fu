#
# twrp_tb351fu.mk - Lenovo Tab Plus (TB351FU)
# OrangeFox 14.1 (Android 14)
#

# Global variables for the build system
BOARD_BOOT_HEADER_VERSION := 4

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from our custom device configuration
$(call inherit-product, device/lenovo/tb351fu/device.mk)

# Inherit from OrangeFox
$(call inherit-product, bootable/recovery/orangefox.mk)

PRODUCT_DEVICE := tb351fu
PRODUCT_NAME := twrp_tb351fu
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Tab Plus
PRODUCT_MANUFACTURER := Lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
