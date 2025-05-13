/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_data_in_test.sv
Description:
This is test file for data_in test scenario here we are 
randomising the all different input values and  checking for all 
possible combinations of data_in test.

**************************************************/

class spi_data_in_test extends uvm_test;
 
  `uvm_component_utils(spi_data_in_test)
 
  spi_env env_inst;  // uvm environment handle
  spi_seq seq_inst;  // uvm sequence handle
    
  //constructor
  function new(string name = "spi_data_in_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 

  //uvm build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //creating objects for handles
    env_inst = spi_env::type_id::create("env_inst", this);
    seq_inst = spi_seq::type_id::create("seq_inst",this);
  endfunction

 
  //run phase starting
  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
   
    repeat(20)
    begin

    // scenario 1 all inputs reset and outputs will be zero 
	seq_inst.scenario = 1;
    seq_inst.reset_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
        
    // scenario 3 random data_in load
	seq_inst.scenario = 3;
    seq_inst.reset_seq = 1;
	seq_inst.start(env_inst.agent_inst.sequencer_inst);        

    // scenario 4 constant data_in load
	seq_inst.scenario = 4;
    seq_inst.reset_seq = 1;
	seq_inst.ss_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 5 constant data_in load
	seq_inst.scenario = 5;
    seq_inst.reset_seq = 1;
	seq_inst.data_in_seq = 8'b10101001;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 6 for each data_in load
    seq_inst.scenario = 6;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
    
    // scenario 7 alternate data_in load
	seq_inst.scenario = 7;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
    
    // scenario 8 random reset for data_in 
	seq_inst.scenario = 8;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    end

	`uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);

    //uvm_test_done.set_drain_time(this,1000);
  
  endtask
  
 
endclass


