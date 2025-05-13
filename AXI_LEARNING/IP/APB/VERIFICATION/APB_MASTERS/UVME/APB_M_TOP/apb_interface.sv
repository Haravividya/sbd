
`timescale 1ns/1ps

interface apb_intf(input logic pclock,presetn);

  logic pready;
  logic pslverr;
  logic [31:0] prdata;
  //logic psel1;
  //logic psel2;
  logic [31:0] apb_write_data;
  logic [31:0] apb_write_paddr;
  logic [31:0] apb_read_paddr;
  logic read_write;
  logic transfer;
  //logic penable;
  //logic pwrite;
  //logic [31:0] paddr;
  //logic [31:0] pwdata;
  //logic [31:0] apb_read_data_out;

endinterface



