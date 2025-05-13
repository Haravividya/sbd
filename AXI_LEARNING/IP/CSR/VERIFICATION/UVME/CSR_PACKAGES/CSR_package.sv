

package CSR_pkg;

	 import uvm_pkg::*;
    `include "uvm_macros.svh"
	`include "../UVME/CSR_SEQUENCES/CSR_seqitem.sv"
	`include "../UVME/CSR_SEQUENCES/CSR_sequence.sv"
	`include "../UVME/CSR_SEQUENCES/CSR_seq_hardware_performance.sv"
	`include "../UVME/CSR_SEQUENCES/CSR_seq_mcycle_minstret.sv"
    `include "../UVME/CSR_SEQUENCES/CSR_rand_seq.sv"
	`include "../UVME/CSR_SEQUENCES/CSR_sequencer.sv"
    `include "../UVME/CSR_SEQUENCES/CSR_clear_uncovered_seq.sv"
    `include "../UVME/CSR_SEQUENCES/CSR_set_uncovered_seq.sv"
	`include "../UVME/CSR_SEQUENCES/CSR_hpmc_uncovered_seq.sv"
	`include "../UVME/CSR_AGENTS/CSR_driver.sv"
	`include "../UVME/CSR_AGENTS/CSR_monitor.sv"
	`include "../UVME/CSR_AGENTS/CSR_agent.sv"
	`include "../UVME/CSR_ENVIRONMENT/CSR_sb.sv"
	`include "../UVME/CSR_ENVIRONMENT/CSR_env.sv"
	`include "../UVME/CSR_TESTS/CSR_test.sv"
	`include "../UVME/CSR_TESTS/CSR_test_hardware_performance.sv"
	`include "../UVME/CSR_TESTS/CSR_test_mcycle_minstert.sv"
	`include "../UVME/CSR_TESTS/CSR_rand_test.sv"
	`include "../UVME/CSR_TESTS/CSR_clear_uncovered_test.sv"
	`include "../UVME/CSR_TESTS/CSR_set_uncovered_test.sv"
	`include "../UVME/CSR_TESTS/CSR_hpmc_uncovered_test.sv"
    
endpackage 
