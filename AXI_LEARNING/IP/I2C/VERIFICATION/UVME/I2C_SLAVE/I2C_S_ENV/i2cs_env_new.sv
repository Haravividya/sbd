//--------------------------------------------------------------------------
//------------------------file name - i2cs_env.sv----------------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------
class i2cs_env_tb extends uvm_env;
  `uvm_component_utils(i2cs_env_tb)

  //instantiation for agent and scoreboard
  i2cs_agent_tb agent_inst;
  i2cs_sb sb_inst;
  //i2cs_coverage_tb coverage_inst;
  
  //factory registration
  function new(string name="i2cs_env_tb",uvm_component parent) ;
    super.new(name,parent);
  endfunction
   
   //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      `uvm_info(get_name(),$sformatf("Inside env build phase"),UVM_MEDIUM)
      agent_inst=i2cs_agent_tb::type_id::create("agent_inst",this);
      sb_inst=i2cs_sb::type_id::create("sb_inst",this);
     //coverage_inst=i2cs_coverage_tb::type_id::create("coverage_inst",this);
  endfunction
   
   //connect phase -need to connect monitor and sb
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      agent_inst.monitor_inst.item_collected_port.connect(sb_inst.item_collected_export);
      //agent_inst.monitor_inst.item_check_port.connect(sb_inst.item_check_export);
  endfunction
endclass