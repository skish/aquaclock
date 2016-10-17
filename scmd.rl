#include <avr/io.h>
#include "all.h"

%%{
	machine serial;
	main := "";
}%%

%% write data;

uint8_t cs;

void init_scmd(){
%% write init;
}
