class wdt_driver extends uvm_driver#(wdt_seq_item);

  `uvm_component_utils(wdt_driver)

  virtual wdt_intf wdt_vif;
  wdt_seq_item wdt_item;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    if(!uvm_config_db#(virtual wdt_intf)::get(this,"","vif",wdt_vif))
      `uvm_error("Driver","No resource found")

  endfunction

  task run_phase(uvm_phase phase);

      wait(wdt_vif.rst == 0);
      wdt_vif.wdt_reg_addr  = 0;
      wdt_vif.wdt_reg_data  = 0;
      wdt_vif.stop_mode_i   = 0;
      wdt_vif.wait_mode_i   = 0;
      wdt_vif.debug_mode_i  = 0;
      wait(wdt_vif.rst == 1);


    forever  begin

    
      @(posedge wdt_vif.clk) 
      seq_item_port.get_next_item(wdt_item);
      if(wdt_vif.rst == 1)
      begin
        wdt_vif.wdt_reg_addr = wdt_item.wdt_reg_addr;
        wdt_vif.wdt_reg_data = wdt_item.wdt_reg_data;
        wdt_vif.stop_mode_i  = wdt_item.stop_mode_i;
        wdt_vif.wait_mode_i  = wdt_item.wait_mode_i;
        wdt_vif.debug_mode_i = wdt_item.debug_mode_i;
     end

     else
     begin
       wdt_vif.wdt_reg_addr = 0;
       wdt_vif.wdt_reg_data = 0;
       wdt_vif.stop_mode_i  = 0;
       wdt_vif.wait_mode_i  = 0;
       wdt_vif.debug_mode_i = 0;
     end

      seq_item_port.item_done();
  
    end
  endtask

endclass
