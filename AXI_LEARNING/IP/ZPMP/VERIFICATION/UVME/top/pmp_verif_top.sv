/*************************************************
File name:pmp_verif_top.sv
Description: This is the top most module in the tetbench
This module has: RTL instance, Interface instance, UVM - run_test, wave dump etc;

**************************************************/
`timescale 1ns/1ps

`define  CLK_PRD           2.857  // 350 MHz , input clock frequency
 module pmp_verif_top();

        // UVM package
        import uvm_pkg::*;
       // `include "uvm_macros.svh"
        
		// TB package
        import pkg::*;

        // input clock_generation ------------------------------------------------------------------------------
        logic tb_clk    = 1'b0;
        always #(`CLK_PRD/2)        tb_clk = ~tb_clk;   
         /*logic tb_clk=1'b0;
         integer time_period=$urandom_range(10,20);
         integer duty_cycle=$urandom_range(30,50);
         integer on_time=(time_period*duty_cycle)/100;
         integer off_time=time_period-on_time;

          initial
            begin
             // tb_clk=0;
              forever
                begin
                 #off_time tb_clk=1;
                 #on_time  tb_clk=0;
                end
            end
   */
        // interface instance
        pmp_interface_tb interface_inst(tb_clk);
       

        // UVM_test ---------------------------------------------------------------------------------------
        initial begin
                uvm_config_db#(virtual pmp_interface_tb)::set(uvm_root::get(),"*","INTERFACE_INST_DB", interface_inst);
                
				run_test(" ");// start point - UVM   this is a task, coded inside UVM library
				// run_test("test_name");
        end

        // wave_dump ----------------------------------------------------------------------------------------
        initial begin
                    $shm_open("wave.shm");
                    $shm_probe("ACTMF");
                      
              end

        

        //  RTL instance ---------------------------------------------------------------------------------------
        pmpcsr_top DUT (
		                    // inputs
                            .csr_clk		(interface_inst.clk),
							.csr_rst		(interface_inst.csr_rst),
							.csr_write_data	(interface_inst.csr_write_data),
							.csr_write_en	(interface_inst.csr_write_en),
                            .kernal_mode_signal (interface_inst.kernel_mode_signal),
                            .machine_mode_valid (interface_inst.machine_mode_valid),
                            .csr_read_addr (interface_inst.csr_read_addr),
                            .csr_read_en (interface_inst.csr_read_en),
                            .csr_write_addr (interface_inst.csr_write_addr),
                            .pmp_en(interface_inst.pmp_en),
                            .memory_access_write_address(interface_inst.memory_access_write_address),          
                             .memory_access_write_en(interface_inst.memory_access_write_en),
                             .memory_access_read_address(interface_inst.memory_access_read_address),
                             .memory_access_read_en(interface_inst.memory_access_read_en),

							// output   
							.pmpcsr_read_data_o	(interface_inst.csr_read_out),
                            .pmpcfg0_exception_o(interface_inst.pmpcfg0_exception),
                             .pmpcfg1_exception_o(interface_inst.pmpcfg1_exception),
                             .pmpcfg2_exception_o(interface_inst.pmpcfg2_exception),
                             .pmpcfg3_exception_o(interface_inst.pmpcfg3_exception),
                             .pmpaddr0_exception_o(interface_inst.pmpaddr0_exception),
                             .pmpaddr1_exception_o(interface_inst.pmpaddr1_exception),
                             .pmpaddr2_exception_o(interface_inst.pmpaddr2_exception),
                             .pmpaddr3_exception_o(interface_inst.pmpaddr3_exception),
                             .pmpaddr4_exception_o(interface_inst.pmpaddr4_exception),
                             .pmpaddr5_exception_o(interface_inst.pmpaddr5_exception),
                             .pmpaddr6_exception_o(interface_inst.pmpaddr6_exception),
                             .pmpaddr7_exception_o(interface_inst.pmpaddr7_exception),
                             .pmpaddr8_exception_o(interface_inst.pmpaddr8_exception),
                             .pmpaddr9_exception_o(interface_inst.pmpaddr9_exception),
                             .pmpaddr10_exception_o(interface_inst.pmpaddr10_exception),
                             .pmpaddr11_exception_o(interface_inst.pmpaddr11_exception),
                             .pmpaddr12_exception_o(interface_inst.pmpaddr12_exception),
                              .pmpaddr13_exception_o(interface_inst.pmpaddr13_exception),
                              .pmpaddr14_exception_o(interface_inst.pmpaddr14_exception),
                             .pmpaddr15_exception_o(interface_inst.pmpaddr15_exception),
                              /*.start_address0(interface_inst.start_address0),
                              .start_address1(interface_inst.start_address1),
                               .start_address2(interface_inst.start_address2),
                               .start_address3(interface_inst.start_address3),
                               .start_address4(interface_inst.start_address4),
                              .start_address5(interface_inst.start_address5),
                              .start_address6(interface_inst.start_address6),
                              .start_address7(interface_inst.start_address7),
                              .start_address8(interface_inst.start_address8),
                              .start_address9(interface_inst.start_address9),
                              .start_address10(interface_inst.start_address10),
                              .start_address11(interface_inst.start_address11),
                              .start_address12(interface_inst.start_address12),
                              .start_address13(interface_inst.start_address13),
                              .start_address14(interface_inst.start_address14),
                              .start_address15(interface_inst.start_address15),
                              .end_address0(interface_inst.end_address0),
                              .end_address1(interface_inst.end_address1),
                              .end_address2(interface_inst.end_address2),
                              .end_address3(interface_inst.end_address3),
                              .end_address4(interface_inst.end_address4),
                              .end_address5(interface_inst.end_address5),
                              .end_address6(interface_inst.end_address6),
                              .end_address7(interface_inst.end_address7),
                              .end_address8(interface_inst.end_address8),
                              .end_address9(interface_inst.end_address9),
                              .end_address10(interface_inst.end_address10),
                              .end_address11(interface_inst.end_address11),
                              .end_address12(interface_inst.end_address12),
                              .end_address13(interface_inst.end_address13),
                              .end_address14(interface_inst.end_address14),
                              .end_address15(interface_inst.end_address15),*/
                               .overlapping_region_exception0(interface_inst.overlapping_region_exception0),//if there is overlapping between two regions then this
                               .overlapping_region_exception1(interface_inst.overlapping_region_exception1),//exception is raised
                               .overlapping_region_exception2(interface_inst.overlapping_region_exception2),
                               .overlapping_region_exception3(interface_inst.overlapping_region_exception3),
                               .overlapping_region_exception4(interface_inst.overlapping_region_exception4),
                               .overlapping_region_exception5(interface_inst.overlapping_region_exception5),
                               .overlapping_region_exception6(interface_inst.overlapping_region_exception6),
                               .overlapping_region_exception7(interface_inst.overlapping_region_exception7),
                               .overlapping_region_exception8(interface_inst.overlapping_region_exception8),
                               .overlapping_region_exception9(interface_inst.overlapping_region_exception9),
                               .overlapping_region_exception10(interface_inst.overlapping_region_exception10),
                               .overlapping_region_exception11(interface_inst.overlapping_region_exception11),
                               .overlapping_region_exception12(interface_inst.overlapping_region_exception12),
                               .overlapping_region_exception13(interface_inst.overlapping_region_exception13),
                               .overlapping_region_exception14(interface_inst.overlapping_region_exception14),
                               .overlapping_region_exception15(interface_inst.overlapping_region_exception15),
                               .valid_memory_access_write_address(interface_inst.valid_memory_access_write_address),
                               .valid_memory_access_read_address(interface_inst.valid_memory_access_read_address),

                               .region0_range_exception(interface_inst.region0_range_exception),
                               .region1_range_exception(interface_inst.region1_range_exception),
                               .region2_range_exception(interface_inst.region2_range_exception),
                               .region3_range_exception(interface_inst.region3_range_exception),
                               .region4_range_exception(interface_inst.region4_range_exception),
                               .region5_range_exception(interface_inst.region5_range_exception),
                               .region6_range_exception(interface_inst.region6_range_exception),
                               .region7_range_exception(interface_inst.region7_range_exception),
                               .region8_range_exception(interface_inst.region8_range_exception),
                               .region9_range_exception(interface_inst.region9_range_exception),
                               .region10_range_exception(interface_inst.region10_range_exception),
                               .region11_range_exception(interface_inst.region11_range_exception),
                               .region12_range_exception(interface_inst.region12_range_exception),
                         .region13_range_exception(interface_inst.region13_range_exception),
                         .region14_range_exception(interface_inst.region14_range_exception),
                         .region15_range_exception(interface_inst.region15_range_exception),
                         .load_exception(interface_inst.load_exception),
                         .store_exception(interface_inst.store_exception)
 


                     		        );  
        
endmodule



