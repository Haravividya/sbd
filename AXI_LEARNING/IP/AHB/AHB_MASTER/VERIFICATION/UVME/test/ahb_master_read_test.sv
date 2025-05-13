/***********************************************************************
Project name:ahb_master 
Description: This is the module which has the test cases for read operation 
File name:ahb_master_read_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_master_read_test extends ahb_master_test_tb;

//factory registration
 `uvm_component_utils(ahb_master_read_test) 

//constructor
  function new(string name="ahb_master_read_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
//build phase
  function void build_phase(uvm_phase phase);      
    super.build_phase(phase);  
  endfunction
 
//run phase 
  task run_phase(uvm_phase phase);
  
     phase.raise_objection(this); //raising objection to test the scenarios 	
      `uvm_info(get_name(),$sformatf("step 1 : inside test = ahb_master_read_test"),UVM_MEDIUM);
        
       repeat(50)
        begin
             
        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;       
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	         
      
        //scenario 6
   	    seq_inst.scenario = 6;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq = 0;      
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

	    //scenario 7
   	    seq_inst.scenario = 7;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq = 0;
        seq_inst.hrdata_seq = 32'h00005678;      
        seq_inst.start(env_inst.agent_inst.sequencer_inst);	    	    
               
       end
        
       

 
      `uvm_info(get_name(),$sformatf("step 6 : inside test done = ahb_master_read_test"),UVM_MEDIUM);
     phase.drop_objection(this); //droping objection after testing all test case scenarios this will end the test and simulation  	
    //uvm_test_done.set_drain_time(this,10000);
  endtask
 
endclass
 

