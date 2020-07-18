ARCHS = arm64e arm64 armv7 armv7s

THEOS_DEVICE_IP = 192.168.1.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RespringFaster

RespringFaster_FILES = Tweak.xm
RespringFaster_CFLAGS = -fobjc-arc
RespringFaster_EXTRA_FRAMEWORKS += Cephei
RespringFaster_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += RespringFaster
include $(THEOS_MAKE_PATH)/aggregate.mk

install2::
		install2.exec
