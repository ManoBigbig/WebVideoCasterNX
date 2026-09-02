#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------
include $(DEVKITPRO)/libnx/switch_rules
#---------------------------------------------------------------------------------

TARGET      := WebVideoCasterNX
BUILD       := build
SOURCES     := source
DATA        :=
INCLUDES    := include

#---------------------------------------------------------------------------------
# options for code generation
#---------------------------------------------------------------------------------

ARCH := -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE

CFLAGS   := -g -Wall -O2 -ffunction-sections -fdata-sections $(ARCH)
CFLAGS   += $(INCLUDE) -D__SWITCH__
CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++17
ASFLAGS  := -g $(ARCH)

LIBS := -lnx

#---------------------------------------------------------------------------------
include $(DEVKITPRO)/libnx/switch_rules
#---------------------------------------------------------------------------------
