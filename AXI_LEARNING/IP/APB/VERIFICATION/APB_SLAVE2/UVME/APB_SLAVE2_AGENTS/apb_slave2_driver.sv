

class apb_slave2_driver extends uvm_driver #(apb_slave2_seq_item);
  
  //virtual interface handle : required to connect interface of DUT - get from config db
  virtual apb_slave2_interface intf; //apb_slave2_intf - set label

  static apb_slave2_seq_item seq_item;
  
  
  `uvm_component_utils(apb_slave2_driver) 

  function new (string name ="apb_slave2_driver",uvm_component parent);
     super.new(name, parent);
     `uvm_info("Driver ", $sformatf("Driver entry"), UVM_LOW)
  endfunction

  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     if(!uvm_config_db#(virtual apb_slave2_interface)::get(this," ","intf",intf))
     `uvm_fatal("NO_intf", {"virtual interface must be set for : ", get_full_name(),".intf"});
  endfunction : build_phase

//Driver logic
  task run_phase(uvm_phase phase);
    
   forever 
    begin //1
      seq_item_port.get_next_item(seq_item); //next item from sequencer 

        
      if(seq_item.presetn ==0)
        begin //2
      
        `uvm_info("Driver ", $sformatf("presetn"), UVM_LOW)
	     intf.presetn  = 0;
	     intf.paddr    = 0;
         intf.pwdata   = 0;
         intf.pwrite   = 0;
         intf.psel2    = 0;
	     intf.penable  = 0;
				
                 
          repeat(5) @(posedge intf.pclock);
             intf.presetn = 1;
        end //2
      
     else if(seq_item.presetn ==1)
      begin //3

        @(posedge intf.pclock);
         
            begin
                // $display("Driver : %t, Step_size : %d, Reference - signal : %d ",$realtime,seq_item.step_size,seq_item.ref_signal);
               if (seq_item.pwrite==1)
		    begin
		       intf.paddr     = seq_item.paddr;
               intf.pwdata    = seq_item.pwdata;
               intf.pwrite    = seq_item.pwrite ;
		       intf.psel2     = seq_item.psel2;
	           intf.penable   = seq_item.penable;
		     end
	       	 else
		    begin
		      intf.paddr    = seq_item.paddr;
              intf.pwrite   = seq_item.pwrite;
		      intf.psel2    = seq_item.psel2;
	          intf.penable  = seq_item.penable;
		    end
	             //  #seq_item.wait_time;
	             //  `uvm_info("Driver ", $sformatf("Driving inputs , when presetn is low"), UVM_LOW)
           end
     end //3

	      // `uvm_info("Driver ", $sformatf("presetn if any"), UVM_LOW)
	       @(posedge intf.pclock);
           begin
           
             seq_item_port.item_done(); //item done - for each item
           end
  end //1 
	
     `uvm_info("Driver ", $sformatf("Driver Exit"), UVM_LOW)  

  endtask:run_phase

endclass : apb_slave2_driver
