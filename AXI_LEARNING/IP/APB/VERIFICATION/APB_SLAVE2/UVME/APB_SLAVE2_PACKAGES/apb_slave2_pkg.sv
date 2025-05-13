`timescale 1ns/1ps

package apb_slave2_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

//sequence
`include "../UVME/APB_SLAVE2_SEQUENCES/apb_slave2_seq_item.sv"
`include "../UVME/APB_SLAVE2_SEQUENCES/apb_slave2_sequence.sv"
`include "../UVME/APB_SLAVE2_SEQUENCES/apb_slave2_sequencer.sv"

//agent
`include "../UVME/APB_SLAVE2_AGENTS/apb_slave2_driver.sv"
`include "../UVME/APB_SLAVE2_AGENTS/apb_slave2_monitor.sv"
`include "../UVME/APB_SLAVE2_AGENTS/apb_slave2_agent.sv"

//environment
`include "../UVME/APB_SLAVE2_ENVIRONMENT/apb_slave2_scoreboard.sv"
`include "../UVME/APB_SLAVE2_ENVIRONMENT/apb_slave2_env.sv"

//test
`include "../UVME/APB_SLAVE2_TESTS/apb_slave2_test.sv"

endpackage
