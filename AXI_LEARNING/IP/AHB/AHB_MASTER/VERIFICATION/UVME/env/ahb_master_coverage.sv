/**************************************************************************
Project name:ahb_master 
Description:this module has a covergroup so it will ckeck all the possible values are hit wrt specifications
File name:ahb_master_coverage.sv
**************************************************************************/
//user defined class derived from base class 
class ahb_master_coverage_tb extends uvm_subscriber#(ahb_master_seq_item_tb); // uvm_subscriber is a standart uvm component to implemetn coverage : this will be anlysisi import 

//factory registration    
  `uvm_component_utils(ahb_master_coverage_tb)
   
//declaring seq item handle  
  ahb_master_seq_item_tb pkt;

  
// Covergroup 
  covergroup covgroup_ahb_master;
       
	RESET: coverpoint pkt.hrst_n // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
    
	ADDR: coverpoint pkt.addr // 32 bits
    { 
	 option.auto_bin_max=4;  
    }
   
    
    WDATA: coverpoint pkt.wdata // 32 bit
    {
  
     option.auto_bin_max=4; 

    }

    HRDATA: coverpoint pkt.hrdata // 32 bit
    {
  
     option.auto_bin_max=4; 

    }

//not considered for any functionalities but retained for future implimentation
    ISIZE: coverpoint pkt.isize // 3 bit     
    {
  
     bins bin0 ={0,1,2,3,4,5,6,7}; 

    }

      
    ITRANS: coverpoint pkt.itrans // 2 bit
    {
          bins bin0 ={0,1,2,3};      
    } 

    IBURST: coverpoint pkt.iburst // 2 bit
    {
          option.auto_bin_max=8;             
    } 

    BUSREQ: coverpoint pkt.busreq // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }   
   
    HREADY: coverpoint pkt.hready // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
   
    HGRANT: coverpoint pkt.hgrant // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
   
    IWRITE: coverpoint pkt.iwrite // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
   
    HRESP: coverpoint pkt.hresp // 1 bit
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }

 
	HADDR: coverpoint pkt.haddr // 32 bits
    { 
	 option.auto_bin_max=4;  
    }
   
    
    HWDATA: coverpoint pkt.hwdata // 32 bits
    {  
     option.auto_bin_max=4; 
    }

    RDATA: coverpoint pkt.rdata  // 32 bits
    {  
     option.auto_bin_max=4; 
    }

    HSIZE: coverpoint pkt.hsize // 3 bits
    {  
     bins bin0 ={0,1,2,3,4,5,6,7}; 
    }
      
    HTRANS: coverpoint pkt.htrans   // 2 bits
    {
     bins bin0 ={0,1,2,3};      
    } 

    HBURST: coverpoint pkt.hburst   // 3 bits
    {
     option.auto_bin_max=8;             
    } 

    HBUSREQ: coverpoint pkt.hbusreq  // 1 bits 
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
         
    HWRITE: coverpoint pkt.hwrite  // 1 bits
	{       bins bin0 ={0};                                  
            bins bin1 ={1};
    }
     


    CROSS : cross HADDR,WDATA,RDATA,HRESP,HREADY,IBURST;
              //HRESP,HWDATA,HRDATA,HSIZE,HTRANS,HBURST,HBUSREQ,HWRITE;
                 
  
  endgroup

//constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
// creating the obj for covergroup from new() method
        covgroup_ahb_master = new();
  endfunction

 
//write method calling from monitor ,same is called in scoreboard
  function void write(input ahb_master_seq_item_tb t);
   begin
      pkt = new();
//$cast(destination,source);
      $cast(pkt,t);//assigning the handle of seq item from monitor to handle of seq item in coverage
//covergroup will update bins only when covergroup is sampled
      covgroup_ahb_master.sample(); 
        
    end
  endfunction

endclass


