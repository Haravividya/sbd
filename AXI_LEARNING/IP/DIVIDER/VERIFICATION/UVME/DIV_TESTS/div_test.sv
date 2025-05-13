
class div_test extends uvm_test;
 
  div_env env;
  div_sequence seq;
  
  `uvm_component_utils(div_test)
  //int i;
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
 virtual function void build_phase(uvm_phase phase);
    env = div_env::type_id::create("env",this);
    seq = div_sequence::type_id::create("seq",this);
  
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin 
      repeat(100)begin
           seq.scenario = $urandom_range(1,16);
        `uvm_info(get_name , $sformatf("Step1: Inside Test") , UVM_MEDIUM);
	    seq.start(env.agent.sequencer); 
        `uvm_info(get_name , $sformatf("Step: Test Completed") , UVM_MEDIUM);
        end
     end
    #10;
     phase.drop_objection(this);

     endtask

endclass


