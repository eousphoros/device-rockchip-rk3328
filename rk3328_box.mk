#
# Copyright 2014 The Android Open-Source Project
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

include device/rockchip/rk3328/BoardConfig.mk

GAPPS_VARIANT := micro
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3328/device.mk)
$(call inherit-product, device/rockchip/rk3328/product.mk)
$(call inherit-product, device/rockchip/common/device.mk)
$(call inherit-product, device/google/atv/products/atv_generic.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

PRODUCT_CHARACTERISTICS := tv

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.live_tv.xml:system/etc/permissions/android.software.live_tv.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES += \
    Bluetooth \
    Provision \
    rild \
    displayd \
    hdmi_cec.$(TARGET_BOARD_HARDWARE)

PRODUCT_PACKAGES += \
    ESFileExplorer \
    WIFIADB \
    SideloadLauncher

PRODUCT_BRAND := rockchip
PRODUCT_MANUFACTURER := rockchip
PRODUCT_NAME := rk3328_box
PRODUCT_DEVICE := rk3328_box
PRODUCT_MODEL := rk3328-box

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

$(call inherit-product, vendor/google/atv-build/atv-vendor.mk)
$(call inherit-product, vendor/widevine/widevine.mk)
