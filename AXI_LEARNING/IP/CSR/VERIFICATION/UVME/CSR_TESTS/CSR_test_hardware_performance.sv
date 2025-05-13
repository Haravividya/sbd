class csr_test_hpmc extends uvm_test;
 
  csr_env env;
  csr_seq_hpmc seq_hpmc;
  
  `uvm_component_utils(csr_test_hpmc)
  int i;
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    env = csr_env::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin
		seq_hpmc = csr_seq_hpmc::type_id::create("seq_hpmc",this); 
		repeat(1000)
		begin
		seq_hpmc.scenario=$urandom_range(1,26);
		seq_hpmc.count=4;
		seq_hpmc.start(env.agent.sequencer); 
		end
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass
