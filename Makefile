#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

include $(DEVKITPRO)/libnx/switch_rules

#---------------------------------------------------------------------------------
# TARGET is the name of the output
# BUILD is the directory where object files & intermediate files will be placed
# SOURCES is a list of directories containing source code
# DATA is a list of directories containing data files
# INCLUDES is a list of directories containing header files
#---------------------------------------------------------------------------------

TARGET := WebVideoCasterNX
BUILD := build
SOURCES := source
DATA :=
INCLUDES :=

#---------------------------------------------------------------------------------
# options for code generation
#---------------------------------------------------------------------------------

ARCH := -march=armv8-a -mtune=cortex-a57 -mtp=soft -fPIE

CFLAGS := -g -Wall -O2 -ffunction-sections -fdata-sections $(ARCH)
CFLAGS += $(INCLUDE) -D__SWITCH__

CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++17

ASFLAGS := -g $(ARCH)

LIBS := -lnx

#---------------------------------------------------------------------------------
# list of directories containing libraries, this must be the top level containing
# include and lib
#---------------------------------------------------------------------------------

LIBDIRS := $(LIBNX) $(PORTLIBS)

#---------------------------------------------------------------------------------
# include build rules
#---------------------------------------------------------------------------------

include $(DEVKITPRO)/libnx/switch_rules
