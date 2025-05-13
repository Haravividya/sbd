class wdt_env extends uvm_env;

 `uvm_component_utils(wdt_env)

 wdt_agent wdt_agn;
 wdt_scoreboard   wdt_scb;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    wdt_agn = wdt_agent::type_id::create("wdt_agn",this);

    wdt_scb = wdt_scoreboard::type_id::create("wdt_scb",this);

  endfunction

  function void connect_phase(uvm_phase phase);

    wdt_agn.analysis_port_agent.connect(wdt_scb.analysis_imp_scb);

  endfunction

endclass
