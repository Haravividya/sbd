class csr_rand_test extends uvm_test;
 
  csr_env env;
  csr_rand_sequence rand_seq;
  
  `uvm_component_utils(csr_rand_test)
  int i;
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    env = csr_env::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    $display("testing");
    phase.raise_objection(this);
    begin
		rand_seq = csr_rand_sequence::type_id::create("rand_seq",this); 
		rand_seq.count=1000;
		rand_seq.start(env.agent.sequencer); 
    end
	#100;
    phase.drop_objection(this);

  endtask

endclass