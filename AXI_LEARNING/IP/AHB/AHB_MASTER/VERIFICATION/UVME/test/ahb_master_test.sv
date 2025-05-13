/***********************************************************************
Project name:ahb_master 
Description: This is the module which has the test cases 
File name:ahb_master_test.sv
************************************************************************/

//user defined class derived from base class 
class ahb_master_test_tb extends uvm_test;

//factory registration
 `uvm_component_utils(ahb_master_test_tb) 

//declaring uvm test components
  ahb_master_env_tb env_inst;  // uvm environment
  ahb_master_sequence_tb seq_inst;  // uvm sequence
  

//constructor
  function new(string name="ahb_master_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
//build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //creating the obj of env and sequence components using create() method
     env_inst = ahb_master_env_tb::type_id::create("env_inst", this);
     seq_inst = ahb_master_sequence_tb::type_id::create("seq_inst");
  endfunction
 
//run phase 
  task run_phase(uvm_phase phase);
  
     phase.raise_objection(this); //raising objection to test the scenarios 	
      `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM);
        
       repeat(30)
        begin
        //RESET TEST
   	    //scenario 1
   	    seq_inst.scenario = 1;
        seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq=0;
        seq_inst.isize_seq=0;
        seq_inst.wdata_seq=0;
        seq_inst.hrdata_seq=0;
        seq_inst.iwrite_seq=0;
        seq_inst.hready_seq=0;
        seq_inst.hresp_seq=0;
        seq_inst.iburst_seq=0;
        seq_inst.itrans_seq=0;
        seq_inst.busreq_seq=0;
        seq_inst.hgrant_seq=0;

        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	    
        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	         
      
        //scenario 1
   	    seq_inst.scenario = 1;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq=0;
        seq_inst.isize_seq=0;
        seq_inst.wdata_seq=0;
        seq_inst.hrdata_seq=0;
        seq_inst.iwrite_seq=0;
        seq_inst.hready_seq=0;
        seq_inst.hresp_seq=0;
        seq_inst.iburst_seq=0;
        seq_inst.itrans_seq=0;
        seq_inst.busreq_seq=0;
        seq_inst.hgrant_seq=0;

        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	    
        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345670;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


       
 
	     //WRITE TEST
        //scenario 4
   	    seq_inst.scenario = 4;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq = 1;      
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

	    //scenario 5
   	    seq_inst.scenario = 5;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq = 1;
        seq_inst.wdata_seq = 32'h12340000;      
        seq_inst.start(env_inst.agent_inst.sequencer_inst);	 


        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        
         //READ TEST
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



        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


         // ADDR TEST
        //scenario 8
	    seq_inst.scenario = 8;
	    seq_inst.hrst_n_seq = 1;       
        seq_inst.busreq_seq = 0;        
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 8
	    seq_inst.scenario = 8;
	    seq_inst.hrst_n_seq = 1;       
        seq_inst.busreq_seq = 1;        
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	         
      
        //scenario 9
   	    seq_inst.scenario = 9;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;       
        seq_inst.busreq_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst); 


        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


       
         //HGRANT TEST
        //scenario 10
	    seq_inst.scenario = 10;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hgrant_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 10
	    seq_inst.scenario = 10;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hgrant_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

	         
        //scenario 11
	    seq_inst.scenario = 11;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678; 
        seq_inst.hready_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 11
	    seq_inst.scenario = 11;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678; 
        seq_inst.hready_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

     


        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 12
   	    seq_inst.scenario = 12;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hready_seq = 0;
        seq_inst.hgrant_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	    	    
        //scenario 12
   	    seq_inst.scenario = 12;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hready_seq = 1;
        seq_inst.hgrant_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst); 



        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);



         //BUSREQ TEST
        //scenario 13
	    seq_inst.scenario = 13;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.busreq_seq = 0;
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        //scenario 13
	    seq_inst.scenario = 13;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.busreq_seq = 1;
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	         
      
        //scenario 14
	    seq_inst.scenario = 14;
	    seq_inst.hrst_n_seq = 1;        
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);



        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);



         //HREADY TEST
        //scenario 15
	    seq_inst.scenario = 15;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.hready_seq = 0;
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 15
	    seq_inst.scenario = 15;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.hready_seq = 1;
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	         
      
        //scenario 16
	    seq_inst.scenario = 16;
	    seq_inst.hrst_n_seq = 1;        
	    seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

       
        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);



         //HRESP TEST
        //scenario 17
	    seq_inst.scenario = 17;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hresp_seq = 0;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);
	 
        //scenario 17
	    seq_inst.scenario = 17;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);        
      
        //scenario 18
   	    seq_inst.scenario = 18;
        seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;     
        seq_inst.start(env_inst.agent_inst.sequencer_inst);



        //scenario 2
	    seq_inst.scenario = 2;
	    seq_inst.hrst_n_seq = 0;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);


        
         //BURST TEST
        //scenario 19-----READ SINGLE BEAT
	    seq_inst.scenario = 19;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iburst_seq = 3'b000;
        seq_inst.iwrite_seq =0;
        seq_inst.hresp_seq = 1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

        //scenario 20-----WRITE RAND BURST
	    seq_inst.scenario = 20;
	    seq_inst.hrst_n_seq = 1;
        seq_inst.addr_seq =32'h12345678;
        seq_inst.iwrite_seq =1;
        seq_inst.start(env_inst.agent_inst.sequencer_inst);

       end

        

       

 
      `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM);
     phase.drop_objection(this); //droping objection after testing all test case scenarios this will end the test and simulation  	
    //uvm_test_done.set_drain_time(this,10000);
  endtask
 
endclass
 
