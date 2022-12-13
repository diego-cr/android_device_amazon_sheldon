#
# Copyright (C) 2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
DEVICE_PATH := device/amazon/sheldon

# Broken rules
BUILD_BROKEN_DUP_RULES := true

# Platform
BOARD_VENDOR := amazon
TARGET_BOARD_PLATFORM := mt8695
TARGET_BOARD_PLATFORM_GPU := ge8300-mp4

# Soong
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Binder
TARGET_USES_64_BIT_BINDER := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bootloader
TARGET_NO_BOOTLOADER := true

# Boot Image
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x14000000
BOARD_RAMDISK_OFFSET := 0x15000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_BOOTIMG_HEADER_VERSION := 1

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board ""

# Kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/amazon/mt8695
TARGET_KERNEL_CONFIG := sheldon_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"
TARGET_KERNEL_CLANG_COMPILE := true
NEED_KERNEL_MODULE_SYSTEM := true
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# Partitions (Sizes)
BOARD_FLASH_BLOCK_SIZE := 131072                   # 2048      * 64   (none)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216         # 16384     * 1024 (mmcblk0p4)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216     # 16384     * 1024 (mmcblk0p5)
BOARD_CACHEIMAGE_PARTITION_SIZE := 17179869184     # 524288    * 1024 (mmcblk0p12)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5500615680   # 5371695   * 1024 (mmcblk0p13)
BOARD_VENDORIMAGE_PARTITION_SIZE := 157286400      # 153600    * 1024 (mmcblk0p10)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000     # 1536000   * 1024 (mmcblk0p11)

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM := system

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Display
TARGET_SCREEN_DENSITY := 320

# Graphics
TARGET_USES_HWC2 := true
VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Malloc
MALLOC_SVELTE := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Vintf
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml

# Recovery
TARGET_OTA_ASSERT_DEVICE := sheldon,sheldonp
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt8695

# SPL
VENDOR_SECURITY_PATCH := 2018-10-05

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/configs/bluetooth

# SEPolicy
include device/mediatek/sepolicy/sepolicy.mk

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VNDK
BOARD_VNDK_VERSION := current
