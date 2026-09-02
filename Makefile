#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

include $(DEVKITPRO)/libnx/switch_rules

#---------------------------------------------------------------------------------
# Project settings
#---------------------------------------------------------------------------------

TARGET      := WebVideoCasterNX
BUILD       := build
SOURCES     := source
DATA        :=
INCLUDES    :=

#---------------------------------------------------------------------------------
# Compiler options
#---------------------------------------------------------------------------------

ARCH := -march=armv8-a -mtune=cortex-a57 -mtp=soft -fPIE

CFLAGS := -g -Wall -O2 -ffunction-sections -fdata-sections $(ARCH)
CFLAGS += $(INCLUDE) -D__SWITCH__

CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++17

ASFLAGS := -g $(ARCH)

LIBS := -lnx

#---------------------------------------------------------------------------------
# Libraries
#---------------------------------------------------------------------------------

LIBDIRS := $(PORTLIBS) $(LIBNX)

#---------------------------------------------------------------------------------
# Build system
#---------------------------------------------------------------------------------

ifneq ($(BUILD),$(notdir $(CURDIR)))

export OUTPUT := $(CURDIR)/$(TARGET)
export TOPDIR := $(CURDIR)

export VPATH := $(foreach dir,$(SOURCES),$(CURDIR)/$(dir)) \
                $(foreach dir,$(DATA),$(CURDIR)/$(dir))

export DEPSDIR := $(CURDIR)/$(BUILD)

CFILES := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c)))
CPPFILES := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.cpp)))
SFILES := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.s)))
BINFILES := $(foreach dir,$(DATA),$(notdir $(wildcard $(dir)/*.*)))

ifeq ($(strip $(CPPFILES)),)
export LD := $(CC)
else
export LD := $(CXX)
endif

export OFILES_BIN := $(addsuffix .o,$(BINFILES))
export OFILES_SRC := $(CPPFILES:.cpp=.o) $(CFILES:.c=.o) $(SFILES:.s=.o)
export OFILES := $(OFILES_BIN) $(OFILES_SRC)

export HFILES := $(addsuffix .h,$(subst .,_,$(BINFILES)))

export INCLUDE := $(foreach dir,$(INCLUDES),-I$(CURDIR)/$(dir)) \
                  $(foreach dir,$(LIBDIRS),-I$(dir)/include) \
                  -I$(CURDIR)/$(BUILD)

export LIBPATHS := $(foreach dir,$(LIBDIRS),-L$(dir)/lib)

.PHONY: all clean

all: $(BUILD)

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

clean:
	@echo clean ...
	@rm -fr $(BUILD) $(TARGET).elf $(TARGET).nro $(TARGET).nacp

else

DEPENDS := $(OFILES:.o=.d)

#---------------------------------------------------------------------------------
# Link
#---------------------------------------------------------------------------------

$(OUTPUT).nro : $(OUTPUT).elf

$(OUTPUT).elf : $(OFILES)

$(OFILES_SRC) : $(HFILES)

-include $(DEPENDS)

endif
#---------------------------------------------------------------------------------
