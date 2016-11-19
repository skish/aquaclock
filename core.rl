// writing to pins 
#include "all.h"

%%machine core;

%%include "defs.rh";

%%{
#	machine core;
#        wrie = 'W';
	main :=
start: [] -> P0 ,
P0: (
	'W' -> P0	|
	wrie -> P0	#|
#	on -> work	|
#	off_all_one -> P1
),
P1: (
	wrie -> P1	#|
#	on -> work	|
#	off_all_zero -> P0
#),
#work: (
#	off_all_zero -> P0	|
#	off_all_one -> P1	|
#	wrie -> work
);
	
}%%

%% write data;

static uint8_t cs;

void init_core(){
%% write init;
};

void process_core(){
%%write exec;
};

