/***********************************************************

File name   : apb_protocol_pkg.svh
Description : Includes : all svh files , in a defined sequence are included.

***********************************************************/


`timescale 1ns/1ps

package apb_protocol_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

//agent
`include "../UVME/APB_PROTOCOL_SEQUENCES/apb_protocol_seq_item.sv"
`include "../UVME/APB_PROTOCOL_SEQUENCES/apb_protocol_sequence.sv"
`include "../UVME/APB_PROTOCOL_SEQUENCES/apb_protocol_sequencer.sv"
`include "../UVME/APB_PROTOCOL_AGENTS/apb_protocol_driver.sv"
`include "../UVME/APB_PROTOCOL_AGENTS/apb_protocol_monitor.sv"
`include "../UVME/APB_PROTOCOL_AGENTS/apb_protocol_agent.sv"

//environment
`include "../UVME/APB_PROTOCOL_ENVIRONMENT/apb_protocol_scb.sv"
`include "../UVME/APB_PROTOCOL_ENVIRONMENT/apb_protocol_env.sv"

//test
`include "../UVME/APB_PROTOCOL_TESTS/apb_protocol_test.sv"

endpackage

