/***********************************************************

File name   : apb_protocol_sequence.svh
Description : apb_protocol Sequence  : generates a series of sequence items and sends it to driver via sequencer.
	      Sequence - extending from uvm_sequence -- derived from an uvm_sequence_item

	      A sequence - parameterized with the type of Sequence_item.

***********************************************************/

class apb_protocol_sequence extends uvm_sequence #(apb_protocol_seq_item); 

//Factory registration
  `uvm_object_utils(apb_protocol_sequence) //without field macros

  apb_protocol_seq_item seq_item; //instance of class
 
  int scenario=1;
  logic presetn;
  logic transfer_seq;
  logic read_write_seq;
  logic [31:0] apb_write_paddr_seq;
  logic [31:0] apb_write_data_seq;
  logic [31:0] apb_read_paddr_seq;
  
  int unsigned  wait_time_seq;


 
//constructor methods : all objects are built in new method - memory allocation 
  function new(string name ="apb_protocol_sequence");
    super.new (name);
    `uvm_info("Sequence ", $sformatf("Initial Entry to sequence"), UVM_LOW)
  endfunction

//Task - Body 
  task body();
  //Scenario 1 : Constrained random - step size - controlled : 0,1,2,3  
  //  `uvm_info("Sequence ", $sformatf("Starting Sequence"), UVM_LOW)

    if (scenario == 0) begin  
      //$display ("Entered : Scenario 0 : presetn");
      `uvm_do_with(seq_item,
                  {seq_item.presetn  == 0;} );  //reset  : presetn ==0  

    end 

    else if (scenario == 1) begin   
      // $display ("Entered : Scenario 1");
      `uvm_do_with(seq_item,
                  {seq_item.presetn  == 1;} );    
    
    end 
  
    else if (scenario == 2) begin 
     // $display ("Entered : Scenario 2");
      `uvm_do_with(seq_item,
                  {seq_item.transfer  == transfer_seq;
                   seq_item.read_write == read_write_seq;
				   seq_item.apb_write_paddr  == apb_write_paddr_seq;
				   
				   seq_item.apb_write_data  == apb_write_data_seq;
				   seq_item.apb_read_paddr  == apb_read_paddr_seq;
				   
                   seq_item.wait_time  == wait_time_seq;  
                   seq_item.presetn      == 1;
                  } );
    end 
   // `uvm_info("Sequence ", $sformatf("Ending  Sequence "), UVM_LOW)

  endtask
endclass : apb_protocol_sequence



 

  

