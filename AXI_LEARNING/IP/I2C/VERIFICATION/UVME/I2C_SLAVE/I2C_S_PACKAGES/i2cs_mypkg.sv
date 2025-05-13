//--------------------------------------------------------------------------
//------------------------file name - i2cs_mypkg.sv-----------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------
//mypkg file

`timescale 1ns/1ps

package i2cs_mypkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "../UVME/I2C_SLAVE/I2C_S_SEQUENCE/i2cs_seq_item_new.sv"
  `include "../UVME/I2C_SLAVE/I2C_S_SEQUENCE/i2cs_sequence_new.sv"
  `include "../UVME/I2C_SLAVE/I2C_S_AGENT/i2cs_sequencer.sv"
  `include "../UVME/I2C_SLAVE/I2C_S_AGENT/i2cs_driver_new.sv"
  `include "../UVME/I2C_SLAVE/I2C_S_AGENT/i2cs_monitor.sv"
  `include "../UVME/I2C_SLAVE/I2C_S_AGENT/i2cs_agent_new.sv"
    
  `include "../UVME/I2C_SLAVE/I2C_S_ENV/i2cs_sb_new.sv"

  `include "../UVME/I2C_SLAVE/I2C_S_ENV/i2cs_env_new.sv"
  
  
  `include "../UVME/I2C_SLAVE/I2C_S_TEST/i2cs_test_new.sv"
  
endpackage
