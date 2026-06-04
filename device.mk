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

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# DRM (Clearkey)
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore_V3.xml \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V3-ndk.vendor \
    lib_android_keymaster_keymint_utils.vendor \
    libcppbor_external.vendor \
    libkeymint.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

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

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 33

PRODUCT_ADB_KEYS := vendor/fiery/root_adbkey.pub

# Inherit from vendor blobs
$(call inherit-product, vendor/onn/mid1108/mid1108-vendor.mk)