/*************************************************
File name:pmp_pkg.sv
Description:

**************************************************/

package pkg;

  import uvm_pkg::*;        
  `include "uvm_macros.svh"
         
  // agent
  `include"../UVME/agent/pmp_seq_item_tb.sv"
  `include"../UVME/agent/pmp_sequencer_tb.sv"
  `include"../UVME/agent/pmp_driver_tb.sv"
  `include"../UVME/agent/pmp_monitor_tb.sv"
  `include"../UVME/agent/pmp_agent_tb.sv"
  
  // Environment files: scoreboard, coverage, env
   `include "../UVME/env/pmp_scoreboard_tb.sv"
   `include "../UVME/env/pmp_coverage_tb.sv"
   `include "../UVME/env/pmp_env_tb.sv"
  
  // Sequence files
  `include "../UVME/sequence/pmp_seq_tb.sv"
   //`include "../sequence/pmp_write_seq.sv"

  
  // Tests
  `include "../UVME/test/pmp_base_test_tb.sv"
  `include "../UVME/test/pmp_reset_test.sv"
  `include "../UVME/test/pmp_random_test.sv"
  `include "../UVME/test/pmp_write_addr_test.sv"
 // `include "../test/pmp_read_addr_test.sv"
  `include "../UVME/test/pmp_execption_test.sv"
  `include "../UVME/test/pmp_machine_mode_test.sv"
  `include "../UVME/test/pmp_write.sv"
  `include "../UVME/test/pmp_na4.sv"
  `include "../UVME/test/pmp_napot.sv"
  `include "../UVME/test/pmp_tor.sv"
  `include "../UVME/test/pmp_write_read_access_na4.sv"
  `include "../UVME/test/pmp_write_read_access_napot.sv"
  `include "../UVME/test/pmp_write_read_access_tor.sv"
  `include "../UVME/test/pmp_write_read_access_all.sv"


endpackage
