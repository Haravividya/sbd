
//environment

class apb_slave1_env extends uvm_env;
   
  //---------------------------------------
  // agent and scoreboard instance
  //---------------------------------------
  apb_slave1_agent      apb_slave1_agnt;

  apb_slave1_scoreboard apb_slave1_scb;
   
  `uvm_component_utils(apb_slave1_env)
   
  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  //---------------------------------------
  // build_phase - crate the components
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 
    apb_slave1_agnt = apb_slave1_agent::type_id::create("apb_slave1_agnt", this);
   apb_slave1_scb  = apb_slave1_scoreboard::type_id::create("apb_slave1_scb", this);
  endfunction : build_phase
   
  //---------------------------------------
  // connect_phase - connecting monitor and scoreboard port
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    apb_slave1_agnt.monitor.item_collected_port.connect(apb_slave1_scb.item_collected_export);
  endfunction : connect_phase
 
endclass :apb_slave1_env
