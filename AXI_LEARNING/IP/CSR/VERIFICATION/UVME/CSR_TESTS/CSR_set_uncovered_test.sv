class csr_set_uncovered_test extends uvm_test;
 
  csr_env env;
  csr_set_uncovered_sequence set_un_seq;
  
  `uvm_component_utils(csr_set_uncovered_test)
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
		set_un_seq = csr_set_uncovered_sequence::type_id::create("set_un_seq",this);
			set_un_seq.count=100;
		set_un_seq.start(env.agent.sequencer); 	
		
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass 







	

