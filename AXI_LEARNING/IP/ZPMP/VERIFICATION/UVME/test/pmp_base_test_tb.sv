/*************************************************
File name:pmp_base_test.sv
Description:

**************************************************/


class pmp_base_test_tb extends uvm_test;
 
  `uvm_component_utils(pmp_base_test_tb)
 
  pmp_env_tb env_inst;  // uvm environment
  pmp_seq_tb seq_inst;  // uvm sequence
  pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_base_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_inst = pmp_env_tb::type_id::create("env_inst", this);
    seq_inst = pmp_seq_tb::type_id::create("seq_inst");
    agent_inst = pmp_agent_tb::type_id::create("agent_inst",this);
  endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
    repeat(5) 
    begin
    //seq_inst.scenario = 1;
    // seq_inst.reset_seq=1;
    
    //seq_inst.start(env_inst.agent_inst.sequencer_inst);

    // scenario 2
/*	seq_inst.scenario = 2;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
	// scenario 3
	seq_inst.scenario = 3;
	seq_inst.csr_rst_seq = 0;
    seq_inst.kernel_mode_signal_seq=0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 4;
	seq_inst.csr_rst_seq = 0;
    seq_inst.kernel_mode_signal_seq=0;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);


 	seq_inst.scenario = 5;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 6;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 7;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a2;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 
   
   	seq_inst.scenario = 9;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a3;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 10;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b4;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 11;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b5;
       seq_inst.csr_write_en_seq=1;
      seq_inst.start(env_inst.agent_inst.sequencer_inst);

    	seq_inst.scenario = 12;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b6;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 13;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b7;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 14;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b8;
       seq_inst.csr_write_en_seq=1;  
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 15;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b9;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 16;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3ba;
       seq_inst.csr_write_en_seq=1;  
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    	seq_inst.scenario = 17;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bb;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 18;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bc;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 19;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bd;
       seq_inst.csr_write_en_seq=1;  
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 20;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3be;
       seq_inst.csr_write_en_seq=0;
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 21;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bf;
       seq_inst.csr_write_en_seq=1;  
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

*/

end
    //seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
    `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass


