#
# Copyright (C) The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt8781-common
include device/onn/mt8781-common/BoardConfigCommon.mk

# Boot image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# DTB
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true

# Inherit from the proprietary version
include vendor/onn/mid1108/BoardConfigVendor.mk