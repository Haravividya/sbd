/***********************************************************
File name   : pc_top.sv
Description : Test Bench top : contains : 
      		DUT instance , 
		Interface instance ,
		Clock generation logic , 
		Run_test() method , 
		wavedump logic , 		
		Virtual interface - set configdb
***********************************************************/

`timescale 1ns/1ps

module pc_top;

  import uvm_pkg::*;
  import pc_pkg::*;

  logic z_clk;

  initial
  begin
    z_clk = 1;
  end

  //Clock Generation
  always #5 z_clk = ~z_clk;

  //Instance of interface : in order to connect DUT and TB
  pc_interface intf(z_clk);

  //DUT instance , interface signals are connected to the DUT ports
  zpc_top DUT(
      .z_clk(intf.z_clk),
      .z_rst(intf.z_rst),

      .branch_valid_i        (intf.branch_valid_i),
      .branch_pc_i           (intf.branch_pc_i),
      .csr_mepc_i            (intf.csr_mepc_i),
      .csr_mtvec_i           (intf.csr_mtvec_i),
      .csr_mstatus_mie_i     (intf.csr_mstatus_mie_i),
      .mret_valid_i          (intf.mret_valid_i),
      .stall_valid_i         (intf.stall_valid_i),
      .zic_int_req_i         (intf.zic_int_req_i),
      .zic_mmr_ack_id_i      (intf.zic_mmr_ack_id_i),	          
      .z_instruction_i       (intf.z_instruction_i),
      .invalid_instr_valid_i (intf.invalid_instr_valid_i),		
      .breakpoint_valid_i    (intf.breakpoint_valid_i),
      .ecall_valid_i         (intf.ecall_valid_i),
      .ld_sd_addr_i          (intf.ld_sd_addr_i),
      .ld_valid_i            (intf.ld_valid_i),
      .sd_valid_i            (intf.sd_valid_i),
      .byte_sel_i            (intf.byte_sel_i),
      .csr_mcause_id_i       (intf.csr_mcause_id_i),

      .csr_mepc_o             (intf.csr_mepc_o),
      .instr_read_addr_o      (intf.instr_read_addr_o),
      .csr_mepc_write_valid_o (intf.csr_mepc_write_valid_o),
      .csr_mstatus_mie_clear_o(intf.csr_mstatus_mie_clear_o),
      .csr_mstatus_mie_set_o  (intf.csr_mstatus_mie_set_o),
      .z_instruction_o        (intf.z_instruction_o),

      .exception_valid_o          (intf.exception_valid_o),
      .exception_id_o             (intf.exception_id_o),	  
      .interrupt_valid_o          (intf.interrupt_valid_o),
      .ld_sd_misalign_valid_o     (intf.ld_sd_misalign_valid_o),
      .ld_sd_misalign_addr_o      (intf.ld_sd_misalign_addr_o),
      .instr_misalign_valid_o     (intf.instr_misalign_valid_o),
      .instr_misalign_addr_o      (intf.instr_misalign_addr_o),
      .invalid_instr_valid_o      (intf.invalid_instr_valid_o),
      .zic_mmr_ack_read_valid_o   (intf.zic_mmr_ack_read_valid_o),
      .zic_mmr_eoi_id_o           (intf.zic_mmr_eoi_id_o),
      .zic_mmr_eoi_write_valid_o  (intf.zic_mmr_eoi_write_valid_o),
      .z_instruction_read_enable_o(intf.z_instruction_read_enable_o), 
      .decode_instruction_valid_o(intf.decode_instruction_valid_o));



  //Enable wave dump 
  initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    // $dumpfile("dump.vcd"); $dumpvars;
  end 

  //Run test
  initial
  begin   
    uvm_config_db#(virtual pc_interface)::set(null,"","intf",intf); //set interface
    run_test("pc_test");
  end 

endmodule 

