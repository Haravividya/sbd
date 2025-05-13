/*************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_random_test.sv
Description:
This is test file for randomising scenario here we are 
randomising the all different input  values.

**************************************************/

class spi_random_test extends spi_base_test;
 
  `uvm_component_utils(spi_random_test)
   
  //constructor
  function new(string name = "spi_random_test",uvm_component parent=null);
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
   
    repeat(30)
    begin

    // scenario 1 transmission of data for random tx_ready signal
	seq_inst.scenario = 1;
    seq_inst.reset_seq = 0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    // scenario 5 for all random inputs 
	seq_inst.scenario = 5;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 
    
    end
    
	`uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);

    //uvm_test_done.set_drain_time(this,1000);
  
  endtask
 
 
endclass


