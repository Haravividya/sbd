/*****************************************************
project name:ahb_master
Description: it has all the files and path of all the components.
File name:ahb_master_pkg.sv
*****************************************************/

package pkg;

  import uvm_pkg::*;        
  `include "uvm_macros.svh"
         
  // agent files: seq item, sequencer, driver, monitor, agent
  `include "../UVME/agent/ahb_master_seq_item.sv"
  `include "../UVME/agent/ahb_master_sequencer.sv"
  `include "../UVME/agent/ahb_master_driver.sv"
  `include "../UVME/agent/ahb_master_monitor.sv"
  `include "../UVME/agent/ahb_master_agent.sv"
  
  // Environment files: scoreboard, coverage, env
  `include "../UVME/env/ahb_master_scoreboard.sv"  
  `include "../UVME/env/ahb_master_coverage.sv"
  `include "../UVME/env/ahb_master_env.sv"
  
  // Sequence files
  `include "../UVME/sequences/ahb_master_sequence.sv"
   
  // Tests
  `include "../UVME/test/ahb_master_test.sv"
  `include "../UVME/test/ahb_master_reset_test.sv"
  `include "../UVME/test/ahb_master_addr_test.sv"
  `include "../UVME/test/ahb_master_read_test.sv"
  `include "../UVME/test/ahb_master_write_test.sv"
  `include "../UVME/test/ahb_master_hgrant_test.sv"
  `include "../UVME/test/ahb_master_hready_test.sv"
  `include "../UVME/test/ahb_master_hresp_test.sv"
  `include "../UVME/test/ahb_master_busreq_test.sv"
  `include "../UVME/test/ahb_master_burst_test.sv"


endpackage

