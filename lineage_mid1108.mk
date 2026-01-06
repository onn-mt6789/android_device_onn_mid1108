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
