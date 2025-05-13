class jtag_driver extends uvm_driver#(jtag_seq_item);

  `uvm_component_utils(jtag_driver)
  virtual dut_if vif;
  jtag_seq_item seq_item;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif)) begin
      `uvm_error("build_phase","driver virtual interface failed")
    end
  endfunction

  task run_phase(uvm_phase phase); 
    forever 
    begin     
      seq_item_port.get_next_item(seq_item); //next item from sequencer
        
      if(seq_item.TRST ==0)
      begin //2
       `uvm_info("Driver ", $sformatf("Reset"), UVM_LOW)
	    vif.TRST= 0;
        vif.TMS = 0;
     	vif.TDI = 0;
      	vif.user_data_in  = 0;
        repeat(5) @(posedge vif.TCK);
        vif.TRST = 1;
      end //2
      
      else if(seq_item.TRST == 1)
      begin //3
        @(negedge vif.TCK);
        vif.TMS          = seq_item.TMS;	 //input
	    vif.TDI          = seq_item.TDI;    //input
        vif.user_data_in = seq_item.user_data_in;   
	   `uvm_info("Driver ", $sformatf("Driving inputs %t , TMS : %d , TDI : %d" , $realtime, seq_item.TMS , seq_item.TDI), UVM_LOW)

      end //3
	
      seq_item_port.item_done(); //item done - for each item
    
    end //1 
	
    `uvm_info("Driver ", $sformatf("Driver Exit"), UVM_LOW)  

  endtask
endclass
