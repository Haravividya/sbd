class wdt_monitor extends uvm_monitor;

  `uvm_component_utils(wdt_monitor)

  wdt_seq_item wdt_item;

  virtual wdt_intf wdt_vif;

  uvm_analysis_port#(wdt_seq_item) analysis_port_monitor;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_monitor = new("analysis_port_monitor",this);
    if(!uvm_config_db#(virtual wdt_intf)::get(this,"","vif",wdt_vif))
      `uvm_error("Monitor","No resource found")

  endfunction

  task run_phase(uvm_phase phase);

    forever begin

      @(posedge wdt_vif.clk )
      wdt_item = wdt_seq_item :: type_id :: create("wdt_item");
      wdt_item.wdt_reg_data    = wdt_vif.wdt_reg_data;
      wdt_item.wdt_reg_addr    = wdt_vif.wdt_reg_addr;
      wdt_item.stop_mode_i     = wdt_vif.stop_mode_i;
      wdt_item.wait_mode_i     = wdt_vif.wait_mode_i;
      wdt_item.debug_mode_i    = wdt_vif.debug_mode_i;
      wdt_item.wdt_reset_o     = wdt_vif.wdt_reset_o;
      wdt_item.wdt_interrupt_o = wdt_vif.wdt_interrupt_o;
      wdt_item.wdt_counter     = wdt_vif.wdt_counter;
   //   wdt_item.print();
      analysis_port_monitor.write(wdt_item);
    end

  endtask

endclass
