/*************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_monitor.sv
Description: This module contains monitor that samples the 
DUT signals through the virtual interface and converts the 
signal level activity to the transaction level.
**************************************************/

//spi_monitor is derived from uvm_monitor base class
class spi_monitor extends uvm_monitor;
  
  //factory registration
  `uvm_component_utils(spi_monitor) 
 
  //virtual interface for sampling DUT data
  virtual spi_intf interface_inst; 
  
  //seq_item handle to be used in scoreboard and coverage
  spi_seq_item seq_item_con1; 
  
  // TLM analysis_port handle: port_con1
  uvm_analysis_port #(spi_seq_item) port_con1; 

  //constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port_con1 = new("port_con1", this); 

    // virtual Interface : to sample all the signal values of the DUT	
    if(!uvm_config_db#(virtual spi_intf)::get(this,"","interface_inst",interface_inst))
    `uvm_fatal(get_name(),$sformatf("monitor: uvm_config_db get failed: interface_inst\n")) 
  endfunction
 
  //uvm run phase
  task run_phase(uvm_phase phase);
    begin
      forever
      begin
        seq_item_con1 = spi_seq_item::type_id::create("seq_item_con1");
		
        // sampling of data should always be at posedge of clock
        @(posedge interface_inst.mclk); 		
        seq_item_con1.reset	   	    = interface_inst.reset	 	;           
        seq_item_con1.miso = interface_inst.miso  ;   
	    seq_item_con1.data_in     	= interface_inst.data_in     	;        
        seq_item_con1.tx_ready    	= interface_inst.tx_ready    	;
        seq_item_con1.rx_e    	= interface_inst.rx_e    	;


        seq_item_con1.data_out      	= interface_inst.data_out      	;           
        seq_item_con1.mosi    = interface_inst.mosi ;
	    seq_item_con1.ss  	= interface_inst.ss;
        seq_item_con1.sclk      	= interface_inst.sclk;           
        seq_item_con1.tx_done    = interface_inst.tx_done ;
	    seq_item_con1.rx_done  	= interface_inst.rx_done;

        //seq_item_con1.print();
        port_con1.write(seq_item_con1); //analysis port write function, to be used in SB & covg
      end
    end
  endtask
 
endclass


