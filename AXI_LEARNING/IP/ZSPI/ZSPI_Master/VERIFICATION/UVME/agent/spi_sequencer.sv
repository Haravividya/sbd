/*************************************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_sequencer.sv
Description: This module acts as a sequencer is a mediator who establishes 
a connection between sequence and driver via handshaking
**************************************************************************/

//spi_sequencer is derived from uvm_sequencer base class
class spi_sequencer extends uvm_sequencer#(spi_seq_item);
  
  //factory registration
  `uvm_component_utils(spi_sequencer)    

  //constructor
  function new(string name = "spi_sequencer", uvm_component parent);
    super.new(name,parent);     
  endfunction 
  
endclass
