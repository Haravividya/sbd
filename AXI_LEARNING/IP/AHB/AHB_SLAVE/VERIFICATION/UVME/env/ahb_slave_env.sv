/**************************************************************************
Project name:ahb_slave 
Description: This is the module which has agent,scoreboard and coverage
this module make connection between monitor to scoreboard and coverage
File name:ahb_slave_env.sv
**************************************************************************/
//user defined class derived from base class 
class ahb_slave_env_tb extends uvm_env;

  //factory registration
  `uvm_component_utils(ahb_slave_env_tb) 

  //creating handle for env components
  ahb_slave_agent_tb agent_inst;
  ahb_slave_scoreboard_tb scoreboard_inst;
  ahb_slave_coverage coverage_inst;

  //constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
 
  //build phase - creates the obj of agent, scoreboard and coverage
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_inst      = ahb_slave_agent_tb::type_id::create("agent_inst", this);
    scoreboard_inst = ahb_slave_scoreboard_tb::type_id::create("scoreboard_inst", this);
    coverage_inst   = ahb_slave_coverage::type_id::create("coverage_inst", this);
  endfunction 
 
  //connect_phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   
    // connection between scoreboard and monitor    
    agent_inst.monitor_inst.item_collected_port.connect(scoreboard_inst.item_collected_export); 
	// connection between coverage and monitor	
    agent_inst.monitor_inst.item_collected_port.connect(coverage_inst.analysis_export); 
  
  endfunction

endclass

