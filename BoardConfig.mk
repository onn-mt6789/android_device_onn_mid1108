#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/onn/mid1108

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

# Build the 32 bit targets
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Enable 64-bit for non-zygote.
ZYGOTE_FORCE_64 := true

# Force any prefer32 targets to be compiled as 64 bit.
IGNORE_PREFER32_ON_DEVICE := true

# OTA Updates
TARGET_OTA_ASSERT_DEVICE := mid1108

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mid1108_ms_64 # TODO: Double check
TARGET_NO_BOOTLOADER := true

# Plaform
BOARD_HAS_MTK_HARDWARE := true
TARGET_BOARD_PLATFORM := mt6789

# Inherit the proprietary version
include vendor/onn/mid1108/BoardConfigVendor.mk
