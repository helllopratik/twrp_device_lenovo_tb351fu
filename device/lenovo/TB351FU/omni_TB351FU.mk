$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/lenovo/TB351FU/device.mk)

PRODUCT_DEVICE := TB351FU
PRODUCT_NAME := omni_TB351FU
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Tab Plus
PRODUCT_MANUFACTURER := Lenovo
