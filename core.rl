// writing to pins 
#include "all.h"

%%machine core;

%%include "defs.rh";

%%{
#	machine core;
#        wrie = 'W';
action WRZ {WRZ();}
action WRO {WRO();}
	main := (
start: off_all_one -> P1,
P0: (
#	write_pins 	|
	turn_on -> work	|
	off_all_one -> P1
) >to(WRZ),
P1: (
#	write_pins -> P1	|
	turn_on -> work	|
	off_all_zero -> P0
) >to(WRO),
work: (
	off_all_zero -> P0	|
	off_all_one -> P1	|
	write_pins -> work
));
	
}%%

%% write data;

//static uint8_t cs;
static unsigned int cs;

void init_core(){
%% write init;
};

static char  next;

void process_core(){
if (next != no_core_cmd) {
char cmd = next; next=no_core_cmd;
char *pe = &cmd; char *p = pe +1; char *eof=0;
%%write exec;
}
};

void send_to_core(corecmd c){
  next = c;
};

