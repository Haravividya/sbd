/*************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_reception_test.sv
Description:
This is test file for reception test scenario here we are 
randomising the all different input values with keeping the rx_e =0 and  checking for all 
possible combinations of reception test.

**************************************************/

class spi_reception_test extends spi_base_test;
 
  `uvm_component_utils(spi_reception_test)
   
  //constructor
  function new(string name = "spi_reception_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 

  //uvm build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

 
  //run phase starting
 
  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
   
    repeat(50)
    begin

    // scenario 1 reset low and all output signals are zero
    seq_inst.scenario = 1;
    seq_inst.reset_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    // scenario 12 reception of data for random tx_ready signal
	seq_inst.scenario = 12;
    seq_inst.reset_seq = 1;
    seq_inst.rx_e_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    // scenario 13 reception of  each data_in load
	seq_inst.scenario = 13;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    // scenario 14 reception of  alternate data_in load
	seq_inst.scenario = 14;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 
     
    end
    
	`uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);

    //uvm_test_done.set_drain_time(this,1000);
  
  endtask
 
 
endclass


