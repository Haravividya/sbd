class csr_clear_uncovered_test extends uvm_test;
 
  csr_env env;
  csr_clear_uncovered_sequence clear_seq;
  
  `uvm_component_utils(csr_clear_uncovered_test)
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
		clear_seq = csr_clear_uncovered_sequence::type_id::create("clear_seq",this);
			clear_seq.count=100;
		clear_seq.start(env.agent.sequencer); 	
		
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass 
