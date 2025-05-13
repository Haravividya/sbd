class csr_seqitem extends uvm_sequence_item;
     
    rand logic       csr_rst;
	rand logic       csr_write_en_in;
	rand logic [63:0]csr_write_data_in;
	randc logic [11:0]csr_addr_in;
	rand logic       csr_read_en_in;
	rand logic       csr_set_bit_in;
	rand logic       csr_clear_bit_in;
	rand logic       interrupt_valid_in;
	rand logic       mie_set;
	rand logic       mie_clear;
	rand logic [63:0]interrupt_code_in;
	rand logic       exception_valid_in;
	rand logic [63:0]exception_code_in;
	rand logic       ld_sd_misalign_valid_in;
	rand logic [63:0]ld_sd_misalign_addr_in;
	rand logic       instr_misalign_valid_in;
	rand logic [63:0]instr_misalign_addr_in;
	rand logic       invalid_instr_valid_in;
	rand logic [31:0]invalid_instruction_in;
	rand logic [19:0]pc_in;
    rand logic [19:0]csr_mepc_in;
    rand logic       csr_mepc_write_valid;
    rand logic [7:0] interrupt_lvl_pr_i;
    rand logic       mret_valid_i;
    rand logic       exception_id_write_valid_i;
    rand logic       interrupt_id_write_valid_i;
        
//outputs
	logic [63:0]csr_read_data_o;	
    logic [7:0] interrupt_active_level_priority_o;
    logic [19:0]csr_mepc_o;
    logic       mstatus_mie_o;
    logic [63:0]csr_mtvec_o;
    logic [7:0] csr_mcause_o;

//factory registration
	`uvm_object_utils_begin(csr_seqitem)
//utility and field macros
		`uvm_field_int(csr_rst,UVM_ALL_ON);
		`uvm_field_int(exception_id_write_valid_i,UVM_ALL_ON);
		`uvm_field_int(interrupt_id_write_valid_i,UVM_ALL_ON);
		`uvm_field_int(csr_write_en_in,UVM_ALL_ON);
		`uvm_field_int(csr_write_data_in,UVM_ALL_ON);
		`uvm_field_int(csr_addr_in,UVM_ALL_ON);
		`uvm_field_int(csr_read_en_in,UVM_ALL_ON);
		`uvm_field_int(csr_set_bit_in,UVM_ALL_ON);
		`uvm_field_int(csr_clear_bit_in,UVM_ALL_ON);
		`uvm_field_int(interrupt_valid_in,UVM_ALL_ON);
		`uvm_field_int(mie_set,UVM_ALL_ON);
		`uvm_field_int(mie_clear,UVM_ALL_ON);
		`uvm_field_int(interrupt_code_in,UVM_ALL_ON);
		`uvm_field_int(exception_valid_in,UVM_ALL_ON);
		`uvm_field_int(exception_code_in,UVM_ALL_ON);
		`uvm_field_int(ld_sd_misalign_valid_in,UVM_ALL_ON);
		`uvm_field_int(ld_sd_misalign_addr_in,UVM_ALL_ON);
		`uvm_field_int(instr_misalign_valid_in,UVM_ALL_ON);
		`uvm_field_int(instr_misalign_addr_in,UVM_ALL_ON);
		`uvm_field_int(invalid_instr_valid_in,UVM_ALL_ON);
		`uvm_field_int(invalid_instruction_in,UVM_ALL_ON);
		`uvm_field_int(pc_in,UVM_ALL_ON);
		`uvm_field_int(csr_read_data_o,UVM_ALL_ON);
        `uvm_field_int(csr_mepc_in,UVM_ALL_ON);
		`uvm_field_int(csr_mepc_write_valid,UVM_ALL_ON);
		`uvm_field_int(interrupt_lvl_pr_i,UVM_ALL_ON);
		`uvm_field_int(interrupt_active_level_priority_o,UVM_ALL_ON);
		`uvm_field_int(csr_mepc_o,UVM_ALL_ON);
		`uvm_field_int(mstatus_mie_o,UVM_ALL_ON);
		`uvm_field_int(csr_mtvec_o,UVM_ALL_ON);
        `uvm_field_int(csr_mcause_o,UVM_ALL_ON);
        `uvm_field_int(mret_valid_i,UVM_ALL_ON);
	`uvm_object_utils_end	
//constructor
	function new(string name="csr_seqitem");
	super.new(name);
	endfunction
endclass
