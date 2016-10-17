BOARD_TAG    = uno
ARDUINO_LIBS = LiquidCrystal

all: scmd.cpp 

TARGET = atimer

include /usr/share/arduino/Arduino.mk

#$(TARGET_ELF):

RSWITCH = -G2                                                                                                              

%.cpp : %.rl
	ragel $(RSWITHC) -o $@ $<


