TARGET := WebVideoCasterNX
BUILD := build
SOURCES := source

APP_TITLE := WebVideoCasterNX
APP_AUTHOR := ManoBigbig
APP_VERSION := 0.1

include $(DEVKITPRO)/libnx/switch_rules

.PHONY: all clean

all: $(TARGET).nro

$(TARGET).nro: $(TARGET).elf
	@elf2nro $< $@

$(TARGET).elf: $(SOURCES)/main.cpp
	@$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o main.o
	@$(CXX) $(LDFLAGS) main.o $(LIBS) -o $@

clean:
	@rm -f main.o $(TARGET).elf $(TARGET).nro
