class apb_monitorout extends uvm_monitor;
 
  `uvm_component_utils(apb_monitorout)
  virtual apb_intfout vifout;
  apb_item item;
  uvm_analysis_port#(apb_item)analysis_port_monitorout;//
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_port_monitorout = new("analysis_port_monitorout",this);
    
    if(!uvm_config_db#(virtual apb_intfout)::get(this,"","iifout",vifout))
    `uvm_error("monitorout","No resource found")
  endfunction
  
  task run_phase(uvm_phase phase);
    //wait (vif.presetn == 0);
    //wait (vif.presetn == 1);
    forever
    begin
      @(posedge vifout.pclock)//posedge
      //#0.1;
      item = apb_item :: type_id :: create("item");
      begin
        //if(vif.readp == 1 || vif.writep == 1)  // all signals 
        begin
          //item.pready  = vif.pready;
          //item.pslverr   = vif.pslverr;
          //item.prdata  = vif.prdata;
          //item.apb_write_data  = vif.apb_write_data;
          //item.apb_write_paddr  = vif.apb_write_paddr;
          //item.apb_read_paddr  = vif.apb_read_paddr;
          //item.read_write = vif.read_write;
          //item.transfer = vif.transfer;
          item.psel1 = vifout.psel1;
          item.psel2 = vifout.psel2;
          item.penable = vifout.penable;
          item.pwrite = vifout.pwrite;
          item.paddr = vifout.paddr;
          item.pwdata = vifout.pwdata;
          item.apb_read_data_out = vifout.apb_read_data_out;
          //`uvm_info("monitor",$sformatf("Monitor check"),UVM_LOW)
          //item.print();
          analysis_port_monitorout.write(item);
        end
      end
    end
    
  endtask
  
endclass
	
 
