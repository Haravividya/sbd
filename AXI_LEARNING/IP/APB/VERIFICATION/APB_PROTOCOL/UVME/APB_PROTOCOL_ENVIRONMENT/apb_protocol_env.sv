/***********************************************************

File name   : apb_protocol_env.svh
Description :  A UVM contains multiple , reusable verification components and defines their deafult config as reqd by the application. 

eg : UVM environment - may have multiple agents for different interfaces , a common scoreboard, a functional coverage collector.

***********************************************************/
class apb_protocol_env extends uvm_env;

  apb_protocol_agent agent;   
  apb_protocol_scoreboard scoreboard;

  `uvm_component_utils(apb_protocol_env) 

  function new (string name ="apb_protocol_env",uvm_component parent);
	super.new(name, parent);
	 `uvm_info("Environment ", $sformatf("Initial Entry to ENV"), UVM_LOW)
  endfunction

//component creation : Agent , Scoreboard
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent      =  apb_protocol_agent :: type_id :: create("agent",this);
    scoreboard =  apb_protocol_scoreboard :: type_id :: create("scoreboard",this);
  endfunction:build_phase

//Connect phase
  function void connect_phase(uvm_phase phase);
    agent.monitor.monitor_analysis_port.connect(scoreboard.analysis_imp_scoreboard);
     // Monitor port : Monitor_analysis_port
     //Scoreboard port : analysis_imp_scoreboard
  endfunction:connect_phase

endclass : apb_protocol_env


 

  

