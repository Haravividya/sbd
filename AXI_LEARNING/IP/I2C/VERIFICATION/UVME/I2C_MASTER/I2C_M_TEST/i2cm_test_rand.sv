
//..........................I2C MASTER RANDOM VALUES TEST FILE..........................

class i2cm_test_rand extends uvm_test;

  `uvm_component_utils(i2cm_test_rand)
  
  //env and sequence instantiation
  i2cm_env env_inst;
  i2cm_sequence seqnc_inst;
 
  function new(string name="i2cm_test_rand", uvm_component parent=null) ;
    super.new(name, parent);
  endfunction
   
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_inst=i2cm_env::type_id::create("env_inst",this);
    seqnc_inst=i2cm_sequence::type_id::create("seqnc_inst");
  endfunction

  //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	`uvm_info("Test file",$sformatf("inside test"),UVM_MEDIUM) 
    phase.raise_objection(this);
	
  
 
    seqnc_inst.scenario=0;
    `uvm_info("Test file",$sformatf("start rst"),UVM_MEDIUM)
    seqnc_inst.start(env_inst.agent_inst.sequencer_inst);


    for(int i=0;i<10;i=i+1)
    begin
      seqnc_inst.scenario=1;
      `uvm_info("Test file",$sformatf("start rst=0"),UVM_MEDIUM)
      seqnc_inst.start(env_inst.agent_inst.sequencer_inst);	 
    end   


   phase.drop_objection(this); 
    `uvm_info("Test file",$sformatf("test done"),UVM_MEDIUM)
  endtask
endclass
