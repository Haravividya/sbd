class csr_test extends uvm_test;
 
  csr_env env;
  csr_sequence seq;
  
  `uvm_component_utils(csr_test)
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
		seq = csr_sequence::type_id::create("seq",this);
			repeat(100)begin
			seq.scenario=$urandom_range(1,26);
			seq.count=4;
		seq.start(env.agent.sequencer); 	
		end
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass
