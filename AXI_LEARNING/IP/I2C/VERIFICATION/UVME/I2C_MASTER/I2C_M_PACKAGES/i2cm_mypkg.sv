//........................I2C MASTER PACKAGE FILE.............

package i2cm_mypkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  `include "../UVME/I2C_MASTER/I2C_M_SEQUENCE/i2cm_seq_item.sv"
  `include "../UVME/I2C_MASTER/I2C_M_SEQUENCE/i2cm_sequence.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_sequencer.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_driver.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_monitor.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_monitor_new.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_agent.sv"
  `include "../UVME/I2C_MASTER/I2C_M_AGENT/i2cm_agent_new.sv"
  
  `include "../UVME/I2C_MASTER/I2C_M_ENV/i2cm_sb.sv"
  `include "../UVME/I2C_MASTER/I2C_M_ENV/i2cm_env.sv"
  
  `include "../UVME/I2C_MASTER/I2C_M_TEST/i2cm_test.sv"
  `include "../UVME/I2C_MASTER/I2C_M_TEST/i2cm_test_alternative.sv"
  `include "../UVME/I2C_MASTER/I2C_M_TEST/i2cm_test_rand.sv"
  `include "../UVME/I2C_MASTER/I2C_M_TEST/i2cm_test_ack.sv"
  `include "../UVME/I2C_MASTER/I2C_M_TEST/i2cm_test_fifo.sv"
endpackage
