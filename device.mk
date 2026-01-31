#
# Copyright (C) The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/onn/mid1108
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Inherit from mt8781-common
$(call inherit-product, device/onn/mt8781-common/common.mk)

# Dalvik configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# AAPT
PRODUCT_CHARACTERISTICS := tablet

# Kernel
PRODUCT_COPY_FILES += \
	$(KERNEL_PATH)/Image.gz:kernel

# Permissions (features)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Init scripts
PRODUCT_PACKAGES += \
    fstab.emmc \
    fstab.emmc.vendor_ramdisk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/onn/mid1108/mid1108-vendor.mk)