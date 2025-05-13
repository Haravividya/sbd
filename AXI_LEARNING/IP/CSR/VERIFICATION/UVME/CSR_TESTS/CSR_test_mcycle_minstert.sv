class csr_test_mcycle_minstret extends uvm_test;
 
  csr_env env;
  csr_seq_mcycle_minstret seq_mcycle_minstret;
  
  `uvm_component_utils(csr_test_mcycle_minstret)
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
		seq_mcycle_minstret = csr_seq_mcycle_minstret::type_id::create("seq_mcycle_minstret",this); 
		repeat(20)
		begin
		seq_mcycle_minstret.scenario=$urandom_range(1,26);
		seq_mcycle_minstret.count=2;
		seq_mcycle_minstret.start(env.agent.sequencer); 
		end
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass
