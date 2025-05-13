/*****************************************************
project name:ahb_slave_new
Description: it has all the files and path of all the components.
File name:ahb_slave_pkg.sv
*****************************************************/

package pkg;

  import uvm_pkg::*;        
  `include "uvm_macros.svh"
         
  // agent files: seq item, sequencer, driver, monitor, agent
  `include "../UVME/agent/ahb_slave_seq_item.sv"
  `include "../UVME/agent/ahb_slave_sequencer.sv"
  `include "../UVME/agent/ahb_slave_driver.sv"
  `include "../UVME/agent/ahb_slave_monitor.sv"
  `include "../UVME/agent/ahb_slave_agent.sv"
  
  // Environment files: scoreboard, coverage, env
  `include "../UVME/env/ahb_slave_scoreboard.sv"  
  `include "../UVME/env/ahb_slave_coverage.sv"
  `include "../UVME/env/ahb_slave_env.sv"
  
  // Sequence files
  `include "../UVME/sequences/ahb_slave_sequence.sv"
   
  // Tests
  `include "../UVME/test/ahb_slave_test.sv"
  `include "../UVME/test/ahb_slave_reset_test.sv"
  `include "../UVME/test/ahb_slave_haddr_test.sv"
  `include "../UVME/test/ahb_slave_wr_test.sv"
  `include "../UVME/test/ahb_slave_hready_test.sv"
  `include "../UVME/test/ahb_slave_hsel_test.sv"
  `include "../UVME/test/ahb_slave_hburst_test.sv"
  `include "../UVME/test/ahb_slave_burst4_test.sv"
  `include "../UVME/test/ahb_slave_burst8_test.sv"
  `include "../UVME/test/ahb_slave_burst16_test.sv"

endpackage

