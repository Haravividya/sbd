class debug_test extends uvm_test;

  `uvm_component_utils(debug_test)
  //Declare Env and sequence 
  debug_env env;
  debug_sequence debug_seq;
   static logic [1:0]IR_SCAN = 2'b10 ;
   static logic [1:0]DR_SCAN = 2'b01 ;
   static logic [1:0]IR_DR_SCAN = 2'b00 ;
   int count = 0 ; 
   logic [31:0]addrs ;
   logic [2:0]aamsize ;
   logic exception ; 
   bit [15:0]csr_addrs_array[]     ={   16'hF11, 16'hF12, 16'hF13, 16'hF14, 16'h300, 16'h301, 
                                        16'h304, 16'h305, 16'h340, 16'h341, 16'h342,
                                        16'h343, 16'h344, 16'hB00, 16'hB02, 16'hB03, 16'hB04, 16'hB05,
                                        16'hB06, 16'hB07, 16'hB08, 16'hB09, 16'hB0A, 16'hB0B, 16'hB0C,
                                        16'hB0D, 16'hB0E, 16'hB0F, 16'hB10, 16'hB11, 16'hB12, 16'hB13,
                                        16'hB14, 16'hB15, 16'hB16, 16'hB17, 16'hB18, 16'hB19, 16'hB1A,
                                        16'hB1B, 16'hB1C, 16'hB1D, 16'hB1E, 16'hB1F, 16'h320, 16'h323,
                                        16'h324, 16'h325, 16'h326, 16'h327, 16'h328, 16'h329, 16'h32A,
                                        16'h32B, 16'h32C, 16'h32D, 16'h32E, 16'h32F, 16'h330, 16'h331,
                                        16'h332, 16'h333, 16'h334, 16'h335, 16'h336, 16'h337, 16'h338,
                                        16'h339, 16'h33A, 16'h33B, 16'h33C, 16'h33D, 16'h33E, 16'h33F,
                                        16'hBC0, 16'hFC0, 16'hFC1 ,16'h7B0 ,16'h7B1  } ; 



  function new (string name="debug_test", uvm_component parent=null);
    super.new(name, parent);
	`uvm_info("Test ", $sformatf(" Entry to Test"), UVM_LOW)
  endfunction : new

  // Create Env and sequence 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	env = debug_env :: type_id :: create("env",this);
	debug_seq = debug_sequence :: type_id :: create("debug_seq");
  endfunction : build_phase

   //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);  	
    phase.raise_objection(this);
   `uvm_info("Test file ", $sformatf("in Test , to start sequencer : Goes to sequence"), UVM_LOW)
      debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE )  ; 
      count++ ;
      repeat(50)without_dmactive();//50
      repeat(50)random_cases() ; //100

      debug_seq.ir_dr_sel[count] = DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE | `HALTREQ ); 
      count++ ;

      repeat(5)debug_arc_case() ;//100
      debug_gpr_cases(); 
      debug_csr_cases() ; 
      repeat(5)debug_amc_case() ;//200
      repeat(5)random_addrs_amc() ;//50 
      repeat(5)random_cmd(); //20
      repeat(5)debug_coverage_cases();//100
      debug_seq.ir_dr_sel[count] = DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE | `RESUMEREQ ); 
      count++ ;

      debug_seq.ir_dr_sel[count] = DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `CLRRESETHALTREQ | `OP_WRITE )  ; //haltonreset = 0
      count++ ; 

      debug_seq.ir_dr_sel[count] = DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE  ); 
      count++ ;
      
      repeat(5)debug_reg_case() ;//200
      repeat(5)debug_cmderr4_case() ;//10
      debug_seq.ir_dr_sel[count] = DR_SCAN;
      debug_seq.instr_seq[count] = DMI_ACCESS;
      debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE  ); 
      count++ ;

    repeat(50)jtag_reg_case();

    debug_seq.start(env.agt.sqr);
    phase.drop_objection(this);
   `uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)
  endtask :run_phase

function void CmdErr_Clear();
     if(!$urandom_range(0, 5))begin //executing issusing another command in error wait state
         count++ ;
         debug_seq.ir_dr_sel[count] = DR_SCAN;
         debug_seq.instr_seq[count] = DMI_ACCESS;
         debug_seq.data_seq[count] = (`OP_WRITE | `COMMAND_ADDR | ($urandom() << 2 ) )  ;
 
         // Not clearing cmderr
         count++ ;
         debug_seq.ir_dr_sel[count] = DR_SCAN;
         debug_seq.instr_seq[count] = DMI_ACCESS;
         debug_seq.data_seq[count] = (`OP_WRITE | `ABSTRACTCS_ADDR | !(`CMDERR_CLR) ) ;
     end

     //clearing cmderr
     count++ ;
     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `ABSTRACTCS_ADDR | `CMDERR_CLR ) ;
endfunction


function void without_dmactive();
    
    parameter    C_HALTREQ_WD         = 7 ;    
    parameter    C_RESUMEREQ_WD       = 8 ;
    parameter    C_HARTRESET_WD       = 9 ;
    parameter    C_SETRESETHALTREQ_WD = 10 ; 
    parameter    C_CLRRESETHALTREQ_WD = 11 ; 
    parameter    C_NDMRESET_WD        = 12 ; 
    parameter    C_ACKHAVERESET_WD    = 13 ;
    parameter    C_ACKUNAVAIL_WD    = 13 ;

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    
    case($urandom_range(7 , 15)) 
     C_HALTREQ_WD           :    debug_seq.data_seq[count]  = (`DM_CONTROL | `HALTREQ         | `OP_WRITE )  ; //haltreq without dmactive
     C_RESUMEREQ_WD         :    debug_seq.data_seq[count]  = (`DM_CONTROL | `RESUMEREQ       | `OP_WRITE )  ; //resumereq without dmactive
     C_HARTRESET_WD         :    debug_seq.data_seq[count]  = (`DM_CONTROL | `HARTRESET       | `OP_WRITE )  ; //hartreset without dmactive 
     C_SETRESETHALTREQ_WD   :    debug_seq.data_seq[count]  = (`DM_CONTROL | `SETRESETHALTREQ | `OP_WRITE )  ; //haltonreset without dmactive
     C_CLRRESETHALTREQ_WD   :    debug_seq.data_seq[count]  = (`DM_CONTROL | `CLRRESETHALTREQ | `OP_WRITE )  ; //haltonreset = 0 without dmactive
     C_NDMRESET_WD          :    debug_seq.data_seq[count]  = (`DM_CONTROL | `NDMRESET        | `OP_WRITE )  ; //ndmreset without dmactive
     C_ACKHAVERESET_WD      :    debug_seq.data_seq[count]  = (`DM_CONTROL | `ACKHAVERESET    | `OP_WRITE )  ; //acknowledgement without dmactive
     C_ACKUNAVAIL_WD        :    debug_seq.data_seq[count]  = (`DM_CONTROL | `ACKUNAVAIL      | `OP_WRITE )  ; //acknowledgement without dmactive
     default                :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `OP_WRITE );
    endcase
    count++ ; 

endfunction

//random fsm transition case
function void random_cases() ;

    parameter    C_HALTREQ            = 0 ;    
    parameter    C_RESUMEREQ          = 1 ;
    parameter    C_HARTRESET          = 2 ;
    parameter    C_SETRESETHALTREQ    = 3 ; 
    parameter    C_CLRRESETHALTREQ    = 4 ; 
    parameter    C_NDMRESET           = 5 ; 
    parameter    C_ACKHAVERESET       = 6 ;
    parameter    C_ACKUNAVAIL         = 7 ;

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;

    case($urandom_range(0 , 8)) 
     C_HALTREQ              :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `HALTREQ         | `OP_WRITE )  ; //haltreq 
     C_RESUMEREQ            :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `RESUMEREQ       | `OP_WRITE )  ; //resumereq
     C_HARTRESET            :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `HARTRESET       | `OP_WRITE )  ; //hartreset
     C_SETRESETHALTREQ      :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `SETRESETHALTREQ | `OP_WRITE )  ; //haltonreset = 1
     C_CLRRESETHALTREQ      :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `CLRRESETHALTREQ | `OP_WRITE )  ; //haltonreset = 0
     C_NDMRESET             :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `NDMRESET        | `OP_WRITE )  ; //ndmreset
     C_ACKHAVERESET         :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `ACKHAVERESET    | `OP_WRITE )  ; //reset acknowledgement
     C_ACKUNAVAIL           :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `ACKUNAVAIL      | `OP_WRITE )  ; //ackunavail (Functinality Not implemented for coverage added)
     default                :    debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `OP_WRITE );
    endcase
    count++ ; 

endfunction 

//debug Acces Register Command Cases
function void debug_arc_case() ; 
    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    case($urandom_range(0 , 8))
         0 : debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) |`TRANSFER_REG | `WR | `REG_NO($urandom_range(0,31)) ); //32/64bit Read/Write GPR
         1 : debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) |`WR | `REG_NO($urandom_range(0,31)));                  // 32/64bit Read/Write Will Fail because transfer reg = 0 
         2 :begin
             debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | (($urandom_range(0,1) ? $urandom_range(0,1):$urandom_range(4,7) ) << 22) |`TRANSFER_REG | `WR | `REG_NO($urandom_range(0,31))); // GPR W/R with inappropriate aarsize , results in cmderr=2
             CmdErr_Clear();
            end
         3 :begin
             debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | (($urandom_range(0,1) ? $urandom_range(0,1):$urandom_range(4,7) ) << 22) | `WR | `REG_NO($urandom_range(0,31))); //case 2 without transfer reg
             CmdErr_Clear();
            end
         4 : debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) |`TRANSFER_REG | `WR | `CSR_REG(csr_addrs_array[$urandom_range(0,78)] )); //32/64bit R/W CSR
         5 : debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) | `WR | `CSR_REG(csr_addrs_array[$urandom_range(0,78)])); //32/64bit case without transfer reg
         6 :begin
             debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | (($urandom_range(0,1) ? $urandom_range(0,1):$urandom_range(4,7) ) << 22) |`TRANSFER_REG | `WR | `CSR_REG(csr_addrs_array[$urandom_range(0,78)] )); //inappropirate aarsize
             CmdErr_Clear();
            end
         7 :begin
             debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | (($urandom_range(0,1) ? $urandom_range(0,1):$urandom_range(4,7) ) << 22) | `WR | `CSR_REG(csr_addrs_array[$urandom_range(0,78)]) ); //inappropriate aarsize without transfer reg
             CmdErr_Clear();
            end 
         8 :begin
             debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) | `WR | `TRANSFER_REG | `REG_NO($urandom_range(32 ,'hefff)) ); //inappropriate register addres will result jin cmderr=2
             CmdErr_Clear();
            end 
  
    endcase
   count++ ; 
endfunction

function void data_reg_drive();
   debug_seq.ir_dr_sel[count] = DR_SCAN;
   debug_seq.instr_seq[count] = DMI_ACCESS;
   debug_seq.data_seq[count] = (`OP_WRITE | ($urandom_range(4,7) << 34 ) | `RANDOM_DATA ) ;
   count++; 
endfunction
function void debug_gpr_cases();
  for(int gpr = 0 ; gpr < 32 ; gpr++ ) begin
    data_reg_drive(); 
    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_32  |`TRANSFER_REG | `WRITE_A_R | `REG_NO(gpr) ) ;  
    count++ ;

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_32  |`TRANSFER_REG | `WRITE_R_A | `REG_NO(gpr)  ) ;  
    count++ ; 

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_64  |`TRANSFER_REG | `WRITE_A_R | `REG_NO(gpr)  ) ;  
    count++ ; 
    
    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_64  |`TRANSFER_REG | `WRITE_R_A | `REG_NO(gpr)  ) ;  
    count++ ; 
   end

endfunction 

function void debug_csr_cases();
foreach(csr_addrs_array[i]) begin
    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_32  |`TRANSFER_REG | `WRITE_R_A | `CSR_REG(csr_addrs_array[i]) ) ;  
    count++ ;

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_32  |`TRANSFER_REG | `WRITE_A_R | `CSR_REG(csr_addrs_array[i]) ) ;  
    count++ ; 

    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_64  |`TRANSFER_REG | `WRITE_R_A | `CSR_REG(csr_addrs_array[i]) ) ;  
    count++ ; 
    
    debug_seq.ir_dr_sel[count] = DR_SCAN;
    debug_seq.instr_seq[count] = DMI_ACCESS;
    debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | `AARSIZE_64  |`TRANSFER_REG | `WRITE_A_R | `CSR_REG(csr_addrs_array[i]) ) ;  
    count++ ; 
end

endfunction

//memory Acces Case: Instruction and Data Memory
function void debug_amc_case();
    
     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA0_ADDR | `RANDOM_DATA) ;
     count++ ;
    
     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA1_ADDR | `RANDOM_DATA ) ;
     count++ ;
     
     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA2_ADDR | `RANDOM_DATA ) ;
     count++ ; 

     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA3_ADDR | `RANDOM_DATA ) ;
     count++ ;

     exception = $urandom_range(0 , 5) ? 1'b0 : 1'b1 ; //exception case is generated at the probability of 1/6
     if(!exception)
       begin
        if($urandom_range(0 , 1))
            addrs = $urandom_range(`DATA_MEM_BASE_ADDR/4'd8 , `DATA_MEM_END_ADDR/4'd8 ) * 32'd8  ; //selecting data memory address
        else
            addrs = $urandom_range(`INSTR_MEM_BASE_ADDR/4'd8 , `INSTR_MEM_END_ADDR/4'd8 ) * 32'd8; //selecting the instruction memory address
       end
     else
       begin
        if($urandom_range(0 , 1))
            addrs = ($urandom_range(`DATA_MEM_BASE_ADDR/4'd8 , `DATA_MEM_END_ADDR/4'd8 ) * 32'd8 ) + 1  ; //misaligned data memory address
        else
            addrs = ($urandom_range(`INSTR_MEM_BASE_ADDR/4'd8 , `INSTR_MEM_END_ADDR/4'd8 ) * 32'd8) + 1  ; //misaligned instruction memory address
       end

        if($urandom_range(0,1))
            aamsize = $urandom_range(0,3) ;   //selecting aamsize (8bit , 16bit , 32bit , 64bit Memory Access)
        else
            aamsize = $urandom_range(4,7) ;  //Selecting inappropriate aamsize, result in cmderr=2
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
        debug_seq.data_seq[count] = (`OP_WRITE | `DATA2_ADDR | (addrs << 2 ) ) ; //writing addres to addres register
        count++ ;
        
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
        debug_seq.data_seq[count] = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_AMC  | (aamsize << 22) | ($urandom_range(0,1) << 21)| `WR ); //command to access the memory
        if(aamsize > 3 || (exception && (aamsize != 0))) //if command issued results in cmderr next command should clear the cmderr in abstractcs 
            CmdErr_Clear();
        
    count++ ; 
endfunction

function void random_addrs_amc();

     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA2_ADDR | `RANDOM_DATA ) ;
     count++ ; 

     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `DATA3_ADDR | `RANDOM_DATA ) ;
     count++ ;
      
     aamsize = $urandom_range(0,3) ; 
     debug_seq.ir_dr_sel[count] = DR_SCAN;
     debug_seq.instr_seq[count] = DMI_ACCESS;
     debug_seq.data_seq[count] = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_AMC  | (aamsize << 22) | ($urandom_range(0,1) << 21)| `WR ); //command to access the memory
     CmdErr_Clear();
     count++ ;

endfunction 
//debug register cases
function void debug_reg_case();
        debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
    case($urandom_range(0 , 7))
        0: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `DATA0_ADDR | `RANDOM_DATA ) ; //R/W/NOP on data0-data3 regisgter
        1: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `DATA1_ADDR | `RANDOM_DATA ) ; //R/W/NOP on data0-data3 regisgter
        2: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `DATA2_ADDR | `RANDOM_DATA ) ; //R/W/NOP on data0-data3 regisgter
        3: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `DATA3_ADDR | `RANDOM_DATA ) ; //R/W/NOP on data0-data3 regisgter
        4: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `ABSTRACTCS_ADDR  | `RANDOM_DATA  ) ; // R/W/NOP on abstractcs register
        5: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `DM_STATUS | `RANDOM_DATA ) ;  // R/W/NOP on dmstatus
        6: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) | `HART_INFO | `RANDOM_DATA ) ;  // R/W/NOP on hartinfo
        7: debug_seq.data_seq[count] = ( $urandom_range(0 , 1) | `DM_CONTROL | `RANDOM_DATA  ) ;  // R/NOP on hartinfo
        //8: debug_seq.data_seq[count] = ( $urandom_range(0 , 2) |  ( $urandom() << 34 ) | `RANDOM_DATA ) ;  // R/W/NOP on hartinfo
    endcase
count++ ;
endfunction

function debug_coverage_cases();
//selecting random addres
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
        case($urandom_range(1,4))
        1: debug_seq.data_seq[count] = ( $urandom_range(0, 2) |  ( $urandom_range('h13 , 'h15) << 34 ) | ($urandom() << 2 ) ) ;  // R/W/NOP on hartinfo
        2: debug_seq.data_seq[count] = ( $urandom_range(0, 2) |  ( $urandom_range('h18 , 'h19) << 34 ) | ($urandom() << 2 ) ) ;  // R/W/NOP on hartinfo
        3: debug_seq.data_seq[count] = ( $urandom_range(0, 2) |  ( $urandom_range('h0 , 'h3) << 34 ) | ($urandom() << 2 ) ) ;  // R/W/NOP on hartinfo
        4: debug_seq.data_seq[count] = ( $urandom_range(0, 2) |  ( $urandom_range('h2f , 'h7f) << 34 ) | ($urandom() << 2 ) ) ;  // R/W/NOP on hartinfo
        endcase
        count++ ;

endfunction 
//function to generate cmderr = 4
function void debug_cmderr4_case();
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;

        case($urandom_range(0,1))
           
         0: begin //hart is in reset state and issuing command will result in cmderr=4
                debug_seq.data_seq[count] = (`DM_CONTROL | `DM_ACTIVE | `HARTRESET | `OP_WRITE )  ;
                count++ ; 
                debug_seq.ir_dr_sel[count] = DR_SCAN;
                debug_seq.instr_seq[count] = DMI_ACCESS;
                debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) |`TRANSFER_REG | `WR | `REG_NO($urandom_range(0,31)) );
            end
        1: begin //hart in in running state issuing command will result in cmderr = 4
                debug_seq.data_seq[count] = (`DM_CONTROL | `DM_ACTIVE | `OP_WRITE )  ;
                count++ ;
                debug_seq.ir_dr_sel[count] = DR_SCAN;
                debug_seq.instr_seq[count] = DMI_ACCESS;
                debug_seq.data_seq[count]  = (`OP_WRITE | `COMMAND_ADDR | `CMDTYPE_ARC | ($urandom_range(2,3) << 22) |`TRANSFER_REG | `WR | `REG_NO($urandom_range(0,31)) );
            end
        endcase
        CmdErr_Clear();

        count++ ; 
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
        debug_seq.data_seq[count]  = (`DM_CONTROL | `DM_ACTIVE | `OP_WRITE );

count++ ; 
endfunction 

//driving random data to command register
function void random_cmd();
        debug_seq.ir_dr_sel[count] = DR_SCAN;
        debug_seq.instr_seq[count] = DMI_ACCESS;
        debug_seq.data_seq[count]  = (`COMMAND_ADDR |  ($urandom() << 2 ) | ($urandom_range(0,2) << 0 ) );
        CmdErr_Clear();
        count++ ; 
endfunction


function void jtag_reg_case();
    
    case($urandom_range(0,3))
    0:  begin
            debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
            debug_seq.instr_seq[count] = BYPASS ;
            debug_seq.data_seq[count] = $urandom(); 
        end
    1:  begin
            debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
            debug_seq.instr_seq[count] = IDCODE ;
            debug_seq.data_seq[count] = $urandom(); 
        end

    2:  begin
            debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
            debug_seq.instr_seq[count] = DTM_CSR ;
            debug_seq.data_seq[count] = (`DMI_HARDRESET);
        end
    3:  begin
            debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
            debug_seq.instr_seq[count] = DTM_CSR ;
            debug_seq.data_seq[count] = (`DMI_RESET);
        end
   /*  3: begin
            debug_seq.ir_dr_sel[count] = IR_DR_SCAN;
            debug_seq.instr_seq[count] = 5'h15 ;
            debug_seq.data_seq[count] = $urandom(); 
        end
 */ 
     endcase
    count++ ; 
endfunction



endclass : debug_test
