class debug_env  extends uvm_env;

  `uvm_component_utils(debug_env)

   //ENV class will have agent and scoreboard as its sub component
  debug_agent  agt;
  debug_scoreboard scb;
  debug_coverage cov; 

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build phase - Construct agent and get virtual interface handle from test  and pass it down to agent
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = debug_agent::type_id::create("agt", this);
    scb = debug_scoreboard::type_id::create("scb", this);
    cov = debug_coverage::type_id::create("cov" , this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      agt.mon.port_con1.connect(scb.sb_port_con1);
      agt.mon.port_con2.connect(scb.sb_port_con2);
      agt.mon.port_con1.connect(cov.analysis_export);
      //agt.mon.monitor_analysis_port.connect(scb.sb_analysis_imp);
      //agt.mon.monitor_analysis_port.connect(cov.analysis_export); 
  endfunction

endclass
