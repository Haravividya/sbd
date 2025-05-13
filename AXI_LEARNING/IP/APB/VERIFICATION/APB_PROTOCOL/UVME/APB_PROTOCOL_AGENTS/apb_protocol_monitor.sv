/***********************************************************

File name   : apb_protocol_monitor.svh
Description :  Monitor -responsible for capturing signal activity from the design interface , and translate it into transaction level data objects 
that can be sent to other components. 

TLM analysis port declarations : to broadcast captured data to others.


***********************************************************/


class apb_protocol_monitor extends uvm_monitor;
  
  //virtual interface handle : required to connect interface of DUT , get from config db
  virtual apb_protocol_interface intf; //apb_protocol_intf - set label

  uvm_analysis_port #(apb_protocol_seq_item) monitor_analysis_port;  //uvm_analysis_port
  
  apb_protocol_seq_item seq_item; //seq_item handle : placeholder to capture transaction info (sampled data from DUT)
  
  `uvm_component_utils(apb_protocol_monitor) 

  //constructor
  function new (string name ="apb_protocol_monitor",uvm_component parent);
    super.new(name, parent);
    `uvm_info("Monitor", $sformatf("Initial : Entry to Monitor"), UVM_LOW)
  endfunction : new

  //build phase - analysis_port , virtual_interface 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
    monitor_analysis_port = new("monitor_analysis_port",this);
 	
    if(!uvm_config_db#(virtual apb_protocol_interface)::get(this," ","apb_protocol_intf",intf))
       `uvm_fatal("NO_VIF", {"virtual interface must be set for : ", get_full_name(),".vif"});
  endfunction : build_phase
  
  //Sampling Task 
  
  task run_phase(uvm_phase phase); 
   
    forever 
    begin
    seq_item = apb_protocol_seq_item :: type_id :: create("seq_item");
    @(posedge intf.pclock);
	seq_item.presetn      = intf.presetn;
		
	seq_item.transfer=intf.transfer; 
	seq_item.read_write=intf.read_write; 
	seq_item.apb_write_paddr=intf.apb_write_paddr; 
	seq_item.apb_write_data=intf.apb_write_data; 
	seq_item.apb_read_paddr=intf.apb_read_paddr; 
	seq_item.apb_read_data_out=intf.apb_read_data_out;
		
		
        //`uvm_info("Monitor", $sformatf("Monitor_Check"), UVM_LOW)
		
        //seq_item.print();
      
        monitor_analysis_port.write(seq_item);

    end //forever

  endtask : run_phase
  
endclass : apb_protocol_monitor


 


