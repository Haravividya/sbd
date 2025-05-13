class pmp_machine_mode_test_tb extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_machine_mode_test_tb)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_machine_mode_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
  endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
    repeat(10) 
    begin
  	seq_inst.scenario = 58;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=0;
       seq_inst.csr_read_addr_seq=0;
       seq_inst.csr_write_data_seq=32'h0F0F0F0F;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 59;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a0;
       seq_inst.csr_write_data_seq=32'h1111110F;
      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 60;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a2;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a1;
       seq_inst.csr_write_data_seq=32'h1F8F1F7F;
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 
   
   	seq_inst.scenario = 61;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a3;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a2;
       seq_inst.csr_write_data_seq=32'h0F0F0F0F;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 62;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b0;
       
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a3;
      seq_inst.csr_write_data_seq=32'h0F0F0F0F;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 63;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b1;
      
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b0;

      seq_inst.start(env_inst.agent_inst.sequencer_inst);

    	seq_inst.scenario = 64;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b2;
       seq_inst.csr_write_en_seq=1;
       
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b1;

       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 65;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b3;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b2;

     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 66;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b4;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b3;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 67;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b5;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b4;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 68;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b6;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b5;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    	seq_inst.scenario = 69;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b7;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b6;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 70;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b8;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b7;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 71;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b9;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b8;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 72;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3ba;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3b9;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 73;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bb;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3ba;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 
 
 	seq_inst.scenario = 74;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bc;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3bb;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 75;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bd;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3bb;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 





    end

    //seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
    `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass


