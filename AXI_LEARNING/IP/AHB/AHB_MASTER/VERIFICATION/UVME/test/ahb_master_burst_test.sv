/***********************************************************************
Project name:ahb_master 
Description: This is the module which has the test cases of burst operation (Read and Write) 
File name:ahb_master_burst_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_master_burst_test extends ahb_master_test_tb;

//factory registration
 `uvm_component_utils(ahb_master_burst_test) 

//constructor
  function new(string name="ahb_master_burst_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
//build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);  
  endfunction
 
//run phase 
  task run_phase(uvm_phase phase);
  
     phase.raise_objection(this); //raising objection to test the scenarios 	
      `uvm_info(get_name(),$sformatf("step 1 : inside test = ahb_master_burst_test"),UVM_MEDIUM);
        
       repeat(40)
        begin
       
        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	    
        //scenario 19-----READ SINGLE BEAT
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b000;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        
        //scenario 19-----WRITE 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b001;
        seq_inst.iwrite_seq = 1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
   


        //scenario 19-----READ 4 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b010;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 


        //scenario 19-----WRITE 4 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b011;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 
	    

	         
        //scenario 19-----READ 8 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b100;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 19-----WRITE 8 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b101;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


  
	    //scenario 19-----READ 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b110;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


              
        //scenario 19-----WRITE 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b111;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 19-----WRITE SINGLE BEAT
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b000;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 19-----READ 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b001;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 


        //scenario 19-----WRITE 4 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b010;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	    


 	         
        //scenario 19-----READ 4 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b011;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 	         
        //scenario 19-----WRITE 8 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b100;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

  
        //scenario 19-----READ 8 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b101;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

    
	    //scenario 19-----WRITE 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b110;
        seq_inst.iwrite_seq =1;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 

               
        //scenario 19-----READ 16 BEATS
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b111;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 
	        	         
      
        //scenario 20-----READ RAND BURST
	    seq_inst.scenario = 20;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq =0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 2------RESET
   	    seq_inst.scenario = 2;
        seq_inst.hrst_n_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
 
  

       
        //scenario 20-----WRITE RAND BURST
	    seq_inst.scenario = 20;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq =1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
        	    	            
       
       end

 
      `uvm_info(get_name(),$sformatf("step 6 : inside test done = ahb_master_burst_test"),UVM_MEDIUM);
     phase.drop_objection(this); //droping objection after testing all test case scenarios this will end the test and simulation  	
    //uvm_test_done.set_drain_time(this,10000);
  endtask
 
endclass
 

