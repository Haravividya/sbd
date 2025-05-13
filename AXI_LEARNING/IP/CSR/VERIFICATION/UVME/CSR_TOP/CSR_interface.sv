interface csr_intf(input logic csr_clk, csr_rst);
//inputs
	logic       csr_write_en_in;
	logic [63:0]csr_write_data_in;
	logic [11:0]csr_addr_in;
	logic       csr_read_en_in;
	logic 		csr_set_bit_in;
	logic       csr_clear_bit_in;
	logic       interrupt_valid_in;
	logic [63:0]interrupt_code_in;
	logic       exception_valid_in;
	logic [63:0]exception_code_in;
	logic       ld_sd_misalign_valid_in;
	logic       mie_set;
	logic       mie_clear;
	logic [63:0]ld_sd_misalign_addr_in;
	logic       instr_misalign_valid_in;
	logic [63:0]instr_misalign_addr_in;
	logic       invalid_instr_valid_in;
	logic [31:0]invalid_instruction_in;
	logic [19:0]pc_in;
    logic [19:0]csr_mepc_in;
    logic       csr_mepc_write_valid;
    logic [7:0]interrupt_lvl_pr_i;
    logic      mret_valid_i;
    logic      exception_id_write_valid_i;
    logic     interrupt_id_write_valid_i;
        
//outputs
	logic [63:0]csr_read_data_o;	
    logic [7:0] interrupt_active_level_priority_o;
    logic [19:0]csr_mepc_o;
    logic       mstatus_mie_o;
    logic [63:0]csr_mtvec_o;
    logic [7:0] csr_mcause_o;
endinterface
