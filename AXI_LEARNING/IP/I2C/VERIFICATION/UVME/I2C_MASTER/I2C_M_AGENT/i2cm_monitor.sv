
class i2cm_monitor extends uvm_monitor;
  virtual i2cm_intrf intrf_inst;
  
  uvm_analysis_port #(i2cm_seq_item) item_collected_port;
  
  i2cm_seq_item trans_collected;
  
  `uvm_component_utils(i2cm_monitor)
  
  function new(string name="i2cm_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	trans_collected=i2cm_seq_item::type_id::create("trans_collected",this);
	item_collected_port=new("item_collected_port",this);

	if(!uvm_config_db#(virtual i2cm_intrf)::get(this,"","I2CM_INTERFACE_DB",intrf_inst))
	  `uvm_fatal(get_name(),$sformatf("Driver:uvm_config_db get failed: INTERFACE_DB\n"))
	
	`uvm_info(get_name(),$sformatf("Inside monitor "),UVM_MEDIUM)
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_name(),$sformatf("Inside monitor  run pfase"),UVM_MEDIUM)
    forever
    begin
	    @(negedge intrf_inst.i2c_clock_in);
       trans_collected.i2c_reset_in = intrf_inst.i2c_reset_in ;
       trans_collected.i2c_start = intrf_inst.i2c_start ;
       trans_collected.rw = intrf_inst.rw ;
       trans_collected.i2c_master_addr_wr  = intrf_inst.i2c_master_addr_wr ;
       trans_collected.i2c_master_data_wr  = intrf_inst.i2c_master_data_wr ;
       trans_collected.fifo_full  = intrf_inst.fifo_full ;
       trans_collected.ready_out  = intrf_inst.ready_out ;
       trans_collected.i2c_master_data_rd  = intrf_inst.i2c_master_data_rd ;
       //trans_collected.sdam_out  = intrf_inst.sdam_out ;
       //trans_collected.sclm_out  = intrf_inst.sclm_out;
       //trans_collected.sclm_in = intrf_inst.sclm_in;
      // trans_collected.sclm_en =intrf_inst.sclm_en;
      // trans_collected.sdam_in= intrf_inst.sdam_in;
       //trans_collected.sdam_en=intrf_inst.sdam_en;

       item_collected_port.write(trans_collected);
    end
  endtask
 
endclass
	
