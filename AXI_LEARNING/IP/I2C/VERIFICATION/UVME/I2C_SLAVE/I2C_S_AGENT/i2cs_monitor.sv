//--------------------------------------------------------------------------
//------------------------file name - i2cs_monitor.sv-----------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------
class i2cs_monitor_tb extends uvm_monitor;
  virtual i2cs_intrf_tb intrf_inst;
  
  uvm_analysis_port #(i2cs_seq_item_tb) item_collected_port;
  //uvm_analysis_port #(i2cs_seq_item_tb) item_check_port;
  
  i2cs_seq_item_tb trans_collected;

  //component registration 
  `uvm_component_utils(i2cs_monitor_tb)
  
  //factory registration
  function new(string name="i2cs_monitor_tb", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  //build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      trans_collected=i2cs_seq_item_tb::type_id::create("trans_collected",this);
      item_collected_port=new("item_collected_port",this);
      //item_check_port=new("item_check_port",this);
    if(!uvm_config_db#(virtual i2cs_intrf_tb)::get(this,"","INTERFACE_CONFIG_DB",intrf_inst))
      `uvm_fatal(get_name(),$sformatf("Driver:uvm_config_db get failed: INTERFACE_DB\n"))
  endfunction
  
  //run phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
  `uvm_info(get_name(),$sformatf("Inside monitor  run phase"),UVM_MEDIUM)
  forever
    begin
        @(posedge intrf_inst.i2c_scl)
        begin
            trans_collected.i2c_rst= intrf_inst.i2c_rst;
            trans_collected.sdas_en= intrf_inst.sdas_en;
            trans_collected.sdas_in= intrf_inst.sdas_in;
            trans_collected.sdas_out= intrf_inst.sdas_out;
            item_collected_port.write(trans_collected);
            
        end
    end
  endtask
 
endclass
