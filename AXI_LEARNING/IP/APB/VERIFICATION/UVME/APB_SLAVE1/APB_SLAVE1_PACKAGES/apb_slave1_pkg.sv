


`timescale 1ns/1ns

package apb_slave1_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

//sequence
`include "../UVME/APB_SLAVE1_SEQUENCES/apb_slave1_seq_item.sv"
`include "../UVME/APB_SLAVE1_SEQUENCES/apb_slave1_sequence.sv"
`include "../UVME/APB_SLAVE1_SEQUENCES/apb_slave1_sequencer.sv"

//agent
`include "../UVME/APB_SLAVE1_AGENTS/apb_slave1_driver.sv"
`include "../UVME/APB_SLAVE1_AGENTS/apb_slave1_monitor.sv"
`include "../UVME/APB_SLAVE1_AGENTS/apb_slave1_agent.sv"

//environment
`include "../UVME/APB_SLAVE1_ENVIRONMENT/apb_slave1_scoreboard.sv"
`include "../UVME/APB_SLAVE1_ENVIRONMENT/apb_slave1_env.sv"

//test
`include "../UVME/APB_SLAVE1_TESTS/apb_slave1_test.sv"

endpackage
