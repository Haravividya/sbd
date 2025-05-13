`timescale 1ns/1ps

package pc_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"


  `include "../UVME/PC_SEQUENCES/pc_seq_item.sv"
  `include "../UVME/PC_SEQUENCES/pc_sequence.sv"
  `include "../UVME/PC_SEQUENCES/pc_sequencer.sv"

  `include "../UVME/PC_AGENT/pc_driver.sv"
  `include "../UVME/PC_AGENT/pc_monitor.sv"
  `include "../UVME/PC_AGENT/pc_agent.sv"

  `include "../UVME/PC_ENVIRONMENT/pc_scoreboard.sv"
  `include "../UVME/PC_ENVIRONMENT/pc_env.sv"

  `include "../UVME/PC_TESTS/pc_test.sv"

endpackage

