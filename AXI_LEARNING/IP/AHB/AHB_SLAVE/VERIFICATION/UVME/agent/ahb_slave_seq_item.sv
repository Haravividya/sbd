/***************************************************************************
Project name:ahb_slave 
Description: This is the module which has a sequence items inputs and output
File name:ahb_slave_seq_item.sv
***************************************************************************/

//user defined class derived from base class 
class ahb_slave_seq_item_tb extends uvm_sequence_item;

  // global signals
  rand logic hreset_n;

  //signals from master to slave   
  rand logic  [31 : 0]  haddr ;
  rand logic  [31 : 0] hwdata ;
  rand logic           hwrite ;
  rand logic           hready ;
  rand logic             hsel ;
  rand logic  [2  : 0] hburst ;
 
  // signals to slave to master
  logic [31 : 0] hrdata    ;
  logic          hresp     ;
  logic          hreadyout ;

  //constraint abc {solve hwrite before hwdata;}
  //constraint xyz {hwrite==0 -> hwdata==0; }
  
  //factory registration 
  `uvm_object_utils_begin(ahb_slave_seq_item_tb)
  `uvm_field_int(hreset_n, UVM_ALL_ON)
  `uvm_field_int(haddr,    UVM_ALL_ON)
  `uvm_field_int(hwdata,   UVM_ALL_ON)
  `uvm_field_int(hwrite,   UVM_ALL_ON)
  `uvm_field_int(hready,   UVM_ALL_ON)
  `uvm_field_int(hsel,     UVM_ALL_ON)
  `uvm_field_int(hburst,   UVM_ALL_ON)
  `uvm_field_int(hrdata,   UVM_ALL_ON)
  `uvm_field_int(hresp,    UVM_ALL_ON)
  `uvm_field_int(hreadyout,UVM_ALL_ON)
  `uvm_object_utils_end
    
  //constructor
  function new(string name="ahb_slave_seq_item_tb");
    super.new(name);
	`uvm_info("TRACE",$sformatf("%m"), UVM_HIGH) ; 
  endfunction	   
  
endclass
