#include <avr/io.h>

%%{
	machine serial;
	main := "";
}%%

%% write data;

uint8_t cs;

void init_scmd(){
%% write init;
}
