class jtag_monitor extends uvm_monitor;

  virtual dut_if vif;

  //Analysis port -parameterized to seq_item_tb transaction
  ///Monitor writes transaction objects to this port once detected on interface
  uvm_analysis_port#(jtag_seq_item) monitor_analysis_port;

  `uvm_component_utils(jtag_monitor)
  jtag_seq_item jtag_item;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build Phase - Get handle to virtual if from agent/config_db
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor_analysis_port = new("monitor_analysis_port", this);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) 
    begin
      `uvm_fatal("build_phase", "No virtual interface specified for this monitor instance")
    end
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever 
    begin  
      //create a seq_item object
      jtag_item = jtag_seq_item::type_id::create("jtag_item", this);
      @(posedge vif.TCK);
      begin
        $display("Inside monitor posedge if statement");
        jtag_item.TRST          = vif.TRST;
        jtag_item.TMS           = vif.TMS;
        jtag_item.TDI           = vif.TDI;
        jtag_item.user_data_in  = vif.user_data_in;
        jtag_item.user_data_out = vif.user_data_out;
       // jtag_item.print();
        jtag_item.TDO           = vif.TDO;
        $display("Inside monitor negedge if statement");

        `uvm_info("Monitor", $sformatf("Monitor_Check"), UVM_LOW)
        //jtag_item.print();
      
      end
      jtag_item.print();
      monitor_analysis_port.write(jtag_item);
    end
  endtask
endclass
