ROOTLESS ?= 0

ifeq ($(ROOTLESS),1)
export THEOS_PACKAGE_SCHEME=rootless
endif

DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

export ARCHS = arm64 arm64e
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
export TARGET = iphone:clang:latest:15.0

INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = NoForcePortraitLock
$(TWEAK_NAME)_FILES = Tweak.x 
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations 
$(TWEAK_NAME)_CCFLAGS = -Wc++11-extensions -std=c++11
$(TWEAK_NAME)_FRAMEWORKS += UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS)/makefiles/common.mk
