class apb_env extends uvm_env;

  apb_agent agn;
  apb_agentout agn1;
  apb_scoreboard scb;
  //fifo_coverage cov;
 
  `uvm_component_utils(apb_env)
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    agn = apb_agent::type_id::create("agn",this);
    agn1 = apb_agentout::type_id::create("agn1",this);
    scb = apb_scoreboard::type_id::create("scb",this);
    //cov = fifo_coverage::type_id::create("cov",this);
  endfunction
 
  function void connect_phase(uvm_phase phase);
    agn.analysis_port_agent.connect(scb.analysis_imp_scoreboard_mntr2scb);
    agn1.analysis_port_agentout.connect(scb.analysis_imp_scoreboard_mntrout2scb);
    //agn.analysis_port_agent.connect(cov.analysis_export);
  endfunction
 
endclass
