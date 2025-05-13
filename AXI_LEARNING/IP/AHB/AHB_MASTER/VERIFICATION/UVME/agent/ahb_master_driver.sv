/*****************************************************************************
Project name:ahb_master 
Description: This is the module that drives the seq_item which has inputs to DUT
File name:ahb_master_driver.sv
*****************************************************************************/

//user defined class derived from base class 
class ahb_master_driver_tb extends uvm_driver#(ahb_master_seq_item_tb);

//factory registration
 `uvm_component_utils(ahb_master_driver_tb) 

//virtual interface instance declaration this will used to connect interface and driver
  virtual ahb_master_interface_tb i_inst;
  
//declaration of seq item instance which has inputs to drive from driver to interface
   ahb_master_seq_item_tb seq_item_inst;

 
    
//constructor
  function new(string name="ahb_master_driver_tb",uvm_component parent);
    super.new(name,parent);
	 `uvm_info( "TRACE", $sformatf( "%m" ) , UVM_HIGH);
  endfunction

//build phase to make connection between interface (virtual) and driver
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  
  //connecting driver to interface (virtual) using uvm_congifg_db get() method
	  if(!uvm_config_db#(virtual ahb_master_interface_tb)::get(this, "", "INTERFACE_INST_DB", i_inst))
        `uvm_fatal(get_name(),$sformatf("driver: uvm_config_db get failed: INTERFACE_INST_DB\n")); 
	     //if there is no connection this report will be displayed
  endfunction

//run phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

             
//taking seq_item from sequence and driving on interface 
 	 forever
	  begin
	
//requesting seq item to sequencer
       seq_item_port.get_next_item(seq_item_inst);  
	    `uvm_info(get_name(),$sformatf("step 3 : inside driver - run phase "),UVM_MEDIUM);
      
//driving inputs of sequence item to interface - this will reach RTL
          @ (negedge i_inst.hclk);
          
          i_inst.hrst_n <= seq_item_inst.hrst_n    ;//driving reset also 
          i_inst.addr   <= seq_item_inst.addr      ;         
          i_inst.wdata  <= seq_item_inst.wdata     ;
          i_inst.hrdata <= seq_item_inst.hrdata    ;
          i_inst.iwrite <= seq_item_inst.iwrite    ;
          i_inst.hready <= seq_item_inst.hready    ;
          i_inst.hresp  <= seq_item_inst.hresp     ;
          i_inst.iburst <= seq_item_inst.iburst    ;
          i_inst.isize  <= seq_item_inst.isize     ;
          i_inst.itrans <= seq_item_inst.itrans    ;
          i_inst.busreq <= seq_item_inst.busreq    ;         
          i_inst.hgrant <= seq_item_inst.hgrant    ; 
	                 
     
        `uvm_info(get_name(),$sformatf("step 4 : inside driver - run phase - done"),UVM_MEDIUM);
       seq_item_port.item_done();
	
	  end
	
  endtask

endclass
