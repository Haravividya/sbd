class apb_slave1_seq_item extends uvm_sequence_item;

	//control info and payload info
	      logic pclock;
     	rand  logic presetn;

        rand  logic psel1;
        rand  logic penable;

        rand  logic [31:0] paddr;
        rand  logic [31:0] pwdata;
        rand  logic pwrite;

              logic pslverr1;
	      logic pready1;
              logic [31:0] prdata1;

                int wait_time=0;

	// factory registration - registers the user defined class with factory
	// all classes derived directly from uvm_object or uvm_transaction - require them to be registered using `uvm_object_utils macro.

	//utility macros & field macros
	`uvm_object_utils_begin(apb_slave1_seq_item) 
		 
		`uvm_field_int(presetn, UVM_ALL_ON)
		`uvm_field_int(psel1, UVM_ALL_ON)
		`uvm_field_int(penable, UVM_ALL_ON)
		`uvm_field_int(paddr, UVM_ALL_ON)
		`uvm_field_int(pwdata, UVM_ALL_ON)
		`uvm_field_int(pwrite, UVM_ALL_ON)
		`uvm_field_int(pslverr1, UVM_ALL_ON)
		`uvm_field_int(pready1, UVM_ALL_ON)
		`uvm_field_int(prdata1, UVM_ALL_ON)
		`uvm_field_int(wait_time, UVM_ALL_ON)
		
	`uvm_object_utils_end

	//constructor 
	function new (string name ="apb_slave1_seq_item");
           super.new(name);
	   //`uvm_info("apb_slave1_seq_item ", $sformatf("sequence item - bundling"), UVM_LOW)
	endfunction

	
	 

       //     	constraint c{soft presetn == 1;};
       //       constraint wait_time_c {wait_time=0;} 
       //       constraint padder_c {paddr>10; paddr<15;}
       //       constraint pwdata_c {pwdata>0; pwdata<955;}


endclass : apb_slave1_seq_item

