#include "defs.h"

typedef enum {
  no_core_cmd,
  off_all_zero = core_ex_off_all_zero,
  off_all_one = core_ex_off_all_one,
  on = core_ex_turn_on,
  wris = core_ex_write_pins
} corecmd;

typedef enum {
  no_clock_cmd
} clockcmd;

extern void init_scmd();
extern void init_core();
#define ticks uint16

typedef struct {
  int tick:11;
  int num:3;
  int cmd:1;
} prog_data; 

extern void send_to_core(corecmd);
extern void send_to_clock(clockcmd);

#define n_pins 5

extern void WRZ();
extern void WRO();

extern void process_core();
