class wdt_seq_item extends uvm_sequence_item;


 rand logic [1:0]  wdt_reg_addr  ;
 rand logic [15:0] wdt_reg_data;
 rand logic        stop_mode_i;
 rand logic        debug_mode_i;
 rand logic        wait_mode_i;
      logic        wdt_reset_o;
      logic        wdt_interrupt_o;
      logic [15:0] wdt_counter;   


  `uvm_object_utils_begin(wdt_seq_item)

    `uvm_field_int(wdt_reg_addr,UVM_ALL_ON)
    `uvm_field_int(wdt_reg_data,UVM_ALL_ON)
    `uvm_field_int(stop_mode_i,UVM_ALL_ON)
    `uvm_field_int(debug_mode_i,UVM_ALL_ON)
    `uvm_field_int(wait_mode_i,UVM_ALL_ON)
    `uvm_field_int(wdt_reset_o ,UVM_ALL_ON)
    `uvm_field_int(wdt_interrupt_o,UVM_ALL_ON)
    `uvm_field_int(wdt_counter,UVM_ALL_ON)


  `uvm_object_utils_end


  function new(string name = "");

    super.new(name);

  endfunction

endclass
 
