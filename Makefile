#---------------------------------------------------------------------------------
# Nintendo Switch Homebrew - devkitPro/libnx
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment")
endif

TOPDIR ?= $(CURDIR)

include $(DEVKITPRO)/libnx/switch_rules

#---------------------------------------------------------------------------------
# Project settings
#---------------------------------------------------------------------------------

TARGET      := WebVideoCasterNX
BUILD       := build
SOURCES     := source
DATA        :=
INCLUDES    :=

APP_TITLE   := WebVideoCasterNX
APP_AUTHOR  := ManoBigbig
APP_VERSION := 0.1

#---------------------------------------------------------------------------------
# Compiler options
#---------------------------------------------------------------------------------

ARCH := -march=armv8-a+crc+crypto -mtune=cortex-a57 -mtp=soft -fPIE

CFLAGS := -g -Wall -O2 -ffunction-sections -fdata-sections $(ARCH)
CFLAGS += $(INCLUDE) -D__SWITCH__

CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++17

ASFLAGS := -g $(ARCH)

LDFLAGS := -specs=$(DEVKITPRO)/libnx/switch.specs -g $(ARCH)

LIBS := -lnx

#---------------------------------------------------------------------------------
# Build configuration
#---------------------------------------------------------------------------------

LIBDIRS := $(PORTLIBS) $(LIBNX)

#---------------------------------------------------------------------------------
# Source files
#---------------------------------------------------------------------------------

CFILES   := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c)))
CPPFILES := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.cpp)))
SFILES   := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.s)))

#---------------------------------------------------------------------------------
# Build
#---------------------------------------------------------------------------------

.PHONY: all clean

all:
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile build

build:
	@mkdir -p $(BUILD)
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

clean:
	@echo "Cleaning..."
