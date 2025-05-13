class div_env extends uvm_env;

 `uvm_component_utils(div_env)

 div_agent agent;
 div_scb   scoreboard;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    agent = div_agent::type_id::create("agent",this);

   scoreboard = div_scb::type_id::create("scoreboard",this);

  endfunction

   function void connect_phase(uvm_phase phase);

    agent.monitor.analysis_port_monitor.connect(scoreboard.analysis_imp_scb);
    
  endfunction
  
endclass

