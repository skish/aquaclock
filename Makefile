MONITOR_PORT  = /dev/ttyACM0
BOARD_TAG    = uno
ARDUINO_LIBS = LiquidCrystal

all: scmd.cpp core.cpp 

TARGET = atimer

include /usr/share/arduino/Arduino.mk

#$(TARGET_ELF):

RSWITCH = -G2                                                                                                              

%.cpp : %.rl defs.rh
	ragel $(RSWITHC)  -o $@ $<
	ragel -V -o %.dot $<


$(OBJDIR)/atimer.o $(OBJDIR)/scmd.o $(OBJDIR)/core.o: all.h

all.h : defs.h

defs.h : defs.rh defs.rl
	ragel $(RSWITHC) -o defs.h defs.rl  
