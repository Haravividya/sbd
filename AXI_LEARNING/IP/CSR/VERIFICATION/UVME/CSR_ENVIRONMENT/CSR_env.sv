class csr_env extends uvm_env;

  csr_agent agent;
  csr_sb scoreboard;
 
  `uvm_component_utils(csr_env)
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    agent = csr_agent::type_id::create("agent",this);
    scoreboard = csr_sb::type_id::create("scoreboard",this);
  endfunction
 
  function void connect_phase(uvm_phase phase);
    agent.monitor.monitor_analysis_port.connect(scoreboard.scoreboard_analysis_imp);
  endfunction
 
endclass
