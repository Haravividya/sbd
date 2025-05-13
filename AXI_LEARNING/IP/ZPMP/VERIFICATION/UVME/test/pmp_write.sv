class pmp_write extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_write)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_write",uvm_component parent=null);
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
  	seq_inst.scenario = 78;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_data_seq=32'b00000000_00000000_00000000_00001111;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 79;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b0;
       seq_inst.csr_write_data_seq=32'b00010000_00000001_00000000_10101010	;
       seq_inst.csr_read_addr_seq=12'h3a0;
       seq_inst.csr_read_en_seq=1;
       seq_inst.csr_write_en_seq=1;
       
      seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 80;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_write_data_seq=32'b00000000_00000000_00001111_00000000;

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 
   
   	seq_inst.scenario = 81;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'b00010000_00000001_00000010_11010101;					

       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 82;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_data_seq=32'b00000000_00001111_00000000_00000000;

       seq_inst.csr_write_en_seq=1;
       
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 83;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b2;
       seq_inst.csr_write_en_seq=1;
      seq_inst.csr_write_data_seq=32'b00010000_00000001_00000111_00101100;					
 
      seq_inst.start(env_inst.agent_inst.sequencer_inst);

    	seq_inst.scenario = 84;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a0;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'b00001111_00000000_00000000_00000000;

       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 85;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b3;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'h10010FDA;					
       
     seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 86;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'b00000000_00000000_00000000_00001111;

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 87;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b4;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'h1007D7F6;					

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 88;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
        seq_inst.csr_write_data_seq=32'b00000000_00000000_00001111_00010111;

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    	seq_inst.scenario = 89;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b5;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'h104BA912;					

       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 90;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'b00000000_00001111__00010111_00000000;

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 91;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b6;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.csr_write_data_seq=32'h10542335;					

       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 92;
       seq_inst.csr_rst_seq=1;

       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3a1;
       seq_inst.csr_write_en_seq=1;
       seq_inst.csr_write_data_seq=32'b00001111_00001111__00010111_0000000;
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 93;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3b7;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.csr_write_data_seq=32'h528E58FC;					
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 
 
 	seq_inst.scenario = 94;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bc;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);

    seq_inst.scenario = 95;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bd;
       seq_inst.csr_write_en_seq=1;
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 96;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bc;
       seq_inst.csr_write_en_seq=1;
    seq_inst.start(env_inst.agent_inst.sequencer_inst); 

     seq_inst.scenario = 97;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3bd;
       seq_inst.csr_write_en_seq=0;
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

   seq_inst.scenario = 98;
       seq_inst.csr_rst_seq=1;
       seq_inst.machine_mode_valid_seq=1;
       seq_inst.csr_write_addr_seq=12'h3be;
       seq_inst.csr_write_en_seq=1; 
       seq_inst.start(env_inst.agent_inst.sequencer_inst); 

    end

    //seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
    `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass


