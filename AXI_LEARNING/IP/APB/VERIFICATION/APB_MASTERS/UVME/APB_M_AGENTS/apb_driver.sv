class apb_driver extends uvm_driver#(apb_item);

  `uvm_component_utils(apb_driver)
  virtual apb_intf vif;
  apb_item item;

 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual apb_intf) :: get(this,"","iif",vif))
      `uvm_error("Driver","No resource found")
  endfunction
 

  task run_phase(uvm_phase phase);
    wait(vif.presetn == 0);
      vif.pready  = 0;
      vif.pslverr   = 0;
      vif.prdata  = 0;
      vif.apb_write_data  = 0;
      vif.apb_write_paddr  = 0;
      vif.apb_read_paddr  = 0;
      vif.read_write = 0;
      vif.transfer = 0;
    wait(vif.presetn == 1); // out of reset

    forever begin
      @(posedge vif.pclock)
      seq_item_port.get_next_item(item);

      if(vif.presetn == 0) 
      begin
      vif.pready  = 0;
      vif.pslverr   = 0;
      vif.prdata  = 0;
      vif.apb_write_data  = 0;
      vif.apb_write_paddr  = 0;
      vif.apb_read_paddr  = 0;
      vif.read_write = 0;
      vif.transfer = 0; 
      end

      else if(vif.presetn == 1) 
        begin
        if(item.read_write==1)
	  begin
	  //#0.5
	  vif.apb_read_paddr  = item.apb_read_paddr;
          vif.read_write = item.read_write;
          vif.transfer = item.transfer;
	  vif.pready = 0;
	  #(item.wait_time);
          @(posedge vif.pclock);
	  //#0.5
	  vif.pslverr = item.pslverr;
	  vif.pready = 1;
	  vif.prdata  = item.prdata;
	  //wait(vif.penable == 1 && vif.pready == 1);
	  end
	else if(item.read_write==0)
	  begin
	  //#0.5
	  vif.apb_write_data  = item.apb_write_data;
          vif.apb_write_paddr  = item.apb_write_paddr;
          vif.read_write = item.read_write;
          vif.transfer = item.transfer;
	  vif.pready = 0;
	  //vif.pslverr =0;
	  //#10;
	  #(item.wait_time);
	  @(posedge vif.pclock);
	  //#0.5
	  //#(item.wait_time);
	  vif.pslverr = item.pslverr;
	  vif.pready = 1;	
	  /*while(vif.pready != 1) begin
 	  @(posedge vif.pclock);
 	  end  */
	  end
        end
     // @(posedge vif.pclock)
 seq_item_port.item_done();

end // forever loop end
 
endtask  

 endclass

