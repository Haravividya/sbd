
class mul_test extends uvm_test;
 
  mul_env env;
  mul_sequence seq;
  
  `uvm_component_utils(mul_test)
  //int i;
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
 virtual function void build_phase(uvm_phase phase);
    env = mul_env::type_id::create("env",this);
    seq = mul_sequence::type_id::create("seq",this);
  
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin 
      repeat(100) begin
           seq.scenario = 64; //$urandom_range(2,64);
        `uvm_info("Test" , $sformatf("Step1: Inside Test") , UVM_LOW);
	    seq.start(env.agent.sequencer); 
        `uvm_info(get_name() , $sformatf("Step: Test Completed") , UVM_LOW);
        end
     end
    #10;
     phase.drop_objection(this);

     endtask

endclass



