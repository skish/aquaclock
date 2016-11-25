MONITOR_PORT  = /dev/ttyACM0
BOARD_TAG    = uno
ARDUINO_LIBS = LiquidCrystal

all: scmd.cpp core.cpp 

TARGET = atimer

ifeq ($(MAKECMDGOALS),test)
CXXFLAGS=-g
OBJDIR=test-o
$(OBJDIR)/%.o : %.cpp
	g++ -c $(CXXFLAGS) -o $@ $<

RSWITCH = -T0 -n 
else
include /usr/share/arduino/Arduino.mk
RSWITCH = -G2 
endif

#$(TARGET_ELF):

RSWITCH = -G2 -n 

%.cpp : %.rl defs.rh
	ragel $(RSWITHC)  -o $@ $<
	ragel -V -p -o %.dot $<


$(OBJDIR)/atimer.o $(OBJDIR)/scmd.o $(OBJDIR)/core.o: all.h

all.h : defs.h

defs.h : defs.rh defs.rl
	ragel $(RSWITHC) -o defs.h defs.rl  

test: test.o $(OBJDIR)/core.o
	g++ $(CXXFLAGS) -o $@ $^



