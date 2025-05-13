/**************************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_agent.sv
Description: This module contains sequencer,driver and monitor 
handles & objects and connect phase
***************************************************************/
//spi_agent is derived from uvm_agent base class
class spi_agent extends uvm_agent;
   
   //factory registration
   `uvm_component_utils(spi_agent) 
   
   spi_sequencer sequencer_inst;   //sequencer handle
   spi_driver    driver_inst;      //driver handle
   spi_monitor   monitor_inst;     //monitor handle
   
   //constructor
   function new (string name = "spi_agent", uvm_component parent);
     super.new(name, parent);
   endfunction
 
   //build phase
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     sequencer_inst = spi_sequencer::type_id::create("sequencer_inst", this);
     driver_inst    = spi_driver::type_id::create("driver_inst", this);
     monitor_inst   = spi_monitor::type_id::create("monitor_inst", this);
   endfunction
 
   //connect phase
   function void connect_phase(uvm_phase phase);
     driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
   endfunction
 
endclass
