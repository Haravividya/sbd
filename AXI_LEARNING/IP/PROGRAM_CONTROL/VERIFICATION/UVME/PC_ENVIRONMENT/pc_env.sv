class pc_env extends uvm_env;

 `uvm_component_utils(pc_env)

 pc_agent pc_agnt;
 pc_scoreboard pc_scb;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    pc_agnt  = pc_agent::type_id::create("pc_agnt",this);
    pc_scb   = pc_scoreboard::type_id::create("pc_scb",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    pc_agnt.pc_mon.analysis_port_monitor.connect(pc_scb.scoreboard_analysis_imp); 
  endfunction

endclass:pc_env
