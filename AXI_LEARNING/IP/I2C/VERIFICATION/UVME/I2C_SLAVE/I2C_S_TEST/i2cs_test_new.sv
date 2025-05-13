
//-----------------------------------------------------------------------------------------------
//file name: i2cs_test.sv
//project name: i2c_slave
//-------------------------------------------------------------------------------------------------


class i2cs_test extends uvm_test;

  //component registration
  `uvm_component_utils(i2cs_test)
  
  //env and sequence instantiation
  i2cs_env_tb env_inst;
  i2cs_sequence_tb seqnc_inst;
  
  // factory registration
  function new(string name="i2cs_test", uvm_component parent=null) ;
    super.new(name, parent);
  endfunction
   
  //build phase
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     env_inst=i2cs_env_tb::type_id::create("env_inst",this);  // creating memory for environment
     seqnc_inst=i2cs_sequence_tb::type_id::create("seqnc_inst"); //creating memory for sequence
   endfunction

  //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    begin
      //test scenorios
      seqnc_inst.scenario=0;   //reset scenario
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
	  
      // transaction 1
      seqnc_inst.scenario=2;     // write mode 
      seqnc_inst.addr_seq=7'd69;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd101;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 


      seqnc_inst.scenario=3;  // read mode
      seqnc_inst.addr_seq=7'd69;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 


      //transaction 2
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd22;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd54;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


	  seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd22;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // reset 
      seqnc_inst.scenario=0;   //reset scenario
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // transaction 3
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd77;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd48;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd77;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 


      // transaction 4 without stop bit
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd99;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd55;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd99;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

	  
      // transaction 5 without stop bit
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd43;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd27;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

	  
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd43;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=0;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // transaction 6 without stop bit
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd84;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd68;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

	  
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd84;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=0;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // transaction 7 without stop bit 
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd59;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd96;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

	  
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd59;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=0;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // transaction 8 without stop bit
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd23;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd183;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 

	  
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd23;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=0;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      // transaction 9 with stop bit
      seqnc_inst.scenario=2;
      seqnc_inst.addr_seq=7'd89;
      seqnc_inst.rw_seq=0;
      seqnc_inst.data_seq=8'd4;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 


      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd89;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);



      // trying to read same address of transaction 9
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd89;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst); 


      // trying to read data without writing data
      seqnc_inst.scenario=3;
      seqnc_inst.addr_seq=7'd94;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      
      // checking rw_bit for high impedence
      seqnc_inst.scenario=4;
      seqnc_inst.addr_seq=7'd24;
      seqnc_inst.rw_seq=1;
      seqnc_inst.rd_ack_seq=1;  
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


      seqnc_inst.scenario=4;
      seqnc_inst.addr_seq=7'd30;
      seqnc_inst.rw_seq=0;
      seqnc_inst.rd_ack_seq=1; 
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
	   
    end
    phase.drop_objection(this);
    `uvm_info("Test file",$sformatf("step6: test done"),UVM_MEDIUM)
  endtask
endclass
