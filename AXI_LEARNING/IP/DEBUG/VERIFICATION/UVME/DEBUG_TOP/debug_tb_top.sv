`include "uvm_macros.svh"
`timescale 1ns/1ps
`define CLK_PERIOD 10

module debug_tb_top;

  //uvm package and package files
  import uvm_pkg::*;
  import debug_pkg::*;

  //Clock signal declaration

  logic tck; 
  logic pclock;

  //Clock Generation
  always #((`CLK_PERIOD * 10 )/2) tck = ~tck;

  always #(`CLK_PERIOD / 2 )  pclock = ~pclock;

  initial begin
    tck = 0;
    pclock = 0;
  end


//Instance of interface : in order to connect DUT and Testcase/TB
  dut_if intf(tck,pclock);

//DUT instance , interface signals are connected to the DUT ports
  dtm_to_dm DUT(
	.TCK                     (intf.tck)         ,
	.TRST                    (intf.trstn)       ,
	.TMS                     (intf.tms)         ,
	.TDI                     (intf.tdi)         ,
	.TDO                     (intf.tdo)         ,
    .tdo_en                  (intf.tdo_en)      ,
    .pclock                  (intf.pclock)      ,
    .presetn                 (intf.presetn)     ,
    .step                    (intf.step)        ,
    .ebreak                  (intf.ebreak)      ,
    .exception               (intf.exception)   ,
   // .command                 (intf.command)     ,
    .ndmreset                (intf.ndmreset)    ,	 	
    .h_reset                 (intf.h_reset)     ,         
    .haltreq		         (intf.haltreq)     ,			
    .resumereq		         (intf.resumereq)   ,		
    .setresethaltreq         (intf.setresethaltreq) ,			
    .clrresethaltreq         (intf.clrresethaltreq) ,			
    .resethaltreq            (intf.resethaltreq )    ,         
    .debug_reg_write_enable  (intf.debug_reg_write_enable)  , 		
    .debug_reg_write_data    (intf.debug_reg_write_data)    ,  
    .debug_reg_read_enable   (intf.debug_reg_read_enable)   ,    	
    .debug_reg_address	     (intf.debug_reg_address)       ,
    .debug_reg_read_data	 (intf.debug_reg_read_data)     ,
    .debug_reg_read_valid	 (intf.debug_reg_read_valid)    ,
    .debug_mem_read_enable   (intf.debug_mem_read_enable)   ,     
    .debug_mem_write_enable  (intf.debug_mem_write_enable)  ,      
    .debug_mem_read_addr     (intf.debug_mem_read_addr)     ,
    .debug_mem_write_addr    (intf.debug_mem_write_addr)    ,
    .debug_mem_write_data    (intf.debug_mem_write_data)    ,
    .debug_mem_strobe        (intf.debug_mem_strobe)        ,
    .debug_mem_read_data	 (intf.debug_mem_read_data)     ,
    .debug_mem_read_valid	 (intf.debug_mem_read_valid)    
  );

//dut signals
    assign intf.dmstatus_reg    = DUT.apb_slave_dmreg_top_instnc.dmstatus_reg ;
    assign intf.dmcontrol_reg   = DUT.apb_slave_dmreg_top_instnc.dmcontrol_reg ;
    assign intf.abstractcs_reg  = DUT.apb_slave_dmreg_top_instnc.abstractcs_reg ;
    assign intf.command_reg     = DUT.apb_slave_dmreg_top_instnc.command_reg ;
    assign intf.data0_reg       = DUT.apb_slave_dmreg_top_instnc.data0_reg ;
    assign intf.data1_reg       = DUT.apb_slave_dmreg_top_instnc.data1_reg ;
    `ifdef ZILLA_64_BIT
    assign intf.data2_reg       = DUT.apb_slave_dmreg_top_instnc.data2_reg ;
    assign intf.data3_reg       = DUT.apb_slave_dmreg_top_instnc.data3_reg ;
    `endif
    assign intf.fsm_state       = DUT.debug_module_fsm_instnc.present_state;
   // assign intf.command         = DUT.debug_module_fsm_instnc.command;
    
   // assign intf.                = DUT.jtag_tap_controller.
    assign intf.Update_DR  =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Update_DR; 
    assign intf.Update_IR  =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Update_IR;
    assign intf.Capture_DR =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Capture_DR;
    assign intf.Capture_IR =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Capture_IR;
    assign intf.Shift_DR   =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Shift_DR;
    assign intf.Shift_IR   =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Shift_IR;
    assign intf.dr_scan    =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.dr_scan;
    assign intf.Reset      =   DUT.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance.Reset;


//Enable wave dump 
  initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end 

//set virtual interface - for configdb
  initial begin
    uvm_config_db#(virtual dut_if)::set(null,"*","vif",intf);  
    //interface handle "intf" , type : dut_if , label/name :vif
  end

//run_test()
  initial begin
    `uvm_info("Test Bench top", $sformatf("Test Bench : Entry"), UVM_LOW)
     run_test("debug_test");  //debug_test file is called //debug
    `uvm_info("Test Bench top ", $sformatf(" Test BenCh : Exit "), UVM_LOW)
  end

endmodule
