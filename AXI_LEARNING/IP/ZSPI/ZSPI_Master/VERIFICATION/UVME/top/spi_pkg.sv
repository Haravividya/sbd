/***************************************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_pkg.sv
Description: File contains the list of all the .sv files in various folders
***************************************************************************/

package pkg;

  import uvm_pkg::*;        
  `include "uvm_macros.svh"
         
  
   // Agent files: seq item, sequencer, driver, monitor, agent
  `include"../UVME/agent/spi_seq_item.sv"
  `include"../UVME/agent/spi_sequencer.sv"
  `include"../UVME/agent/spi_driver.sv"
  `include"../UVME/agent/spi_monitor.sv"
  `include"../UVME/agent/spi_agent.sv"
  
  // Environment files: scoreboard, coverage, env
  `include "../UVME/env/spi_scoreboard.sv"
  `include "../UVME/env/spi_coverage.sv"
  `include "../UVME/env/spi_env.sv"
  
  // Sequence files
  `include"../UVME/sequence/spi_sequence.sv"
  
  // Tests
  `include"../UVME/test/spi_base_test.sv"
  `include"../UVME/test/spi_data_in_test.sv"
  `include"../UVME/test/spi_transmission_test.sv"
  `include"../UVME/test/spi_random_test.sv"
  `include"../UVME/test/spi_reset_test.sv"
  `include"../UVME/test/spi_reception_test.sv"

  
  
endpackage
