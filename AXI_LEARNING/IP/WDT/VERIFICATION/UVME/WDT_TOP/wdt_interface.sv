//`timescale 1ns/1ps

interface wdt_intf(input logic clk,rst);

  logic [1:0]  wdt_reg_addr;
  logic [15:0] wdt_reg_data;
  logic        stop_mode_i;
  logic        debug_mode_i;
  logic        wait_mode_i;
  logic        wdt_reset_o;
  logic        wdt_interrupt_o;
  logic [15:0] wdt_counter;

endinterface
