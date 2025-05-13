/***********************************************************************
Project name:ahb_slave 
Description: This is the module which has the test cases which controll hresp 
File name:ahb_slave_hsel_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_slave_hsel_test extends ahb_slave_test_tb;

  //factory registration
  `uvm_component_utils(ahb_slave_hsel_test) 

  //constructor
  function new(string name="ahb_slave_hsel_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
  endfunction
 
  //run phase 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this); //raising objection to test the scenarios 	
    `uvm_info(get_name(),$sformatf("step 1 : inside test = ahb_slave_hsel_test"),UVM_MEDIUM);
        
    repeat(40)
    begin
      //scenario 1-----------------RESET
   	  seq_inst.scenario = 1;
      seq_inst.hreset_n_seq = 0;
      seq_inst.haddr_seq=0;
      seq_inst.hwdata_seq=0;
      seq_inst.hwrite_seq=0;
      seq_inst.hready_seq=0;
      seq_inst.hsel_seq=0;
      seq_inst.hburst_seq=0;       
      seq_inst.start(env_inst.agent_inst.sequencer_inst);

      ///////////////////////////////////////////////////////////////////
        
      //scenario 2-----------------HSEL HIGH
      seq_inst.scenario = 2;
      seq_inst.hreset_n_seq = 1;
      seq_inst.haddr_seq =$urandom_range(0,31);
      seq_inst.hburst_seq =0;
      repeat(3)
      begin
        seq_inst.hwrite_seq =1;
        seq_inst.hready_seq =1;
        seq_inst.hsel_seq=1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end
        
      repeat(4)
      begin 
        seq_inst.hwrite_seq =0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end

      seq_inst.hreset_n_seq = 0;
      seq_inst.start(env_inst.agent_inst.sequencer_inst);


      /////////////////////////////////////////////////////////////////////

      //scenario 2-----------------HSEL LOW
	  seq_inst.scenario = 2;
      seq_inst.hreset_n_seq = 1;
      seq_inst.haddr_seq =$urandom_range(0,31);
      seq_inst.hburst_seq =5;
      repeat(9)
      begin
        seq_inst.hwrite_seq =1;
        seq_inst.hready_seq =1;
        seq_inst.hsel_seq=0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end
        
      repeat(10)
      begin 
        seq_inst.hwrite_seq =0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end

      /////////////////////////////////////////////////////////////////////

      //scenario 4--------------RANDOM HSEL 
	  seq_inst.scenario = 4;
      seq_inst.hreset_n_seq = 1;
      seq_inst.haddr_seq =$urandom_range(1,28);
      seq_inst.hburst_seq =2;
      repeat(6)
      begin
        seq_inst.hwrite_seq =1;
        seq_inst.hready_seq =1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end
        
      repeat(7)
      begin 
        seq_inst.hwrite_seq =0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end


      /////////////////////////////////////////////////////////////////////

    end

 
  `uvm_info(get_name(),$sformatf("step 6 : inside test done = ahb_slave_hsel_test"),UVM_MEDIUM);
  phase.drop_objection(this); //droping objection after testing all test case scenarios this will end the test and simulation  	
  //uvm_test_done.set_drain_time(this,10000);
  endtask
 
endclass
 

