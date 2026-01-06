#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Inherit our proprietary vendor
$(call inherit-product, vendor/onn/mid1108/mid1108-vendor.mk)