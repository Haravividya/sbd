
class i2cm_monitor_new extends uvm_monitor;
  virtual i2cm_intrf intrf_inst;
  
  uvm_analysis_port #(i2cm_seq_item) item_chk_port;
  
  i2cm_seq_item trans_chk;
  
  `uvm_component_utils(i2cm_monitor_new)
  
  function new(string name="i2cm_monitor_new", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	trans_chk=i2cm_seq_item::type_id::create("trans_chk",this);
	item_chk_port=new("item_chk_port",this);

	if(!uvm_config_db#(virtual i2cm_intrf)::get(this,"","I2CM_INTERFACE_DB",intrf_inst))
	  `uvm_fatal(get_name(),$sformatf("Driver:uvm_config_db get failed: INTERFACE_DB\n"))
	
	`uvm_info(get_name(),$sformatf("Inside monitor new "),UVM_MEDIUM)
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_name(),$sformatf("Inside monitor new run pfase"),UVM_MEDIUM)
    forever
    begin
	    @(posedge intrf_inst.i2c_scl_inout);
   trans_chk.sdam_out  = intrf_inst.sdam_out ;
       //trans_chk.sclm_out  = intrf_inst.sclm_out;
       //trans_chk.sclm_in = intrf_inst.sclm_in;
       // trans_chk.sclm_en =intrf_inst.sclm_en;
       trans_chk.sdam_in= intrf_inst.sdam_in;
       trans_chk.sdam_en=intrf_inst.sdam_en;
       trans_chk.i2c_scl_inout=intrf_inst.i2c_scl_inout;
       item_chk_port.write(trans_chk);
end
  endtask
 
endclass

