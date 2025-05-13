class mul_env extends uvm_env;

 `uvm_component_utils(mul_env)

 mul_agent agent;
 mul_scb   scoreboard;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    agent = mul_agent::type_id::create("agent",this);

   scoreboard = mul_scb::type_id::create("scoreboard",this);

  endfunction

   function void connect_phase(uvm_phase phase);

    agent.monitor.analysis_port_monitor.connect(scoreboard.analysis_imp_scb);
    
  endfunction
  
endclass
