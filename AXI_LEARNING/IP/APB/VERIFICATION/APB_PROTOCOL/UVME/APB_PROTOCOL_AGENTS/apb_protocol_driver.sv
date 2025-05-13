/***********************************************************

File name   : apb_protocol_driver.svh
Description :  Driver - extends from uvm_driver , inherited from uvm_components.
 
Methods TLM port (seq_item_port) - defined for communication between sequencer and driver. 

Uvm_Driver is parameterized class , with - type of request se_item and tpe of response seq_item.


***********************************************************/


class apb_protocol_driver extends uvm_driver #(apb_protocol_seq_item);
  
  //virtual interface handle : required to connect interface of DUT - get from config db
  virtual apb_protocol_interface intf; //apb_protocol_intf - set label

  apb_protocol_seq_item seq_item;
  
  `uvm_component_utils(apb_protocol_driver) 

  function new (string name ="apb_protocol_driver",uvm_component parent);
    super.new(name, parent);
    `uvm_info("Driver ", $sformatf("Initial : Driver entry"), UVM_LOW)
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 	
    if(!uvm_config_db#(virtual apb_protocol_interface)::get(this," ","apb_protocol_intf",intf)) //intf : virtual i/f handle
       `uvm_fatal("NO_intf", {"virtual interface must be set for : ", get_full_name(),".intf"});
  endfunction : build_phase

  
 //Driver logic
  task run_phase(uvm_phase phase);
    forever 
    begin //1
      seq_item_port.get_next_item(seq_item); //next item from sequencer 
  
      if(seq_item.presetn ==0) //presetn
      begin //2
        `uvm_info("Driver ", $sformatf("presetn"), UVM_LOW)
      	intf.presetn = 0;
        intf.transfer= 0;
        intf.read_write=0;
        intf.apb_write_paddr= 0;
        intf.apb_write_data= 0; 
	    
        intf.apb_read_paddr= 0; 


				
      repeat(5) @(posedge intf.pclock);
        intf.presetn = 1;
      end //2

           
      else if (seq_item.presetn ==1)
      begin //3
        @(posedge intf.pclock); 
	    //$display("Debug driver : when presetn = 0");
        //$display("Driver : %t, Step_size : %d, Reference - signal : %d ",$realtime,seq_item.step_size,seq_item.ref_signal);
		intf.transfer=seq_item.transfer; 
		intf.read_write=seq_item.read_write; 
		intf.apb_write_paddr=seq_item.apb_write_paddr; 
		intf.apb_write_data=seq_item.apb_write_data; 
		intf.apb_read_paddr=seq_item.apb_read_paddr; 

	    //#seq_item.wait_time;

	//`uvm_info("Driver ", $sformatf("Driving inputs , when presetn is 0 "), UVM_LOW)
      end //3
	
      seq_item_port.item_done(); //item done - for each item
    end //1 
	
    `uvm_info("Driver ", $sformatf("Driver Exit"), UVM_LOW)  
  endtask:run_phase

endclass : apb_protocol_driver


 


