#
# Copyright (C) The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/onn/mid1108

# Inherit from mt8781-common
$(call inherit-product, device/onn/mt8781-common/common.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/onn/mid1108/mid1108-vendor.mk)