


class i2cm_env extends uvm_env;
  `uvm_component_utils(i2cm_env)

  i2cm_agentin agent_inst;
  i2cm_agent_new agent_inst_new;
  i2cm_sb sb_inst;
 
  //ramp_coverage_tb coverage_inst;
  
  function new(string name="i2cm_env",uvm_component parent) ;
     super.new(name,parent);
  endfunction
   
   //build phase
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
	 `uvm_info(get_name(),$sformatf("Inside env build phase"),UVM_MEDIUM)
     agent_inst=i2cm_agentin::type_id::create("agent_inst",this);
     agent_inst_new=i2cm_agent_new::type_id::create("agent_inst_new",this);
     sb_inst=i2cm_sb::type_id::create("sb_inst",this);
     //coverage_inst=ramp_coverage_tb::type_id::create("coverage_inst",this);
   endfunction
   
   //connect phase -need to connect monitor and sb
   function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
	agent_inst.monitor_inst.item_collected_port.connect(sb_inst.item_collected_export);
	agent_inst_new.monitor_inst_new.item_chk_port.connect(sb_inst.item_chk_export);
  endfunction
endclass
