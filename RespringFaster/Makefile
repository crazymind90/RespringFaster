ARCHS = arm64e arm64 armv7 armv7s

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RespringFaster

RespringFaster_FILES = RespringFasterController.m
RespringFaster_INSTALL_PATH = /Library/PreferenceBundles
RespringFaster_FRAMEWORKS = UIKit
RespringFaster_PRIVATE_FRAMEWORKS = Preferences
RespringFaster_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
RespringFaster_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RespringFaster.plist$(ECHO_END)
