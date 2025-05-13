/***********************************************************

File name   : apb_protocol_scb.svh
Description : 
. 

***********************************************************/

class apb_protocol_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(apb_protocol_scoreboard)
	 
  apb_protocol_seq_item seq_item;
  
  
  logic [31:0] apb_read_data_out=0;

  uvm_analysis_imp #(apb_protocol_seq_item,apb_protocol_scoreboard) analysis_imp_scoreboard;
  

  function new(string name, uvm_component parent);                      
    super.new(name,parent);
    `uvm_info("Scoreboard ", $sformatf("  Initial Entry to SCB"), UVM_LOW)
  endfunction
  
  
  function void build_phase(uvm_phase phase);                             //build phase
    analysis_imp_scoreboard = new("analysis_imp_scoreboard",this);	
  endfunction
  
  task run_phase(uvm_phase phase);  //Run phase
  begin  
    $display("Empty Scoreboard");
  end
  endtask


  virtual function void write (input apb_protocol_seq_item seq_item);               		 // write phase  
   // `uvm_info("Scoreboard ", $sformatf("  Seq_item "), UVM_LOW)
   
      

      //computation thread. -1 
  
    
    
  endfunction : write
  

endclass :apb_protocol_scoreboard




