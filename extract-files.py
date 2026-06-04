#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.fixups_blob import (
    blob_fixups_user_type,
    blob_fixup
)
from extract_utils.fixups_lib import (
    lib_fixup_vendorcompat,
    lib_fixups_user_type,
    libs_proto_3_9_1,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/onn/mt8781-common',
    "hardware/mediatek",
    "hardware/mediatek/libmtkperf_client"
]

lib_fixups: lib_fixups_user_type = {
    libs_proto_3_9_1: lib_fixup_vendorcompat,
} # fmt: skip

def fixup_ndk_platform(libname: str) -> tuple[str, str]:
    """
    Replace -ndk_platform with -ndk
    """
    return (libname, libname.replace("-ndk_platform.so", "-ndk.so"))

patchelf_version = "0_17_2"

blob_fixups: blob_fixups_user_type = {
    "vendor/bin/hw/android.hardware.security.keymint@1.0-service.beanpod": blob_fixup()
    .patchelf_version(patchelf_version)
    .replace_needed(
        "android.hardware.security.keymint-V1-ndk_platform.so",
        "android.hardware.security.keymint-V3-ndk.so",
    )
    .add_needed("android.hardware.security.rkp-V3-ndk.so")
    .replace_needed(
        *fixup_ndk_platform("android.hardware.security.secureclock-V1-ndk_platform.so")
    )
    .replace_needed(
        *fixup_ndk_platform("android.hardware.security.sharedsecret-V1-ndk_platform.so")
    ),
    (
        "vendor/lib64/libteei_daemon_vfs.so",
        "vendor/lib64/mt6789/lib3a.flash.so",
        "vendor/lib64/mt6789/lib3a.ae.stat.so",
        "vendor/lib64/mt6789/lib3a.sensors.color.so",
        "vendor/lib64/mt6789/lib3a.sensors.flicker.so",
    ): blob_fixup()
    .patchelf_version(patchelf_version)
    .add_needed("liblog.so"),
            (
        "vendor/lib64/hw/android.hardware.sensors@2.X-subhal-mediatek.so",
        "vendor/lib64/mt6789/libaalservice.so",
        "vendor/lib64/mt6789/libcam.utils.sensorprovider.so",
    ): blob_fixup()
    .replace_needed('libsensorndkbridge.so', 'android.hardware.sensors@1.0-convert-shared.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'mid1108',
    'onn',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    #add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'mt8781-common', module.vendor)
    utils.run()
