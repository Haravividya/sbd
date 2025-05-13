

//--------------------------------------------------------------------------------------
//file name : i2cs_top.sv
//project name: i2c_slave
//---------------------------------------------------------------------------------------

// defining time scale and clock period
`timescale 1ns/1ps
`define clk_period  10
   
module i2cs_top;

  //uvm package
  import uvm_pkg::*;
  import i2cs_mypkg::*;
  
  // defining wand signal for inout connection
  // wand scls_dut;
  wand sdas_dut;
 
  //clk generation
  logic clk=1'b1;
  always #(`clk_period/2)
    clk =~clk;
  
  //intrfc instantiation
  i2cs_intrf_tb intrf_inst(clk);
  
  //dut instantiation
  i2c_slave_controller dut(.i2c_rst(intrf_inst.i2c_rst),
                          .i2c_scl(intrf_inst.i2c_scl),
                          .i2c_sda(sdas_dut));

  

  //intercnnect instantiation
  i2c_interconnect tb_connect( .slave_sda(sdas_dut),
                              .master_sda(intrf_inst.i2c_sda_inout));


			   
  //start run
  initial
  begin
   // uvm_config_db#(virtual intrf_tb)::set(uvm_root::get(),"*","Interface_DB",intrf_inst);
    uvm_config_db#(virtual i2cs_intrf_tb)::set(null,"","INTERFACE_CONFIG_DB",intrf_inst);
  end
  
  //start run
  initial
  begin
    run_test("i2cs_test");
    repeat(100000) @(posedge clk);
    $finish;
  end 

  //producing waveform 
  initial
  begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end

endmodule  

// module for inteconnecting inout signals
module i2c_interconnect(inout master_sda, inout slave_sda);

  tran sda(slave_sda,master_sda);
 // tran scl(slave_scl, master_scl);
 
endmodule
 