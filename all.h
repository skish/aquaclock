#include <avr/common.h>
#include "defs.h"

typedef enum {
  no_core_cmd,
  off_all_zero,
  off_all_one,
  on,
  wris = core_ex_wrie
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
