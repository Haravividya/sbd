/*************************************************
File name:env_tb.sv
Description:

**************************************************/

class pmp_env_tb extends uvm_env;
  `uvm_component_utils(pmp_env_tb)

  pmp_agent_tb agent_inst;
  pmp_scoreboard_tb sb_inst;
  pmp_coverage_tb coverage_func_inst;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_inst 			= pmp_agent_tb::type_id::create("agent_inst", this);
    sb_inst 			= pmp_scoreboard_tb::type_id::create("sb_inst", this);
   coverage_func_inst 	= pmp_coverage_tb::type_id::create("coverage_func_inst", this);
  endfunction : build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    agent_inst.monitor_inst.port_con1.connect(sb_inst.sb_port_con1);
    //agent_inst.monitor_inst.port_con2.connect(sb_inst.sb_port_con2);
	
   agent_inst.monitor_inst.port_con1.connect(coverage_func_inst.analysis_export); // monitor to coverage
	
  endfunction

endclass
