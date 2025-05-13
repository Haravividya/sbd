class jtag_env  extends uvm_env;

  `uvm_component_utils(jtag_env)

   //ENV class will have agent and scoreboard as its sub component
  jtag_agent  agt;
  jtag_scoreboard scb;
  

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build phase - Construct agent and get virtual interface handle from test  and pass it down to agent
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = jtag_agent::type_id::create("agt", this);
    scb = jtag_scoreboard::type_id::create("scb", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      agt.mon.monitor_analysis_port.connect(scb.sb_analysis_imp);
  endfunction

endclass
