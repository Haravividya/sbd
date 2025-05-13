/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_base_test.sv
Description: This is test file for base test scenario here we are 
randomising the all different input values checking for all 
possible scenarios and combinations of reception test.

**************************************************/

class spi_base_test extends uvm_test;
 
  `uvm_component_utils(spi_base_test)
 
  spi_env env_inst;  // uvm environment handle
  spi_seq seq_inst;
      
  //constructor
  function new(string name = "spi_base_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 

  //uvm build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_inst = spi_env::type_id::create("env_inst", this);
    seq_inst = spi_seq::type_id::create("seq_inst",this);
  endfunction

 
  //run phase starting
  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
   
    repeat(20)
    begin

    // scenario 1 reset low and outputs are zero
	seq_inst.scenario = 1;
    seq_inst.reset_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

 
    // scenario 2 all inputs are zero
	seq_inst.scenario = 2;
    seq_inst.reset_seq = 1;
    seq_inst.load_seq = 0;
    seq_inst.rx_e_seq = 0;
    seq_inst.ss_seq = 0;
    seq_inst.mosi_seq = 0;
    seq_inst.data_in_seq =8'h0; 
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

          
    // scenario 3 reset =1 and other inputs are randomised
	seq_inst.scenario = 3;
    seq_inst.reset_seq = 1;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 4 SS low
	seq_inst.scenario = 4;
    seq_inst.reset_seq = 1;
	seq_inst.ss_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 5 constant data_in load
	seq_inst.scenario = 5;
    seq_inst.reset_seq = 1;
	seq_inst.data_in_seq = 8'b10101001;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 6 each data_in load
	seq_inst.scenario = 6;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
    
    // scenario 7 alternate data_in load
	seq_inst.scenario = 7;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
    
    // scenario 8 random reset for data_in
	seq_inst.scenario = 8;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 9 transmission of data for random load signal
	seq_inst.scenario = 9;
    seq_inst.reset_seq = 1;
    seq_inst.rx_e_seq = 1;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 10 transmission of  each data_in load
	seq_inst.scenario = 10;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 11 transmission of  each data_in load
	seq_inst.scenario = 11;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 12 reception of data for random load signal
	seq_inst.scenario = 12;
    seq_inst.reset_seq = 1;
    seq_inst.rx_e_seq = 0;
    seq_inst.ss_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 13 reception of  each data_in load
	seq_inst.scenario = 13;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
 
    
    // scenario 14 reception of  alternate data_in load
	seq_inst.scenario = 14;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


    // scenario 15 for all random inputs
	seq_inst.scenario = 15;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    
    end

	`uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);

    //uvm_test_done.set_drain_time(this,1000);
  
  endtask
  
 
endclass


