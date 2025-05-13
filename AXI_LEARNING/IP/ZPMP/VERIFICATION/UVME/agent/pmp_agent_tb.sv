/*************************************************
File name:pmp_agent_tb.sv
Description:

**************************************************/

class pmp_agent_tb extends uvm_agent;
   `uvm_component_utils(pmp_agent_tb) // factory registration
 
   pmp_sequencer_tb sequencer_inst;
   pmp_driver_tb    driver_inst;
   pmp_monitor_tb   monitor_inst;
 
  // static int var1;
   
   function new (string name, uvm_component parent);
     super.new(name, parent);
   endfunction
 
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     sequencer_inst = pmp_sequencer_tb::type_id::create("sequencer_inst", this);
     driver_inst    = pmp_driver_tb::type_id::create("driver_inst", this);
     monitor_inst   = pmp_monitor_tb::type_id::create("monitor_inst", this);
   endfunction
 
   function void connect_phase(uvm_phase phase);
     driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
	 //var1 = 5;
   endfunction
 
endclass

