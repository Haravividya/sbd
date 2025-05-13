class pc_seq_item extends uvm_sequence_item;
  rand logic        branch_valid_i;       //Control Signal
  rand logic [19:0] branch_pc_i;
  rand logic [19:0] csr_mepc_i;
  rand logic [63:0] csr_mtvec_i;
  rand logic        csr_mstatus_mie_i;    //control Signal
  rand logic        mret_valid_i;         //Control signal
  rand logic        stall_valid_i;        //Control signal
  rand logic        zic_int_req_i;        //Control signal
  rand logic [7:0]  zic_mmr_ack_id_i;
  rand logic        z_rst;                //RESET signal
  rand logic [31:0] z_instruction_i;
  rand logic        invalid_instr_valid_i; //Exceptions
  rand logic        breakpoint_valid_i;
  rand logic        ecall_valid_i;
  rand logic [63:0] ld_sd_addr_i;
  rand logic        ld_valid_i;
  rand logic        sd_valid_i;	
  rand logic [1:0]  byte_sel_i;
  rand logic [7:0]  csr_mcause_id_i; 

  logic [19:0] csr_mepc_o;
  logic [19:0] instr_read_addr_o;

  logic       interrupt_valid_o;
 
  logic        csr_mepc_write_valid_o;
  logic        csr_mstatus_mie_clear_o;
  logic        csr_mstatus_mie_set_o;

  logic [31:0] z_instruction_o;

  logic        exception_valid_o;
  logic [7:0]  exception_id_o;

  logic        ld_sd_misalign_valid_o;
  logic [63:0] ld_sd_misalign_addr_o;
  logic        instr_misalign_valid_o;
  logic [19:0] instr_misalign_addr_o;
  logic        invalid_instr_valid_o;

  logic        zic_mmr_ack_read_valid_o;
  logic [7:0]  zic_mmr_eoi_id_o;
  logic        zic_mmr_eoi_write_valid_o;
  logic        z_instruction_read_enable_o;
  logic        decode_instruction_valid_o; 

  

  //Utility and field macros 
  `uvm_object_utils_begin(pc_seq_item)
    `uvm_field_int(branch_valid_i,UVM_ALL_ON)
    `uvm_field_int(branch_pc_i,UVM_ALL_ON)
    `uvm_field_int(csr_mepc_i,UVM_ALL_ON)
    `uvm_field_int(csr_mtvec_i,UVM_ALL_ON)
    `uvm_field_int(csr_mstatus_mie_i,UVM_ALL_ON)
    `uvm_field_int(mret_valid_i,UVM_ALL_ON)
    `uvm_field_int(stall_valid_i,UVM_ALL_ON)
    `uvm_field_int(zic_int_req_i,UVM_ALL_ON)
    `uvm_field_int(zic_mmr_ack_id_i,UVM_ALL_ON)
    `uvm_field_int(z_rst,UVM_ALL_ON)
    `uvm_field_int(z_instruction_i,UVM_ALL_ON)
    `uvm_field_int(invalid_instr_valid_i,UVM_ALL_ON)
    `uvm_field_int(breakpoint_valid_i,UVM_ALL_ON)
    `uvm_field_int(ecall_valid_i,UVM_ALL_ON)
    `uvm_field_int(ld_sd_addr_i,UVM_ALL_ON)
    `uvm_field_int(ld_valid_i,UVM_ALL_ON)
    `uvm_field_int(sd_valid_i,UVM_ALL_ON)
    `uvm_field_int(byte_sel_i,UVM_ALL_ON)
    `uvm_field_int(csr_mcause_id_i, UVM_ALL_ON) 
    `uvm_field_int(csr_mepc_o,UVM_ALL_ON)
    `uvm_field_int(instr_read_addr_o,UVM_ALL_ON)
    `uvm_field_int(csr_mepc_write_valid_o,UVM_ALL_ON)
    `uvm_field_int(csr_mstatus_mie_clear_o,UVM_ALL_ON)
    `uvm_field_int(csr_mstatus_mie_set_o,UVM_ALL_ON)

    `uvm_field_int(z_instruction_o,UVM_ALL_ON)
    `uvm_field_int(exception_valid_o,UVM_ALL_ON)
    `uvm_field_int(exception_id_o,UVM_ALL_ON)
    `uvm_field_int(interrupt_valid_o,UVM_ALL_ON)

    `uvm_field_int(ld_sd_misalign_valid_o,UVM_ALL_ON)
    `uvm_field_int(ld_sd_misalign_addr_o,UVM_ALL_ON)
    `uvm_field_int(instr_misalign_valid_o,UVM_ALL_ON)
    `uvm_field_int(instr_misalign_addr_o, UVM_ALL_ON)
    `uvm_field_int(invalid_instr_valid_o,UVM_ALL_ON)


    `uvm_field_int(zic_mmr_ack_read_valid_o,UVM_ALL_ON)
    `uvm_field_int(zic_mmr_eoi_id_o,UVM_ALL_ON)
    `uvm_field_int(zic_mmr_eoi_write_valid_o,UVM_ALL_ON)
    `uvm_field_int(z_instruction_read_enable_o,UVM_ALL_ON) 
    `uvm_field_int(decode_instruction_valid_o,UVM_ALL_ON)    

 `uvm_object_utils_end


  function new(string name = "pc_seq_item");
    super.new(name);
  endfunction

  //Put constraints if any
  constraint rst_c{soft  z_rst==1;}

  //Exceptionr related constraints
  constraint ld_sd_addr_c   { soft   ld_sd_addr_i%4        == 0;}            // PC: PC+4
  constraint byte_sel_c     { soft   byte_sel_i            == 2'b10;}             // Word as default
  constraint invalid_instr_c{ soft   invalid_instr_valid_i == 0;} // instruction is valid - by default
  constraint ecall_c        { soft   ecall_valid_i         == 0;}                 // No  ecall exception
  constraint breakpoint_c   { soft   breakpoint_valid_i    == 0;}       // No  Breakpoint
  constraint load_c         { soft   ld_valid_i            == 0;}                     // Not a load  
  constraint store_c        { soft   sd_valid_i            == 0;}                    // Not a store

  //Interrupt and Branch related constraints
  constraint branch_c1{ soft branch_pc_i[1:0]  == 0;}                    
  constraint branch_c2{ soft branch_valid_i    == 0;}
  constraint inter_c1 { soft csr_mstatus_mie_i == 0;}
  constraint inter_c2 { soft mret_valid_i      == 0;}
  constraint stall_c  { soft stall_valid_i     == 0;}
  constraint inter_c3 { soft zic_int_req_i     == 0;}
      
endclass :pc_seq_item
 
