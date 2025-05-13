/***********************************************************

File name   : apb_protocol_agent.svh
Description : A user defined agent is extended from uvm_agent , inherited by uvm_component 

An agent : Driver , sequencer , monitor .  Agent - Passive , Active. Active agent - generate stimulus and drive to DUT. Passive agent - only monitor. 

Agent sends data to Scoreboard via analysis port. 
***********************************************************/



class apb_protocol_agent extends uvm_agent;

  `uvm_component_utils(apb_protocol_agent)

//constructor
  function new (string name ="apb_protocol_agent" , uvm_component parent);
    super.new(name,parent);
    `uvm_info("Agent ", $sformatf(" Initial Entry to agent"), UVM_LOW)
  endfunction: new


//Declare driver , sequencer , Monitor 
  apb_protocol_sequencer sequencer;
  apb_protocol_driver driver;
  apb_protocol_monitor monitor;

//build phase 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    if(get_is_active() == UVM_ACTIVE) 
    begin
      driver =apb_protocol_driver :: type_id::create("driver",this);
      sequencer= apb_protocol_sequencer :: type_id :: create("sequencer",this);
    end

    monitor = apb_protocol_monitor :: type_id :: create("monitor",this); 
  endfunction:build_phase

//connect phase - Agent
  function void connect_phase (uvm_phase phase);
    if(get_is_active() ==UVM_ACTIVE) 
    begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    //driver port : Seq_item_port
    //sequencer port : seq_item_export
      `uvm_info("Agent ", $sformatf(" Connect Sequencer to Driver"), UVM_LOW)
    end
  endfunction : connect_phase


endclass : apb_protocol_agent

 

  

