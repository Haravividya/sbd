package debug_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../UVME/DEBUG_SEQUENCE/jtag_defs.svh"
  `include "../UVME/DEBUG_SEQUENCE/debug_seq_item.sv"
  `include "../UVME/DEBUG_SEQUENCE/debug_sequence.sv"

  `include "../UVME/DEBUG_AGENT/debug_sequencer.sv"
  `include "../UVME/DEBUG_AGENT/debug_driver.sv"
  `include "../UVME/DEBUG_AGENT/debug_monitor.sv"
  `include "../UVME/DEBUG_AGENT/debug_agent.sv"
  
  `include "../UVME/DEBUG_ENV/debug_scoreboard.sv"
  `include "../UVME/DEBUG_ENV/debug_coverage.sv"
  `include "../UVME/DEBUG_ENV/debug_env.sv"
  
  `include "../UVME/DEBUG_TEST/debug_test.sv"
endpackage
