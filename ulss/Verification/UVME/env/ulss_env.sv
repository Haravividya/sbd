class ulss_env extends uvm_env;

  //factory registration
  `uvm_component_utils(ulss_env)

  //creating agent handle
   ulss_agent agent;
  //ulss_coverage cov;
  ulss_scoreboard sbd;

  //constructor
  function new(string name = "ulss_env",uvm_component parent=null);
    super.new(name,parent);
    `uvm_info("env_class", "Inside constructor!", UVM_HIGH)
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ulss_agent::type_id::create("ulss_agent",this); 
   // cov = ulss_coverage::type_id::create("cov",this);
   sbd = ulss_scoreboard::type_id::create("sbd",this);
   `uvm_info("env_class", "Inside Build Phase!", UVM_HIGH)
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
   // agent.mon_inst.ap.connect(cov.analysis_export);
   agent.mon.analysis_port.connect(sbd.dut_analysis_imp);
   `uvm_info("env_class", "Inside connect Phase!", UVM_HIGH)
  endfunction
  
endclass
