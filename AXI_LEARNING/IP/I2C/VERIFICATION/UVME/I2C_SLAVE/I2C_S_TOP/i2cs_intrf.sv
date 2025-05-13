//--------------------------------------------------------------------------
//------------------------file name - i2cs_intrf.sv--------------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------
`timescale 1ns/1ps

interface i2cs_intrf_tb(input i2c_scl);

  logic i2c_rst;

  wand i2c_sda_inout;
  //wand i2c_scl_inout;


  //i2c_sda_inout
  logic sdas_en;
  logic sdas_out;
  logic sdas_in;

  /* logic scls_en;
  logic scls_out;
  logic scls_in; */

  assign i2c_sda_inout = sdas_en? sdas_out :'z;

  assign sdas_in = i2c_sda_inout;

  /* assign i2c_scl_inout = scls_en? scls_out :'z;

  assign scls_in = i2c_sda_inout; */


endinterface
