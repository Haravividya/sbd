module csr_tbtop;

  import uvm_pkg::*;
  import CSR_pkg::*;

	bit [5:0]clock;
	bit [5:0] reset;
	
 //clock generation
  logic csr_clk;
	initial begin
	   clock=$urandom_range(10,5);
		forever begin
		csr_clk=1;
		#clock;
		csr_clk=0;
		#clock;
		end
	end
	
 //reset generation
  logic csr_rst;
		  initial
	        begin
				reset=$urandom_range(10,5);
				csr_rst = 1;
                #reset;
				csr_rst = 0;
                #reset;
                csr_rst = 1;
                #reset;
                csr_rst = 0;
                #reset;
                csr_rst = 1;
                #reset;
			end
 //interface
  csr_intf intf (csr_clk,csr_rst);
 
 //RTL instantiation
 csr_top dut(.csr_clk(intf.csr_clk),
			.csr_rst(intf.csr_rst), 
			.csr_write_en_in(intf.csr_write_en_in),
			.csr_addr_in(intf.csr_addr_in),
			.csr_read_en_in(intf.csr_read_en_in),
			.csr_write_data_in(intf.csr_write_data_in),
			.csr_set_bit_in(intf.csr_set_bit_in),
			.csr_clear_bit_in(intf.csr_clear_bit_in),
			.interrupt_valid_in(intf.interrupt_valid_in),
			.mie_set(intf.mie_set),
			.mie_clear(intf.mie_clear),
			.interrupt_code_in(intf.interrupt_code_in),
			.exception_valid_in(intf.exception_valid_in),
			.exception_code_in(intf.exception_code_in),
			.ld_sd_misalign_valid_in(intf.ld_sd_misalign_valid_in),
			.ld_sd_misalign_addr_in(intf.ld_sd_misalign_addr_in), 
			.instr_misalign_valid_in(intf.instr_misalign_valid_in), 
			.instr_misalign_addr_in(intf.instr_misalign_addr_in), 
			.invalid_instr_valid_in(intf.invalid_instr_valid_in), 
			.invalid_instruction_in(intf.invalid_instruction_in), 
			.pc_in(intf.pc_in),
            .csr_mepc_in(intf.csr_mepc_in),
            .csr_mepc_write_valid(intf.csr_mepc_write_valid),
            .interrupt_lvl_pr_i(intf.interrupt_lvl_pr_i),
            .interrupt_active_level_priority_o(intf.interrupt_active_level_priority_o),
	        .csr_mepc_o(intf.csr_mepc_o),
            .mstatus_mie_o(intf.mstatus_mie_o),
            .csr_mtvec_o(intf.csr_mtvec_o),
            .csr_mcause_o(intf.csr_mcause_o),
			.csr_read_data_o(intf.csr_read_data_o),
            .mret_valid_i(intf.mret_valid_i),
            .exception_id_write_valid_i(intf.exception_id_write_valid_i),
            .interrupt_id_write_valid_i(intf.interrupt_id_write_valid_i));
always@(*)
begin
$display($time,"interrupt_active_level : %0h rtl_interrupt_active : %0h",intf.interrupt_active_level_priority_o,dut.interrupt_active_level_priority_o);
end

			
  initial
   begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    uvm_config_db#(virtual csr_intf)::set(null,"","intf",intf);
    run_test("csr_test"); 
	run_test("csr_test_hpmc");
	run_test("csr_test_mcycle_minstret");
	run_test("csr_rand_test");
    run_test("csr_set_uncovered_test");
	run_test("csr_clear_uncovered_test");
    run_test("csr_hpmc_uncovered_test");
   end 
endmodule	 
