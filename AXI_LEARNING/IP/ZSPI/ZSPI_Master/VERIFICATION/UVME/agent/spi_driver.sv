/*************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_driver.sv
Description: This module receives the stimulus from 
seq_item -> sequence -> sequencer and drives on interface signals to DUT
**************************************************/

//spi_driver is derived from uvm_driver base class
class spi_driver extends uvm_driver #(spi_seq_item);
  
  //factory registration
  `uvm_component_utils(spi_driver)  

  virtual spi_intf interface_inst;  //virtual interface handle
  spi_seq_item seq_item_inst;       //seq item handle

  //constructor
  function new (string name = "spi_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
    //connecting to virtual interface using uvm_congifg_db get() method 
    if(!uvm_config_db#(virtual spi_intf)::get(this, "", "interface_inst", interface_inst))
        `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".interface_inst"})   
  endfunction

  //variable for calculating wait cycles
  int wait_time;
 
  //run phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    //taking seq_item from sequence and driving on interface -----------------
    forever
      begin
        seq_item_port.get_next_item(seq_item_inst);	  
	    `uvm_info(get_name(),$sformatf("step 3 : inside driver - run phase "),UVM_MEDIUM)
      
	    @(negedge interface_inst.mclk);
           
        // sequence item to interface -> this will reach RTL
        interface_inst.reset <= seq_item_inst.reset;
        interface_inst.data_in  <= seq_item_inst.data_in;
        interface_inst.miso  <= seq_item_inst.miso;
        interface_inst.rx_e <= seq_item_inst.rx_e;
        interface_inst.tx_ready <=seq_item_inst.tx_ready ;
               
        wait_time <= $urandom_range(10,12);
	    repeat(wait_time)@(negedge interface_inst.mclk);
        
               
        `uvm_info(get_name(),$sformatf("step 4 : inside driver - run phase - done"),UVM_MEDIUM)      
        seq_item_port.item_done();
      end	
  endtask
endclass
