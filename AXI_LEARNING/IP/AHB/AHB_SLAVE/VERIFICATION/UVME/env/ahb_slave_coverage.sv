/**************************************************************************
Project name:ahb_slave 
Description:this module has a covergroup so it will ckeck all the possible values are hit wrt specifications
File name:ahb_slave_coverage.sv
**************************************************************************/
//user defined class derived from base class 
class ahb_slave_coverage extends uvm_subscriber#(ahb_slave_seq_item_tb); 
  //uvm_subscriber is a standart uvm component to implemetn coverage : this will be anlysisi import 

  //factory registration    
  `uvm_component_utils(ahb_slave_coverage)
   
  //declaring seq item handle  
  ahb_slave_seq_item_tb pkt;
 
  //Covergroup 
  covergroup covgroup_ahb_slave;
       
	RESET: coverpoint pkt.hreset_n // 1 bit
	{
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }
    
	HADDR: coverpoint pkt.haddr // 32 bits
    { 
	 option.auto_bin_max=4;  
    }
   
    
    HWDATA: coverpoint pkt.hwdata // 32 bit
    {  
     option.auto_bin_max=4; 
    }
    

    HBURST: coverpoint pkt.hburst // 3 bit
    {
     option.auto_bin_max=4;             
    } 

    HSEL: coverpoint pkt.hsel // 1 bit
	{
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }   
   
    HREADY: coverpoint pkt.hready // 1 bit
	{       
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }
   
       
    HWRITE: coverpoint pkt.hwrite // 1 bit
	{
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }
   
    HRESP: coverpoint pkt.hresp // 1 bit
	{       
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }

 	
    HRDATA: coverpoint pkt.hrdata  // 32 bits
    {  
     option.auto_bin_max=4; 
    }

                 
    HREADYOUT: coverpoint pkt.hreadyout  // 1 bits
	{      
     bins bin0 ={0};                                  
     bins bin1 ={1};
    }
     


    CROSS : cross HWRITE,HWDATA,HREADY,HBURST;
                             
  
  endgroup

  //constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
    //creating the obj for covergroup from new() method
    covgroup_ahb_slave = new();
  endfunction

 
  //write method calling from monitor ,same is called in scoreboard
  function void write(input ahb_slave_seq_item_tb t);
    begin
      pkt = new();
      //$cast(destination,source);
      $cast(pkt,t);//assigning the handle of seq item from monitor to handle of seq item in coverage
      //covergroup will update bins only when covergroup is sampled
      covgroup_ahb_slave.sample(); 
        
    end
  endfunction

endclass


