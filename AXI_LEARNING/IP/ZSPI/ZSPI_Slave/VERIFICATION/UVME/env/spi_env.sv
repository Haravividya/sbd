/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_env.sv
Description: This module contains handles of agent, SB & covg
And conncects agent -> monitor to SB & covg

**************************************************/
//spi_env is derived from uvm_env base class
class spi_env extends uvm_env;
  
  //factory registration
  `uvm_component_utils(spi_env) 

  spi_agent agent_inst;            // agent handle
  spi_scoreboard sb_inst;          // scorboard handle
  spi_coverage coverage_func_inst; // coverage handle

  //constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //creating objects for agent, scoreboard and coverage
    agent_inst 			= spi_agent::type_id::create("agent_inst", this);
    sb_inst 			= spi_scoreboard::type_id::create("sb_inst", this);
    coverage_func_inst 	= spi_coverage::type_id::create("coverage_func_inst", this);
  endfunction : build_phase
  
  //connect phase 
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // monitor to scoreboard
    //connect agent, monitor and scoreboard using TLM interface
    agent_inst.monitor_inst.port_con1.connect(sb_inst.sb_port_con1);    
	
    // monitor to coverage
    agent_inst.monitor_inst.port_con1.connect(coverage_func_inst.analysis_export); 
 
  endfunction

endclass
