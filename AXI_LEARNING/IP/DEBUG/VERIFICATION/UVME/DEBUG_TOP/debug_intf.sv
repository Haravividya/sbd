`define CORE_DATA_WIDTH 64
interface dut_if (input logic tck,input logic pclock);
  logic         trstn;//TRST
  logic         tms;//TMS
  logic         tdi; 
  logic         tdo;
  logic         tdo_en;

//inputs
  logic         presetn;
  logic         step;
  logic         ebreak;
  logic         exception;
  logic		    [`CORE_DATA_WIDTH-1:0] debug_reg_read_data	;
  logic  	    debug_reg_read_valid		;
  logic         [`CORE_DATA_WIDTH-1:0] debug_mem_read_data  ;
  logic         debug_mem_read_valid        ;
	 
   //outputs
  logic         ndmreset				; 	
  logic         h_reset                 ;    
  logic         haltreq					;	
  logic         resumereq				;	
  logic         setresethaltreq			;	
  logic         clrresethaltreq			;	
  logic         resethaltreq            ;    
  logic         debug_reg_write_enable	;	
  logic         [`CORE_DATA_WIDTH-1:0] debug_reg_write_data ;
  logic         debug_reg_read_enable	   ; 	
  logic         [15:0]debug_reg_address	   ; 
  logic         debug_mem_read_enable      ; 
  logic         debug_mem_write_enable     ; 
  logic         [`CORE_DATA_WIDTH-1:0]debug_mem_read_addr   ;
  logic         [`CORE_DATA_WIDTH-1:0]debug_mem_write_addr  ;
  logic         [`CORE_DATA_WIDTH-1:0]debug_mem_write_data  ;
  logic         [(`CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe; 

  //scoreboard signals

  logic [31:0]  dmstatus_reg   ;
  logic [31:0]  dmcontrol_reg  ;
  logic [31:0]  abstractcs_reg ;
  logic [31:0]  command_reg    ;
  //logic [31:0]  command        ;
  logic [3:0]   fsm_state      ; 
  logic [31:0]  data0_reg      ;
  logic [31:0]  data1_reg      ;
  logic [31:0]  data2_reg      ;
  logic [31:0]  data3_reg      ;

  //signals for JTAG tap states
  bit Reset            ;
  bit Capture_IR       ;
  bit Update_IR        ;
  bit Update_DR        ;
  bit Capture_DR       ;
  bit dr_scan          ;
  bit Shift_IR         ;
  bit Shift_DR         ;
  bit exit1_dr         ;
  bit pause_dr         ;
  bit pause_ir         ;
  bit exit2_dr         ;
  bit run_test_idle    ;
  bit resetn           ;
  bit tms_reset        ;
  bit select_ir_scan   ;
  //TSM and TRST used in tap states are declared in line 2 and 3



  clocking tb_ck @(posedge tck);
    output tdi;
    inout  tms;
    input  negedge tdo;
  endclocking // tb_ck

   modport jtag_tb_mod (clocking tb_ck);
   
      // proxy class extention and instantiation
  /*   class if_proxy extends jtag_if_proxy;
     
     virtual function void set_tdi(bit tdi);
         tb_ck.tdi <= tdi;
       endfunction // set_tdi
    
     virtual function void set_tms(bit tms);
         tb_ck.tms <= tms;
       endfunction // set_tdi

     endclass // jtag_if_proxy

    if_proxy proxy = new();
    
    */
     function void set_tdi(bit tdi);
         tb_ck.tdi <= tdi;
       endfunction // set_tdi
    
     function void set_tms(bit tms);
         tb_ck.tms <= tms;
       endfunction // set_tdi

// assertion file        
`include "../UVME/DEBUG_TOP/debug_assertion.sv" ; 

endinterface
