class pmp_execption_test_tb extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_execption_test_tb)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_execption_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
  endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
    repeat(5) 
    begin
  		seq_inst.scenario = 29;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_en_seq=1;
       seq_inst.kernel_mode_signal_seq=0;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

        seq_inst.scenario = 30;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a0;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 31;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3a2;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a0;
      seq_inst.kernel_mode_signal_seq=1;

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 
   
   	seq_inst.scenario = 32;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a3;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_read_en_seq=0;
       seq_inst.csr_read_addr_seq=12'h3a0;
       seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

      seq_inst.scenario = 33;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a3;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=0;
       seq_inst.csr_read_addr_seq=0;
       seq_inst.kernel_mode_signal_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

        seq_inst.scenario = 34;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b0;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a3;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

      seq_inst.scenario = 35;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=0;
       seq_inst.csr_read_addr_seq=0;
       seq_inst.kernel_mode_signal_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

        seq_inst.scenario = 36;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b2;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_read_addr_seq=12'h3a0;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 
      
       seq_inst.scenario = 37;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b3;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

        seq_inst.scenario = 38;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b4;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 



         seq_inst.scenario = 39;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3b5;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 
  
       seq_inst.scenario = 40;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b6;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 
       
         seq_inst.scenario = 41;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b7;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 
      
         seq_inst.scenario = 42;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b8;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 
      
      seq_inst.scenario = 43;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b9;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

         seq_inst.scenario = 44;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3ba;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 


         seq_inst.scenario = 45;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bb;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

         seq_inst.scenario = 46;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bc;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

         seq_inst.scenario = 47;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bd;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

      seq_inst.scenario = 48;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3be;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

      seq_inst.scenario = 49;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=0;
       seq_inst.csr_write_addr_seq=12'h3bf;
       seq_inst.csr_write_en_seq=1;
      seq_inst.kernel_mode_signal_seq=1;

      seq_inst.start(env_inst.agent_inst.sequencer_inst); 









    end

    //seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
    `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass



