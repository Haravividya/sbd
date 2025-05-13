class apb_slave1_sequence extends uvm_sequence #(apb_slave1_seq_item); 

       //Factory registration
	`uvm_object_utils(apb_slave1_sequence) //without field macros

	apb_slave1_seq_item seq_item; //instance of class
 
	 int   scenario;
	 logic presetn_seq,psel1_seq,penable_seq;
         logic [31:0] paddr_seq;
         logic [31:0]pwdata_seq;
         logic pwrite_seq;
	 int   wait_time_seq=0;

 //constructor methods : all objects are built in new method - memory allocation 
	function new(string name ="apb_slave1_sequence");
	   super.new (name);
	endfunction

	task body();
	//`uvm_info("Sequence ", $sformatf("Starting particular sequence item "), UVM_LOW)

		if (scenario ==1) begin        
		   `uvm_do_with(seq_item,
                   {seq_item.paddr         == paddr_seq;
                    seq_item.pwdata        == pwdata_seq;
                    seq_item.pwrite        == pwrite_seq;
		    seq_item.psel1         == psel1_seq;
		    seq_item.penable       == penable_seq;
		    seq_item.wait_time     == wait_time_seq;
                    seq_item.presetn       == 1;
                 } );
	        end

		else if (scenario ==2) begin        
		   `uvm_do_with(seq_item,
                    {seq_item.presetn  == 1;seq_item.pwrite==1;seq_item.penable==1;seq_item.paddr==10;} );
		end 
		
		else if (scenario ==3) begin        
		    `uvm_do_with(seq_item,
                     {seq_item.presetn  == 1;seq_item.pwrite==0;seq_item.penable==1;seq_item.paddr==10;} );
		end 
  
		else if (scenario ==0) begin 
		    `uvm_do_with(seq_item,
                     {seq_item.presetn  == 0;} );
		end 
          //`uvm_info("Sequence ", $sformatf("Ending  sequence items "), UVM_LOW)
		
	endtask

endclass : apb_slave1_sequence
