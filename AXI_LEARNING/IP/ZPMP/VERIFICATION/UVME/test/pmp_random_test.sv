class pmp_random_test_tb extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_random_test_tb)
 

  function new(string name = "pmp_random_test_tb",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
    repeat(200) 
    begin
  
    // scenario 1
    seq_inst.scenario = 1;
    seq_inst.start(env_inst.agent_inst.sequencer_inst);
      end


    //seq_inst.start(env_inst.agent_inst.sequencer_inst);
	
    `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass


