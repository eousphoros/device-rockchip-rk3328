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

GAPPS_EXCLUDED_PACKAGES += \
    SetupWraith \
    AndroidMediaShell

# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3328/product.mk)
$(call inherit-product, device/rockchip/common/device.mk)
$(call inherit-product, device/google/atv/products/atv_generic.mk)

# Force small heap sizes
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=174m \
    ro.config.low_ram=true \
    ro.logd.size=64K

# setup dalvik vm configs.
$(call inherit-product-if-exists, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.target.product=box \
    sys.hwc.width=1920 \
    sys.hwc.height=1080

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

PRODUCT_MANUFACTURER := ayufan
PRODUCT_BRAND := PINE64
PRODUCT_DEVICE := rk3328_box
PRODUCT_NAME := rockbox_atv
PRODUCT_MODEL := Rockbox

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

$(call inherit-product, vendor/opengapps/atv-build/atv-vendor.mk)
$(call inherit-product, vendor/widevine/widevine.mk)
$(call inherit-product, vendor/ayufan/apps/vendor.mk)
