class debug_seq_item extends uvm_sequence_item;
    
    rand jtag_instr_registers instr;
    rand logic [40:0] data;
    rand int instr_sz;
    rand int data_sz;
    rand bit [3:0] delay;
    rand logic [1:0] ir_dr;

    constraint c_instr_sz {soft instr_sz == $size(instr)-1;}
    constraint c_data_sz {soft data_sz == $size(data)-1;}
    
   //input of JTAG
    bit   tms;
	bit   tck;
    bit   tdi;
    bit   tdo;
    
    //bit   trstn;

    //outputs of data register 
    bit  dr_scan;          // State is in DR Scan State
	bit  Capture_DR;       // Controls Capture operation in DR Path
	bit  Shift_DR;         // Controls Shift Operation in DR Path
	bit  Update_DR;        // Control Update DR operation
    //outputs of IR register
    bit  Capture_IR;
    bit  Shift_IR;
    bit  Update_IR;
    //Capture and Update stage clock signals
    bit  Capture_clk;//not required?get confirmed
    bit  Update_clk;//not required?get confirmed
   // bit  Reset;
    //
    bit  Reset; // Test Logic Reset State nothing but Reset signal
	bit  run_test_idle   ; // Run Test Idle State

    bit exit1_dr        ;
    bit exit2_dr        ;
    bit pause_dr        ;
    bit pause_ir        ;
    bit resetn          ;
    bit tms_reset       ;
    bit select_ir_scan  ;

    rand logic         step;
    rand logic         ebreak;
    rand logic         exception;
    rand logic		   [`CORE_DATA_WIDTH-1:0] debug_reg_read_data	;
    rand logic  	   debug_reg_read_valid		;
    rand logic         [`CORE_DATA_WIDTH-1:0] debug_mem_read_data  ;
    rand logic         debug_mem_read_valid        ;
     
    logic         trstn                     ;
    logic         presetn                   ;
     //outputs
    logic         ndmreset				    ; 	
    logic         h_reset                   ;    
    logic         haltreq					;	
    logic         resumereq			    	;	
    logic         setresethaltreq			;	
    logic         clrresethaltreq			;	
    logic         resethaltreq              ;    
    logic         debug_reg_write_enable	;	
    logic         [`CORE_DATA_WIDTH-1:0] debug_reg_write_data ;
    logic         debug_reg_read_enable	    ; 	
    logic         [15:0] debug_reg_address	; 
    logic         debug_mem_read_enable     ; 
    logic         debug_mem_write_enable    ; 
    logic         [`CORE_DATA_WIDTH-1:0]debug_mem_read_addr   ;
    logic         [`CORE_DATA_WIDTH-1:0]debug_mem_write_addr  ;
    logic         [`CORE_DATA_WIDTH-1:0]debug_mem_write_data  ;
    logic         [(`CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe;

  //sb signals 
    logic [31:0]  dmstatus_reg   ;
    logic [31:0]  dmcontrol_reg  ;
    logic [31:0]  abstractcs_reg ;
    logic [31:0]  data0_reg      ;
    logic [31:0]  data1_reg      ;
    logic [31:0]  data2_reg      ;
    logic [31:0]  data3_reg      ;
    logic [31:0]  command_reg    ;
    logic [3:0]   fsm_state      ;
   // logic [31:0]  command        ;
    

      //utility macros & field macros
     `uvm_object_utils_begin(debug_seq_item)
        `uvm_field_enum(jtag_instr_registers, instr, UVM_DEFAULT)
        `uvm_field_int(data, UVM_DEFAULT)
        `uvm_field_int(instr_sz, UVM_DEFAULT)
        `uvm_field_int(data_sz, UVM_DEFAULT)
        `uvm_field_int(delay, UVM_DEFAULT)
        `uvm_field_int(ir_dr, UVM_DEFAULT)
        `uvm_field_int(tms, UVM_DEFAULT)
        `uvm_field_int(trstn, UVM_DEFAULT)
        `uvm_field_int(presetn, UVM_DEFAULT)
        //`uvm_field_int(tck, UVM_DEFAULT)
        `uvm_field_int(dr_scan, UVM_ALL_ON)
        `uvm_field_int(Capture_DR, UVM_ALL_ON)
        `uvm_field_int(Shift_DR, UVM_ALL_ON)
        `uvm_field_int(Update_DR, UVM_ALL_ON)
        `uvm_field_int(step,UVM_ALL_ON)
        `uvm_field_int(ebreak,UVM_ALL_ON)
        `uvm_field_int(exception,UVM_ALL_ON)
        `uvm_field_int(debug_reg_read_data,UVM_ALL_ON)
        `uvm_field_int(debug_reg_read_valid,UVM_ALL_ON)
        `uvm_field_int(debug_mem_read_data,UVM_ALL_ON)
        `uvm_field_int(debug_mem_read_valid,UVM_ALL_ON)
        `uvm_field_int(ndmreset				 ,   UVM_ALL_ON)
        `uvm_field_int(h_reset               ,   UVM_ALL_ON)
        `uvm_field_int(haltreq				 ,   UVM_ALL_ON)
        `uvm_field_int(resumereq			 ,   UVM_ALL_ON)
        `uvm_field_int(setresethaltreq		 ,   UVM_ALL_ON)
        `uvm_field_int(clrresethaltreq		 ,   UVM_ALL_ON)
        `uvm_field_int(resethaltreq          ,   UVM_ALL_ON)
        `uvm_field_int(debug_reg_write_enable,	 UVM_ALL_ON)
        `uvm_field_int(debug_reg_write_data  ,   UVM_ALL_ON)
        `uvm_field_int(debug_reg_read_enable ,   UVM_ALL_ON)
        `uvm_field_int(debug_reg_address     ,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_read_enable ,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_write_enable,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_read_addr   ,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_write_addr  ,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_write_data  ,   UVM_ALL_ON)
        `uvm_field_int(debug_mem_strobe      ,   UVM_ALL_ON)
        `uvm_field_int(data0_reg             ,   UVM_ALL_ON)
        `uvm_field_int(data1_reg             ,   UVM_ALL_ON)
        `uvm_field_int(data2_reg             ,   UVM_ALL_ON)
        `uvm_field_int(data3_reg             ,   UVM_ALL_ON)
        `uvm_field_int(command_reg           ,   UVM_ALL_ON)
       // `uvm_field_int(command               ,   UVM_ALL_ON)
        `uvm_field_int(dmstatus_reg          ,   UVM_ALL_ON)
        `uvm_field_int(dmcontrol_reg         ,   UVM_ALL_ON)
        `uvm_field_int(abstractcs_reg        ,   UVM_ALL_ON)
        `uvm_field_int(fsm_state             ,   UVM_ALL_ON)
        `uvm_field_int(Reset                 ,   UVM_ALL_ON)
        `uvm_field_int(Shift_IR              ,   UVM_ALL_ON)
        `uvm_field_int(Capture_IR            ,   UVM_ALL_ON)
        `uvm_field_int(Update_IR             ,   UVM_ALL_ON)
        `uvm_field_int(run_test_idle         ,   UVM_ALL_ON)
        `uvm_field_int(exit1_dr              ,   UVM_ALL_ON)
        `uvm_field_int(exit2_dr              ,   UVM_ALL_ON)
        `uvm_field_int(pause_dr              ,   UVM_ALL_ON)
        `uvm_field_int(pause_ir              ,   UVM_ALL_ON)
        `uvm_field_int(tdi                   ,   UVM_ALL_ON)
        `uvm_field_int(tdo                   ,   UVM_ALL_ON)


      `uvm_object_utils_end

  //constructor 
  function new (string name ="debug_seq_item");
    super.new(name);
  endfunction	 


    constraint ebreak_step {soft ebreak == 1'b0;
                            soft step   == 1'b0 ; }

endclass


//----------------------------------------------

