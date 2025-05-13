//...........................I2C MASTER TEST FILE........................

class i2cm_test extends uvm_test;

  `uvm_component_utils(i2cm_test)
  
  //env and sequence instantiation
  i2cm_env env_inst;
  i2cm_sequence seqnc_inst;
 
  function new(string name="i2cm_test", uvm_component parent=null) ;
    super.new(name, parent);
  endfunction
   
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_inst=i2cm_env::type_id::create("env_inst",this);
    seqnc_inst=i2cm_sequence::type_id::create("seqnc_inst");
  endfunction

  //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	`uvm_info("Test file",$sformatf("inside test"),UVM_MEDIUM) 
    phase.raise_objection(this);
	
    begin
	
      //reset scenario   
      seqnc_inst.scenario=0;
      `uvm_info("Test file",$sformatf("start rst"),UVM_MEDIUM)
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
    
      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd00;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd57;     
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=2;
      `uvm_info("inside","scenario2",UVM_MEDIUM)  	 
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd45;
      seqnc_inst.i2c_master_data_wr_seq=8'h0F;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
    
      seqnc_inst.scenario=2;
      `uvm_info("inside","scenario2",UVM_MEDIUM)
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd28;
      seqnc_inst.i2c_master_data_wr_seq=8'd80;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=0;
      `uvm_info("Test file",$sformatf("start rst"),UVM_MEDIUM)
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
     
      seqnc_inst.scenario=2;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=0; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd09;
      seqnc_inst.i2c_master_data_wr_seq=8'd11;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=2;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=0; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd08;
      seqnc_inst.i2c_master_data_wr_seq=8'd10;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd85;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd50;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
      
      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd00;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd150;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd46;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd11;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=2;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd85;
      seqnc_inst.i2c_master_data_wr_seq=8'd100;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      seqnc_inst.scenario=2;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=0; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd09;
      seqnc_inst.i2c_master_data_wr_seq=8'd11;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
      
      seqnc_inst.scenario=0;
      `uvm_info("Test file",$sformatf("start rst"),UVM_MEDIUM)
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
    
      seqnc_inst.scenario=2;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=0;
      seqnc_inst.i2c_master_addr_wr_seq=7'd23;
      seqnc_inst.i2c_master_data_wr_seq=8'd56;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.wr_data_ack_seq=0;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
           
      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd50;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd67;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
     
      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd00;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd100;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);
       
      seqnc_inst.scenario=3;
      seqnc_inst.seq_item_inst.i2c_reset_in=0;
      seqnc_inst.i2c_start_seq=1; 
      seqnc_inst.rw_seq=1;
      seqnc_inst.i2c_master_addr_wr_seq=7'd00;
      seqnc_inst.wr_addr_ack_seq=0;
      seqnc_inst.test_sdam_out_seq=8'd150;
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);

      end
    phase.drop_objection(this); 
    `uvm_info("Test file",$sformatf("test done"),UVM_MEDIUM)
  endtask
endclass
