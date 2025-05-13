//..........................I2C MASTER INTERFACE FILE.................

`timescale 1ns/1ps

interface i2cm_intrf(input i2c_clock_in);
  logic i2c_reset_in;
  logic i2c_start;
  logic rw;
  logic [6:0] i2c_master_addr_wr;
  logic [7:0] i2c_master_data_wr;
  logic fifo_full;
  logic ready_out;
  logic [7:0] i2c_master_data_rd;
  logic sdam_en;
  logic sdam_in;
  logic sdam_out;

  logic sclm_en;
  logic sclm_in;
  logic sclm_out;

  //logic [7:0] test_sdam_out;

  wand i2c_sda_inout;
 // wand i2c_scl_inout;

  logic i2c_scl_inout;

  assign i2c_sda_inout = sdam_en ? sdam_out : 'z ;
 
  assign sdam_in = i2c_sda_inout;

  //assign i2c_scl_inout = sclm_en ? sclm_out : 'z;
  
  //assign sclm_in = i2c_scl_inout;


endinterface
