class apb_slave2_sequence extends uvm_sequence #(apb_slave2_seq_item); 

//Factory registration
	`uvm_object_utils(apb_slave2_sequence) //without field macros

	apb_slave2_seq_item seq_item; //instance of class
   
 
	 int count;
	
 
 //constructor methods : all objects are built in new method - memory allocation 
	function new(string name ="apb_slave2_sequence");
		super.new (name);
	endfunction

	task body();
	  begin        
		`uvm_do_with(seq_item)
      end 

	endtask


endclass : apb_slave2_sequence
