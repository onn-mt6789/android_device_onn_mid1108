#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific fist.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device makefile
$(call inherit-product, device/onn/mid1108/device.mk)

# Inherit some common LineageOS Stuff
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_mid1108
PRODUCT_DEVICE := mid1108
PRODUCT_MANUFACTURER := onn
PRODUCT_BRAND := onn
PRODUCT_MODEL := 11 Tablet Pro

PRODUCT_GMS_CLIENTID_BASE := android-digiland

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sys_mssi_mid1108_ms_64-user 14 UP1A.231005.007 mp1V814 release-keys" \
    BuildFingerprint=onn/100110027/mid1108_ms_64:14/UP1A.231005.007/qyh20241207:user/release-keys \
    DeviceName=mid1108_ms_64 \
	ProductModel=100110027 \
    DeviceProduct=100110027 
