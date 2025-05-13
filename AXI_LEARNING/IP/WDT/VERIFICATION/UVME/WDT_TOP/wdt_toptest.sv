//`timescale 1ns/1ps

module top;

  import uvm_pkg::*;
  import wdt_pkg::*;

  logic clk;
  logic rst;

  wdt_intf vif(clk,rst);
  
  
  wdt_top dut(.wdt_clk_i(vif.clk),
              .wdt_rst_i(vif.rst),
              .wdt_reg_addr(vif.wdt_reg_addr),
              .wdt_reg_data(vif.wdt_reg_data),
              .wdt_counter(vif.wdt_counter),
              .wdt_reset_o(vif.wdt_reset_o),
              .wdt_interrupt_o(vif.wdt_interrupt_o),
              .stop_mode_i(vif.stop_mode_i),
              .wait_mode_i(vif.wait_mode_i),
              .debug_mode_i(vif.debug_mode_i));


  always #5 clk = ~clk;

  initial
  begin
	 $shm_open("wave.shm");
    $shm_probe("ACTMF");
    clk = 0;
    rst = 1;
    #2
    rst = 0;
    #12
    rst = 1;
    #145
    rst = 0;
    #10
    rst = 1;
 end

 initial
 begin

   
    uvm_config_db#(virtual wdt_intf)::set(null,"","vif",vif);
    run_test("wdt_test");
    run_test("wdt_word_test");
    run_test("wdt_wait_test");
    run_test("wdt_stop_test");
    run_test("wdt_debug_test");
    run_test("wdt_modes_test");
    run_test("wdt_interrupt16_test");
    run_test("wdt_interrupt32_test");
    run_test("wdt_interrupt64_test");

  end 

endmodule
