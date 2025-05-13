//`timescale 1ns/1ps

module top;

import uvm_pkg::*;
import axi_m_pkg::*;
 
 logic axi4_lite_clk;

 initial begin
 axi4_lite_clk = 0;
 end

 always #2 axi4_lite_clk =~axi4_lite_clk;

 intf pif(axi4_lite_clk);

  initial
  begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    uvm_config_db#(virtual intf)::set(null,"","pif",pif);
    run_test("axi_m_test");
    run_test("axi_m_64_test");
    run_test("axi_m_rand_test");
  end 
 
  axi4_lite_master dut (.axi4_lite_clk  ( pif.axi4_lite_clk  ),
                        .axi4_lite_rstn ( pif.axi4_lite_rstn ),
                        .M_AW_ADDR_OUT  ( pif.M_AW_ADDR_OUT  ),  
                        .M_AW_VALID_OUT ( pif.M_AW_VALID_OUT ), 
                        .M_AW_READY_IN  ( pif.M_AW_READY_IN  ),  
                        .M_W_DATA_OUT   ( pif.M_W_DATA_OUT   ),  
                        .M_W_STRB_OUT   ( pif.M_W_STRB_OUT   ),  
                        .M_W_VALID_OUT  ( pif.M_W_VALID_OUT  ),  
                        .M_W_READY_IN   ( pif.M_W_READY_IN   ),      
                        .M_B_RESP_IN    ( pif.M_B_RESP_IN    ),            
                        .M_B_VALID_IN   ( pif.M_B_VALID_IN   ),           
                        .M_B_READY_OUT  ( pif.M_B_READY_OUT  ),          
                        .M_AR_ADDR_OUT  ( pif.M_AR_ADDR_OUT  ),             
                        .M_AR_VALID_OUT ( pif.M_AR_VALID_OUT ),           
                        .M_AR_READY_IN  ( pif.M_AR_READY_IN  ),           
                        .M_R_DATA_IN    ( pif.M_R_DATA_IN    ),              
                        .M_R_RESP_IN    ( pif.M_R_RESP_IN    ),                
                        .M_R_VALID_IN   ( pif.M_R_VALID_IN   ),            
                        .M_R_READY_OUT  ( pif.M_R_READY_OUT  ),           
                        .wr_en_in       ( pif.wr_en_in       ),             
                        .rd_en_in       ( pif.rd_en_in       ),        
                        .byte_en        ( pif.byte_en        ),               
                        .wr_addr_in     ( pif.wr_addr_in     ),             
                        .rd_addr_in     ( pif.rd_addr_in     ),                
                        .m_data_in      ( pif.m_data_in      ),          
                        .m_data_out     ( pif.m_data_out     ));

endmodule      
