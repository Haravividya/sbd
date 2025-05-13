/***********************************************************************
Project name:ahb_slave 
Description: This is the module which has the test cases for reset 
File name:ahb_slave_reset_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_slave_reset_test extends ahb_slave_test_tb;

  //factory registration
  `uvm_component_utils(ahb_slave_reset_test)

  //constructor
  function new(string name="ahb_slave_reset_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);      
    super.build_phase(phase);  
  endfunction
 
  //run phase 
  task run_phase(uvm_phase phase);
  
    phase.raise_objection(this); //raising objection to test the scenarios 	
    `uvm_info(get_name(),$sformatf("step 1 : inside test = ahb_slave_reset_test"),UVM_MEDIUM);
        
    repeat(10)
    begin
    //scenario 1-----------------RESET
   	seq_inst.scenario = 1;
    seq_inst.hreset_n_seq = 0;
    seq_inst.haddr_seq=0;
    seq_inst.hwdata_seq=0;
    seq_inst.hwrite_seq=1;
    seq_inst.hready_seq=0;
    seq_inst.hsel_seq=0;
    seq_inst.hburst_seq=0;       
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
        
    //////////////////////////////////////////////////////////////////

    //scenario 3--------------RANDOM RESET 
	seq_inst.scenario = 3;                                                   	    
    seq_inst.haddr_seq =$urandom_range(0,31);
    seq_inst.hburst_seq =0;
    repeat(4)
    begin
      seq_inst.hwrite_seq =1;
      seq_inst.hready_seq =1;
      seq_inst.hsel_seq=1;
      seq_inst.start(env_inst.agent_inst.sequencer_inst);
    end
        
    repeat(5)
    begin 
      seq_inst.hwrite_seq =0;
      seq_inst.start(env_inst.agent_inst.sequencer_inst);
    end

    ////////////////////////////////////////////////////////////////
                  
    end

 
    `uvm_info(get_name(),$sformatf("step 6 : inside test done = ahb_slave_reset_test"),UVM_MEDIUM);
    phase.drop_objection(this); 
    //droping objection after testing all test case scenarios this will end the test and simulation  	
    //uvm_test_done.set_drain_time(this,10000);
  endtask
 
endclass
 

