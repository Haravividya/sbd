/*****************************************************************************
Project name:ahb_slave 
Description: This is the module that drives the seq_item which has inputs to DUT
File name:ahb_slave_driver.sv
*****************************************************************************/

//user defined class derived from base class 
class ahb_slave_driver_tb extends uvm_driver#(ahb_slave_seq_item_tb);

  //factory registration
  `uvm_component_utils(ahb_slave_driver_tb) 

  //virtual interface instance declaration this will used to connect interface and driver
  virtual ahb_slave_interface_tb i_inst;
  
  //declaration of seq item instance which has inputs to drive from driver to interface
  ahb_slave_seq_item_tb seq_item_inst;

  int wait_var;
    
  //constructor
  function new(string name="ahb_slave_driver_tb",uvm_component parent);
    super.new(name,parent);
	`uvm_info( "TRACE", $sformatf( "%m" ) , UVM_HIGH);
  endfunction

  //build phase to make connection between interface (virtual) and driver
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //connecting driver to interface (virtual) using uvm_congifg_db get() method
    if(!uvm_config_db#(virtual ahb_slave_interface_tb)::get(this, "", "INTERFACE_INST_DB", i_inst))
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
      
      @ (negedge i_inst.hclk);  
      i_inst.hreset_n  <= seq_item_inst.hreset_n  ;//driving reset also           
      i_inst.hsel      <= seq_item_inst.hsel      ;
      i_inst.haddr     <= seq_item_inst.haddr     ;
      i_inst.hready    <= seq_item_inst.hready    ;
      i_inst.hburst    <= seq_item_inst.hburst    ;          
      i_inst.hwrite    <= seq_item_inst.hwrite    ;
      i_inst.hwdata    <= seq_item_inst.hwdata    ;
      //driving inputs of sequence item to interface - this will reach RTL
 
      `uvm_info(get_name(),$sformatf("step 4 : inside driver - run phase - done"),UVM_MEDIUM);
      seq_item_port.item_done();
	
	end
	
  endtask

endclass
