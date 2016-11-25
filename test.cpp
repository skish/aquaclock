#include <iostream>
#include "all.h"

int main() {
  std::cout<<"aaa";
  init_core();
 send_to_core(no_core_cmd);
        process_core();
        send_to_core(off_all_one);
        process_core();
        process_core();

};

void WRZ(){
  std::cout << "Z";
};

void WRO(){
  std::cout << "O";
};
