class csr_hpmc_uncovered_test extends uvm_test;
 
  csr_env env;

  csr_hpmc_uncovered_seq hpmc_seq;
  
  `uvm_component_utils(csr_hpmc_uncovered_test)
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
		hpmc_seq = csr_hpmc_uncovered_seq::type_id::create("hpmc_seq",this); 
		repeat(1000)
		begin
		hpmc_seq.count=4;
		hpmc_seq.start(env.agent.sequencer); 
		end
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass
