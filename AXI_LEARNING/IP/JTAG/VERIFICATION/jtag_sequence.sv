class jtag_sequence extends uvm_sequence#(jtag_seq_item);
  `uvm_object_utils(jtag_sequence)

  function new (string name = "jtag_sequence");
    super.new(name);
  endfunction
  
  jtag_seq_item seq_item;

  int scenario=1;
  logic TMS_seq=0;
  logic TDI_seq=0;
  logic [7:0] user_data_in_seq  = 8'd0;

  task body();
  
    `uvm_info("Sequence ", $sformatf("Starting sequence"), UVM_LOW)
    //scenario 0: reset the DUT through TRST pin
    if (scenario ==0) 
    begin 
      `uvm_do_with(seq_item,
                  {seq_item.TRST  == 0;} ) //TMS - can be any value :0,1,x,z	  
    end 
    //scenario 1 : constrained TMS, TDI, and user_data_in
    else if (scenario ==1) 
    begin        
      `uvm_do_with(seq_item,
                  {seq_item.TMS          == TMS_seq; 
                   seq_item.TDI          == TDI_seq; 
                   seq_item.user_data_in == user_data_in_seq;
                   seq_item.TRST         == 1;
                  } );
    end 
	
  
    `uvm_info("Sequence ", $sformatf("Ending  sequence items "), UVM_LOW)


  endtask
endclass
