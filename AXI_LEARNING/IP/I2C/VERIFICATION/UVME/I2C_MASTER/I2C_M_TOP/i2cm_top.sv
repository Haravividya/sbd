//........................I2C MASTER TOP FILE..................

`timescale 1ns/1ps
//`define clk_period  10
   
module i2cm_top ;
  
  //uvm package and package file
  import uvm_pkg::*;
  import i2cm_mypkg::*;

   wand sda_dut;
  // wand scl_dut;  //needed only if i2c_scl is inout
 
  //clk gtn
  logic i2c_clock_in=1'b1;
  always #5 i2c_clock_in =~i2c_clock_in;
 
  
  //intrface instantiation
  i2cm_intrf intrf_inst(i2c_clock_in);
  
  //dut instantiation
  i2c_master_controller #(.DSIZE(15),.ASIZE(2))
  i2cm1
                            ( .i2c_clock_in      (intrf_inst.i2c_clock_in),
                              .i2c_reset_in      (intrf_inst.i2c_reset_in),
                              .i2c_start         (intrf_inst.i2c_start), 
                              .rw_bit            (intrf_inst.rw),
                              .i2c_master_addr_wr(intrf_inst.i2c_master_addr_wr),
                              .i2c_master_data_wr(intrf_inst.i2c_master_data_wr),
                              .i2c_master_data_rd(intrf_inst.i2c_master_data_rd),
                              .fifo_full         (intrf_inst.fifo_full),
                              .ready_out         (intrf_inst.ready_out),
                              .i2c_sda           (sda_dut),
                              .i2c_scl           (intrf_inst.i2c_scl_inout));


//  i2c_interconnect tb_connect( .master_sda(sda_dut),.slave_sda(intrf_inst.i2c_sda_inout),.master_scl(scl_dut),.slave_scl(intrf_inst.i2c_scl_inout));

  i2c_interconnect tb_connect( .master_sda(sda_dut),.slave_sda(intrf_inst.i2c_sda_inout));

  //configure interface DB
  initial
  begin
    uvm_config_db#(virtual i2cm_intrf)::set(null,"","I2CM_INTERFACE_DB",intrf_inst);
  end
  

  //start run
  initial
  begin
   run_test();
   // repeat(100000) @(posedge i2c_clock_in);
  //  $finish;
  end 


  initial
  begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end

endmodule  
/*

module i2c_interconnect(inout master_sda, inout slave_sda, inout master_scl,inout slave_scl);

  tran sda(master_sda,slave_sda);
  tran scl(master_scl,slave_scl);

endmodule
*/
   

module i2c_interconnect(inout master_sda, inout slave_sda);

  tran sda(master_sda,slave_sda);
 
endmodule

       
