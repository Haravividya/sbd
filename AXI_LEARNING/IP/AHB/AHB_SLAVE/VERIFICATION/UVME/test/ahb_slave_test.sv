/***********************************************************************
Project name:ahb_slave 
Description: This is the module which has the test cases 
File name:ahb_slave_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_slave_test_tb extends uvm_test;

  //factory registration
  `uvm_component_utils(ahb_slave_test_tb) 

  //declaring uvm test components
  ahb_slave_env_tb env_inst;  // uvm environment
  ahb_slave_sequence_tb seq_inst;  // uvm sequence
  

  //constructor
  function new(string name="ahb_slave_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //creating the obj of env and sequence components using create() method
    env_inst = ahb_slave_env_tb::type_id::create("env_inst", this);
    seq_inst = ahb_slave_sequence_tb::type_id::create("seq_inst");
  endfunction
endclass
