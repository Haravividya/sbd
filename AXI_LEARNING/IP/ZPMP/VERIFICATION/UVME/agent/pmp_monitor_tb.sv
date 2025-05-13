/*************************************************
File name:pmp_monitor_tb.sv
Description:

**************************************************/

class pmp_monitor_tb extends uvm_monitor;
  `uvm_component_utils(pmp_monitor_tb)
 
  virtual pmp_interface_tb interface_inst; // for sampling DUT data
  
  pmp_seq_item_tb seq_item_con1; // transaction to scoreboard and coverage
  //pmp_seq_item_tb seq_item_con2;
  
  uvm_analysis_port #(pmp_seq_item_tb) port_con1; // TLM ports
  //uvm_analysis_port #(pmp_seq_item_tb) port_con2;
 
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port_con1     = new("port_con1", this); 
    //port_con2     = new("port_con2", this);  

    // Interface : to sample all the signal values of the DUT	
    if(!uvm_config_db#(virtual pmp_interface_tb)::get(this,"","INTERFACE_INST_DB",interface_inst))
    `uvm_fatal(get_name(),$sformatf("monitor: uvm_config_db get failed: INTERFACE_INST_DB\n")) 
  endfunction
 
  virtual task run_phase(uvm_phase phase);
    fork

    // ----process 1-------------------------
    begin
      forever
      begin
        seq_item_con1 = pmp_seq_item_tb::type_id::create("seq_item_con1");
		
        @(posedge interface_inst.clk); // sampling of data should always be at posedge of clock
		
        seq_item_con1.csr_rst		   = interface_inst.csr_rst		 ;           
        seq_item_con1.csr_write_addr      = interface_inst.csr_write_addr  ;           
        seq_item_con1.csr_write_en    = interface_inst.csr_write_en    ;
		seq_item_con1.csr_write_data     = interface_inst.csr_write_data   ;
        seq_item_con1.kernel_mode_signal = interface_inst.kernel_mode_signal ;
        seq_item_con1.machine_mode_valid = interface_inst.machine_mode_valid ;
        seq_item_con1.csr_read_en    = interface_inst.csr_read_en   ;
        seq_item_con1.csr_read_addr = interface_inst.csr_read_addr ;
        seq_item_con1.csr_read_out  = interface_inst.csr_read_out ;
        seq_item_con1.pmpcfg0_exception = interface_inst.pmpcfg0_exception;
        seq_item_con1.pmpcfg1_exception = interface_inst.pmpcfg1_exception;
        seq_item_con1.pmpcfg2_exception = interface_inst.pmpcfg2_exception;
        seq_item_con1.pmpcfg3_exception = interface_inst.pmpcfg3_exception;
        seq_item_con1.pmpaddr0_exception = interface_inst.pmpaddr0_exception ;
        seq_item_con1.pmpaddr1_exception = interface_inst.pmpaddr1_exception ;
        seq_item_con1.pmpaddr2_exception = interface_inst.pmpaddr2_exception ;
        seq_item_con1.pmpaddr3_exception = interface_inst.pmpaddr3_exception ;
        seq_item_con1.pmpaddr4_exception = interface_inst.pmpaddr4_exception ;
        seq_item_con1.pmpaddr5_exception = interface_inst.pmpaddr5_exception ;
        seq_item_con1.pmpaddr6_exception = interface_inst.pmpaddr6_exception ;
        seq_item_con1.pmpaddr7_exception = interface_inst.pmpaddr7_exception ;
        seq_item_con1.pmpaddr8_exception = interface_inst.pmpaddr8_exception ;
        seq_item_con1.pmpaddr9_exception = interface_inst.pmpaddr9_exception ;
        seq_item_con1.pmpaddr10_exception = interface_inst.pmpaddr10_exception ;
        seq_item_con1.pmpaddr11_exception = interface_inst.pmpaddr11_exception ;
        seq_item_con1.pmpaddr12_exception = interface_inst.pmpaddr12_exception ;
        seq_item_con1.pmpaddr13_exception = interface_inst.pmpaddr13_exception ;
        seq_item_con1.pmpaddr14_exception = interface_inst.pmpaddr14_exception ;
        seq_item_con1.pmpaddr15_exception = interface_inst.pmpaddr15_exception ;
        seq_item_con1.pmp_en = interface_inst.pmp_en;
        seq_item_con1.memory_access_write_address= interface_inst.memory_access_write_address;
        seq_item_con1.memory_access_write_en = interface_inst.memory_access_write_en;
        seq_item_con1.memory_access_read_address= interface_inst.memory_access_read_address;
        seq_item_con1.memory_access_read_en = interface_inst.memory_access_read_en;

       /* seq_item_con1.start_address0 = interface_inst.start_address0 ;
        seq_item_con1.start_address1 = interface_inst.start_address1 ;
        seq_item_con1.start_address2 = interface_inst.start_address2 ;
        seq_item_con1.start_address3 = interface_inst.start_address3 ;
        seq_item_con1.start_address4 = interface_inst.start_address4 ;
        seq_item_con1.start_address5 = interface_inst.start_address5 ;
        seq_item_con1.start_address6 = interface_inst.start_address6 ;
        seq_item_con1.start_address7 = interface_inst.start_address7 ;
        seq_item_con1.start_address8 = interface_inst.start_address8 ;
        seq_item_con1.start_address9 = interface_inst.start_address9 ;
        seq_item_con1.start_address10 = interface_inst.start_address10 ;
        seq_item_con1.start_address11 = interface_inst.start_address11 ;
        seq_item_con1.start_address12 = interface_inst.start_address12;
        seq_item_con1.start_address13 = interface_inst.start_address13 ;
        seq_item_con1.start_address14 = interface_inst.start_address14 ;
        seq_item_con1.start_address15 = interface_inst.start_address15 ;
        seq_item_con1.end_address0 = interface_inst.end_address0 ;
        seq_item_con1.end_address1 = interface_inst.end_address1 ;
        seq_item_con1.end_address2 = interface_inst.end_address2 ;
        seq_item_con1.end_address3 = interface_inst.end_address3 ;
        seq_item_con1.end_address4 = interface_inst.end_address4 ;
        seq_item_con1.end_address5 = interface_inst.end_address5 ;
        seq_item_con1.end_address6 = interface_inst.end_address6 ;
        seq_item_con1.end_address7 = interface_inst.end_address7 ;
        seq_item_con1.end_address8 = interface_inst.end_address8 ;
        seq_item_con1.end_address9 = interface_inst.end_address9 ;
       seq_item_con1.end_address10 = interface_inst.end_address10 ;
       seq_item_con1.end_address11 = interface_inst.end_address11 ;
       seq_item_con1.end_address12 = interface_inst.end_address12 ;
       seq_item_con1.end_address13 = interface_inst.end_address13 ;
       seq_item_con1.end_address14 = interface_inst.end_address14;
       seq_item_con1.end_address15 = interface_inst.end_address15 ;*/
       seq_item_con1.region0_range_exception = interface_inst.region0_range_exception;
       seq_item_con1.region1_range_exception = interface_inst.region1_range_exception;
       seq_item_con1.region2_range_exception = interface_inst.region2_range_exception;
       seq_item_con1.region3_range_exception = interface_inst.region3_range_exception;
       seq_item_con1.region4_range_exception = interface_inst.region4_range_exception;
       seq_item_con1.region5_range_exception = interface_inst.region5_range_exception;
       seq_item_con1.region6_range_exception = interface_inst.region6_range_exception;
       seq_item_con1.region7_range_exception = interface_inst.region7_range_exception;
       seq_item_con1.region8_range_exception = interface_inst.region8_range_exception;
       seq_item_con1.region9_range_exception = interface_inst.region9_range_exception;
       seq_item_con1.region10_range_exception = interface_inst.region10_range_exception;
       seq_item_con1.region11_range_exception = interface_inst.region11_range_exception;
       seq_item_con1.region12_range_exception = interface_inst.region12_range_exception;
       seq_item_con1.region13_range_exception = interface_inst.region13_range_exception;
       seq_item_con1.region14_range_exception = interface_inst.region14_range_exception;
       seq_item_con1.region15_range_exception = interface_inst.region15_range_exception;
       seq_item_con1.load_exception = interface_inst.load_exception;
       seq_item_con1.store_exception = interface_inst.store_exception;
       seq_item_con1.overlapping_region_exception0 = interface_inst.overlapping_region_exception0;//if there is overlapping between two regions then this
       seq_item_con1.overlapping_region_exception1 = interface_inst.overlapping_region_exception1;
       seq_item_con1.overlapping_region_exception2 = interface_inst.overlapping_region_exception2;
       seq_item_con1.overlapping_region_exception3 = interface_inst.overlapping_region_exception3;
       seq_item_con1.overlapping_region_exception4 = interface_inst.overlapping_region_exception4;
       seq_item_con1.overlapping_region_exception5 = interface_inst.overlapping_region_exception5;
       seq_item_con1.overlapping_region_exception6 = interface_inst.overlapping_region_exception6;
       seq_item_con1.overlapping_region_exception7 = interface_inst.overlapping_region_exception7;
       seq_item_con1.overlapping_region_exception8 = interface_inst.overlapping_region_exception8;
       seq_item_con1.overlapping_region_exception9 = interface_inst.overlapping_region_exception9;
       seq_item_con1.overlapping_region_exception10 = interface_inst.overlapping_region_exception10;
       seq_item_con1.overlapping_region_exception11 = interface_inst.overlapping_region_exception11;
       seq_item_con1.overlapping_region_exception12 = interface_inst.overlapping_region_exception12;
       seq_item_con1.overlapping_region_exception13 = interface_inst.overlapping_region_exception13;
       seq_item_con1.overlapping_region_exception14 = interface_inst.overlapping_region_exception14;
       seq_item_con1.overlapping_region_exception15 = interface_inst.overlapping_region_exception15;
       seq_item_con1.valid_memory_access_write_address = interface_inst.valid_memory_access_write_address;
       seq_item_con1.valid_memory_access_read_address = interface_inst.valid_memory_access_read_address;







       //seq_item_con1.print();
   
        port_con1.write(seq_item_con1);
      end
    end
    join
  endtask
 
endclass


