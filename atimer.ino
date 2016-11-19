#include "all.h"

int pin_map[n_pins] = {1, 2, 3, 4, 5};

corecmd next_core_cmd;
void send_to_core (corecmd c) {
	next_core_cmd = c;
}

clockcmd next_clock_cmd;
void send_to_clock (clockcmd c) {
	next_clock_cmd = c;
}
void setup (){
 	for (int i=0 ; i<n_pins; i++) {
		pinMode(pin_map[i], OUTPUT);
//	        digitalWrite(pin_map[i], LOW);
	};
	send_to_core(no_core_cmd);
	send_to_clock(no_clock_cmd);
	init_scmd();
	init_core();
}

void loop() {
}

