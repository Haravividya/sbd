`timescale 1ns/1ps
interface pc_interface(input logic z_clk);

  //zilla_pc_update_inst
  logic        branch_valid_i;
  logic [19:0] branch_pc_i;     
  logic [19:0] csr_mepc_i;
  logic [63:0] csr_mtvec_i;
  
  //zilla_program_control_fsm_inst
  logic        csr_mstatus_mie_i;
  logic        mret_valid_i;
  logic        stall_valid_i;
  logic        zic_int_req_i;
  logic [7:0]  zic_mmr_ack_id_i;
  logic        z_rst;

 //zilla_instruction_buffer_inst
  logic [31:0] z_instruction_i;
  
  //z_exception_detect inst
  logic        invalid_instr_valid_i;
  logic        breakpoint_valid_i;
  logic        ecall_valid_i;
  logic [63:0] ld_sd_addr_i;
  logic        ld_valid_i;
  logic        sd_valid_i;
  logic [1:0]  byte_sel_i;
  logic [7:0]  csr_mcause_id_i;
 
  
  //outputs
  logic [19:0] csr_mepc_o;
  logic [19:0] instr_read_addr_o;
 
  logic        csr_mepc_write_valid_o;
  logic        csr_mstatus_mie_clear_o;
  logic        csr_mstatus_mie_set_o;

  logic [31:0] z_instruction_o;

  logic        exception_valid_o;
  logic [7:0]  exception_id_o;

  logic        interrupt_valid_o;
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

endinterface
