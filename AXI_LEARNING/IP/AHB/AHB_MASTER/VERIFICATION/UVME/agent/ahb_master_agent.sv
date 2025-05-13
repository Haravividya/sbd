/********************************************************************************
Project name:ahb_master 
Description: This is the module which has the components sequencer,driver and monitor 
File name:ahb_master_agent.sv
********************************************************************************/

//user defined class derived from base class 
class ahb_master_agent_tb extends uvm_agent;

//factory registration
 `uvm_component_utils(ahb_master_agent_tb) 

//creating handles for agent components
 ahb_master_sequencer_tb sequencer_inst;
 ahb_master_driver_tb    driver_inst;
 ahb_master_monitor_tb   monitor_inst;
  
//constructor
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  
//build phase 
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
//creates the obj of agent components using create() method
      sequencer_inst = ahb_master_sequencer_tb::type_id::create("sequencer_inst", this);
      driver_inst    = ahb_master_driver_tb::type_id::create("driver_inst", this);
      monitor_inst   = ahb_master_monitor_tb::type_id::create("monitor_inst", this);  
  endfunction
   
//connect_phase
  function void connect_phase(uvm_phase phase);
//connection between sequencer and driver
      driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
  endfunction
 
endclass

