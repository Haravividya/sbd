/***************************************************************************
Project name:ahb_master 
Description: This is the module which has a sequence items inputs and output
File name:ahb_master_seq_item.sv
***************************************************************************/

//user defined class derived from base class 
class ahb_master_seq_item_tb extends uvm_sequence_item;

// global signals

    rand logic hrst_n;

//signals from slave to master
   
    rand logic  [31 : 0] addr   ;
    rand logic  [31 : 0] wdata  ;
    rand logic  [31 : 0] hrdata ;
    rand logic           iwrite ;
    rand logic           hready ;
    rand logic           hresp  ;
    rand logic  [2  : 0] iburst ;
    rand logic  [2  : 0] isize  ;
    rand logic  [1  : 0] itrans ;
    rand logic           busreq ;
    rand logic           hgrant ;
    

// signals to slave from master
    
    logic [31 : 0] rdata  ;
    logic [31 : 0] haddr  ;
    logic [31 : 0] hwdata ;
    logic [2  : 0] hburst ; 
    logic [2  : 0] hsize  ;
    logic [1  : 0] htrans ;
    logic          hwrite ;
    logic         hbusreq ;

       
 
//factory registration 
    `uvm_object_utils_begin(ahb_master_seq_item_tb)
    `uvm_field_int(hrst_n, UVM_ALL_ON)
    `uvm_field_int(addr,   UVM_ALL_ON)
    `uvm_field_int(wdata,  UVM_ALL_ON)
    `uvm_field_int(hrdata, UVM_ALL_ON)
    `uvm_field_int(iwrite, UVM_ALL_ON)
    `uvm_field_int(hready, UVM_ALL_ON)
    `uvm_field_int(hresp,  UVM_ALL_ON)
    `uvm_field_int(iburst, UVM_ALL_ON)
    `uvm_field_int(isize,  UVM_ALL_ON)
    `uvm_field_int(itrans, UVM_ALL_ON)
    `uvm_field_int(busreq, UVM_ALL_ON)
    `uvm_field_int(hgrant, UVM_ALL_ON)
    `uvm_field_int(rdata,  UVM_ALL_ON)
    `uvm_field_int(haddr,  UVM_ALL_ON)
    `uvm_field_int(hwdata, UVM_ALL_ON)
    `uvm_field_int(hburst, UVM_ALL_ON)
    `uvm_field_int(hsize,  UVM_ALL_ON)
    `uvm_field_int(htrans, UVM_ALL_ON)
    `uvm_field_int(hwrite, UVM_ALL_ON)
    `uvm_field_int(hbusreq,UVM_ALL_ON)
    `uvm_object_utils_end
   
  
//constructor
  function new(string name="ahb_master_seq_item_tb");
    super.new(name);
	 `uvm_info("TRACE",$sformatf("%m"), UVM_HIGH) ; 
  endfunction	   
  
endclass
