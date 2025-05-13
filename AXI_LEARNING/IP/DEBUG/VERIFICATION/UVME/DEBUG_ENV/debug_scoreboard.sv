/***********************************************************

File name   : debug_scoreboard.sv
Description :Has two write functions. 
One from DTM to DM operating at clock (pclock) and gets inputs from sequence item (seq_item.***..)
Another is from JTAG to DM operating at clock (tck) and gets inputs from sequence item (seq_item1.***)

Pending issue - allresumeack and anyresumeack of dmstatus[17:16] - rk

***********************************************************/
`uvm_analysis_imp_decl (_con1)
`uvm_analysis_imp_decl (_con2)
`define IDCODE_REG=32'h1495_11c3;

class debug_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(debug_scoreboard)
	 
  static uvm_analysis_imp_con1 #(debug_seq_item,debug_scoreboard) sb_port_con1; // For DTM to DM function
  static uvm_analysis_imp_con2 #(debug_seq_item,debug_scoreboard) sb_port_con2; // For JTAG to DM function 

  debug_seq_item seq_item, sb_seq_item, seq_item1;  // Sequence item handles declaration
  virtual dut_if vif;                               //  virtual interface handle     

  // parameter declaration of TAP Controller States
  localparam TEST_LOGIC_RESET = 4'd0 ; // RESET State
  localparam RUN_TEST_IDLE    = 4'd1 ; // IDLE State 
  localparam SELECT_DR_SCAN   = 4'd2 ; // Selects the Data Register Scan Path Path
  localparam CAPTURE_DR       = 4'd3 ; // Capture State capture the data bit
  localparam SHIFT_DR         = 4'd4 ; // Shift State shifts the data bit 
  localparam EXIT1_DR         = 4'd5 ; // Exit State 1 for DR Path
  localparam PAUSE_DR         = 4'd6 ; // Pause State basically halts the TAP Controller in DR stage
  localparam EXIT2_DR         = 4'd7 ; // Exit State 2 for DR Path
  localparam UPDATE_DR        = 4'd8 ; // Update State updates the data bit
  localparam SELECT_IR_SCAN   = 4'd9 ; // Selects the Instruction Register Scan Path Path
  localparam CAPTURE_IR       = 4'd10; // Capture State capture the instruction bit
  localparam SHIFT_IR         = 4'd11; // Shift State shifts the instruction bit 
  localparam EXIT1_IR         = 4'd12; // Exit State 1 for DR Path
  localparam PAUSE_IR         = 4'd13; // Pause State basically halts the TAP Controller in IR stage
  localparam EXIT2_IR         = 4'd14; // Exit State 2 for IR Path
  localparam UPDATE_IR        = 4'd15; // Update State updates the instruction bit

  reg [3:0] TAP_state = TEST_LOGIC_RESET; // Variable for TAP_state computation
  reg [3:0] next_TAP_state = 4'd0       ; // Variable for next_TAP_state computation
  reg [31:0] IDCODE_reg                 ; // Variable JTAG IDCODE registration

  // parameter declaration of FSM States
  localparam NORMAL_EXECUTION = 3'b000  ; // For Debug Module FSM State NORMAL_EXECUTION
  localparam HART_RESET       = 3'b001  ; // For Debug Module FSM State HART_RESET
  localparam HALTED           = 3'b010  ; // For Debug Module FSM State HALTED
  localparam START            = 3'b011  ; // For Debug Module FSM State START
  localparam TRANSFER         = 3'b100  ; // For Debug Module FSM State TRANSFER
  localparam PROGRAM_BUFFER   = 3'b101  ; // For Debug Module FSM State PROGRAM_BUFFER
  localparam DONE             = 3'b110  ; // For Debug Module FSM State DONE
  localparam ERROR_WAIT       = 3'b111  ; // For Debug Module FSM State ERROR_WAIT

  bit sb_dmactive                       ; // For sb_dmactive computation - dmcontrol[0]
  bit sb_seq_item_ndmresetpending       ; // For sb_seq_item_ndmresetpending computation - dmstatus[24]
  bit sb_seq_item_allhavereset          ; // For sb_seq_item_allhavereset computation - dmstatus[19]
  bit sb_seq_item_anyhavereset          ; // For sb_seq_item_anyhavereset computation - dmstatus[18]       
  bit sb_seq_item_allresumeack          ; // For sb_seq_item_allresumeack computation - dmstatus[17]        
  bit sb_seq_item_anyresumeack          ; // For sb_seq_item_anyresumeack computation - dmstatus[16]
  bit sb_seq_item_allunavail            ; // For sb_seq_item_allunavail computation - dmstatus[13]
  bit sb_seq_item_anyunavail            ; // For sb_seq_item_anyunavail computation - dmstatus[12]
  bit sb_seq_item_allrunning            ; // For sb_seq_item_allrunning computation - dmstatus[11]
  bit sb_seq_item_anyrunning            ; // For sb_seq_item_anyrunning computation - dmstatus[10]
  bit sb_seq_item_allhalted             ; // For sb_seq_item_allhalted computation - dmstatus[9]
  bit sb_seq_item_anyhalted             ; // For sb_seq_item_anyhalted computation - dmstatus[8]
  bit [3:0] sb_seq_item_version         ; // For sb_seq_item_version computation - dmstatus[3:0]
  bit [3:0] sb_fsm_state                ; // For sb_fsm_state computation

  bit [31:0] sb_seq_item_abstractcs_reg ; // For sb_seq_item_abstractcs_reg computation
  bit [2:0]  sb_seq_item_cmderr         ; // For sb_seq_item_cmderr computation
  bit sb_seq_item_busy                  ; // For sb_seq_item_busy computation
  bit sb_seq_item_transfer_reg          ; // For sb_seq_item_transfer_reg computation
  bit valid                             ; // For valid - intermediate signal for resumeack computation
  bit check = 0                         ; // For check - intermediate signal for JTAG TEST_LOGIC_RESET computation

  // new - constructor
  function new(string name, uvm_component parent);                      
    super.new(name,parent);
  endfunction
 
  // build phase 
  function void build_phase(uvm_phase phase);   
    super.build_phase(phase);
      sb_port_con1 = new("sb_port_con1",this);
      sb_port_con2 = new("sb_port_con2",this);
      sb_seq_item = debug_seq_item::type_id::create("sb_seq_item");
      seq_item1 = debug_seq_item::type_id::create("seq_item1");
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) 
    begin
      `uvm_fatal("build_phase", "No virtual interface specified for this monitor instance")
    end
  endfunction

  /**************************************************************************************************/
  /*                             COMPARE FUNCTION : SCOREBOARD VS RTL                               */
  /**************************************************************************************************/
  function void compare(logic [63:0] sb_data, logic [63:0] rtl_data, string label);
    if(sb_data === rtl_data)
      `uvm_info("SCOREBOARD PASS",$sformatf("signal : %0s, scoreboard : %0h, rtl : %0h", label, sb_data, rtl_data), UVM_MEDIUM)
    else
        `uvm_error("SCOREBOARD FAIL",$sformatf("signal : %0s, scoreboard : %0h, rtl : %0h", label, sb_data, rtl_data))
  endfunction

  /**************************************************************************************************/
  /*                                        WRITE FUNCTION                                          */
  /**************************************************************************************************/
  virtual function void write_con1 (input debug_seq_item seq_item);   
//      `uvm_info("DTM TO DM Scoreboard", $sformatf("Inside write function of DTM to DM"), UVM_LOW)
//  endfunction

    //seq_item.print();
    //sb_seq_item.print();
    if(!seq_item.trstn || !seq_item.presetn) begin               // During reset assert condition (Initial values of various regs)
      sb_seq_item.fsm_state              = 0;                    // Initial value of fsm state = 0 (NORMAL_EXECUTION state)
      sb_seq_item.dmstatus_reg           = 32'h0000ca0;          // Initial value of dmstatus_reg
      sb_seq_item_abstractcs_reg         = 32'h0000004;          // Initial value of abstractcs_reg
      sb_seq_item.debug_reg_address      = 16'h0000;             // Initial value of debug_reg_address
      sb_seq_item.debug_reg_write_data   = 64'h0000000000000000; // Initial value of debug_reg_write_data
      sb_seq_item.debug_reg_read_enable  = 64'h0000000000000000; // Initial value of debug_reg_read_enable
      sb_seq_item.debug_reg_write_enable = 64'h0000000000000000; // Initial value of debug_reg_write_enable
      sb_seq_item.data1_reg              = 32'h0000000;          // Initial value of data1_reg
      sb_seq_item.data0_reg              = 32'h0000000;          // Initial value of data0_reg
      sb_seq_item.debug_mem_write_enable = 64'h0000000000000000; // Initial value of debug_mem_write_enable
      sb_seq_item.debug_mem_write_addr   = 64'h0000000000000000; // Initial value of debug_mem_write_addr
      sb_seq_item.debug_mem_write_data   = 64'h0000000000000000; // Initial value of debug_mem_write_data
      sb_seq_item.debug_mem_read_enable  = 64'h0000000000000000; // Initial value of debug_mem_read_enable
      sb_seq_item.debug_mem_read_addr    = 64'h0000000000000000; // Initial value of debug_mem_read_addr
      sb_seq_item.debug_mem_strobe       = 8'h00;                // Initial value of debug_mem_strobe
    end

    else if(seq_item.trstn && seq_item.presetn) begin           //During reset de-assert condition   

  /************************************************************************************************/
  /*                          COMPUTATION OF DMCONTROL REG SCOREBOARD SIGNALS                     */  
  /************************************************************************************************/
      sb_seq_item.haltreq          = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[31] ? 1'b1 : 1'b0; //dmactive && haltreq
      sb_seq_item.ndmreset         = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[1]  ? 1'b1 : 1'b0; //dmactive && ndmreset
      sb_seq_item.resumereq	       = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[30] ? 1'b1 : 1'b0; //dmactive && resumereq
      sb_seq_item.setresethaltreq  = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[3]  ? 1'b1 : 1'b0; //dmactive && setresethaltreq  
      sb_seq_item.clrresethaltreq  = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[2]  ? 1'b1 : 1'b0; //dmactive && clrresethaltreq
      sb_dmactive                  = seq_item.dmcontrol_reg[0];                                             //transfer - abstract command register
      sb_seq_item_transfer_reg     = seq_item.command_reg[17];                                              //dmactive && haltreq
      sb_seq_item.h_reset          = ((seq_item.dmcontrol_reg[0] && (seq_item.dmcontrol_reg[1] || seq_item.dmcontrol_reg[29])) ? 1'b1 : 1'b0); //dmactive && ndmreset && hartreset
   
  /**************************************************************************************************/
  /*                       COMPARISON OF DMCONTROL REG SCOREBOARD VS RTL SIGNALS                    */
  /**************************************************************************************************/                
//
      compare(.sb_data(sb_seq_item.haltreq), .rtl_data(seq_item.haltreq), .label("DMCONTROL HALT REQ")); // haltreq
      compare(.sb_data(sb_seq_item.ndmreset), .rtl_data(seq_item.ndmreset), .label("DMCONTROL NDMRESET")); // ndmreset
      compare(.sb_data(sb_seq_item.resumereq), .rtl_data(seq_item.resumereq), .label("DMCONTROL RESUME REQ")); // resumereq
      compare(.sb_data(sb_seq_item.setresethaltreq), .rtl_data(seq_item.setresethaltreq), .label("DMCONTROL SETRESETHALT REQ")); // setresethaltreq
      compare(.sb_data(sb_seq_item.clrresethaltreq), .rtl_data(seq_item.clrresethaltreq), .label("DMCONTROL CLEARSETRESETHALT REQ")); // clrresethaltreq
//        
/*********************************************************************************************************/

  /************************************************************************************************/
  /*                COMPUTATION OF DEBUG MODULE FSM NEXT STATE SCOREBOARD SIGNALS                 */
  /************************************************************************************************/
      case(sb_fsm_state)  
      
        NORMAL_EXECUTION  : begin
                              sb_fsm_state = (sb_seq_item.h_reset) ? HART_RESET : (seq_item.ebreak || (sb_seq_item.haltreq || seq_item.step) ? HALTED : NORMAL_EXECUTION);
                            end

        HART_RESET        : begin
                              sb_fsm_state = ((seq_item.resethaltreq || sb_seq_item.haltreq) && !sb_seq_item.h_reset) ? HALTED : ((!seq_item.resethaltreq && !sb_seq_item.h_reset) ? NORMAL_EXECUTION : HART_RESET);
                            end
        
        HALTED            : begin		
							  if(sb_seq_item.h_reset)
							    begin
								  sb_fsm_state = HART_RESET ;
								end
							  else if(sb_seq_item.resumereq && !sb_seq_item.haltreq)
							    begin
								  sb_fsm_state = NORMAL_EXECUTION ;
								end
							  else if(seq_item.command_reg)
							    begin
								  sb_fsm_state = START ;
								end
							  else
							    begin
								  sb_fsm_state = HALTED ;
								end
							  end

        START             : begin
                              if(seq_item.command_reg)
                                begin
                                  sb_fsm_state = START ;
                                end
							  else if(!seq_item.command_reg)
                                begin
							      sb_fsm_state = HALTED ;
                              end

							  if(seq_item.abstractcs_reg[10:8] == 3'b010 || seq_item.abstractcs_reg[10:8] == 3'b011)
							    begin
								  sb_fsm_state = ERROR_WAIT ;
								end
							  else if(seq_item.abstractcs_reg[10:8] == 3'b000)
							    begin
								  if(seq_item.command_reg[17])
								    begin
									  sb_fsm_state = TRANSFER ;
									end
                                  if(!seq_item.command_reg[17])
								    begin
									  sb_fsm_state = DONE ;
									end
								end
							  else 
							    begin
								  sb_fsm_state = START ;
								end
							  end

        TRANSFER          : begin
                              sb_fsm_state = (seq_item.abstractcs_reg[10:8]==3'b000 && !seq_item.command_reg[18]) ? DONE : TRANSFER;                                  
                            end


        DONE              : begin
                              sb_fsm_state = (seq_item.abstractcs_reg[10:8]==3'b000 && !seq_item.exception) ? HALTED : ERROR_WAIT;                                  
                            end

        ERROR_WAIT        : begin
                              sb_fsm_state = (seq_item.abstractcs_reg[10:8]==3'b000) ? HALTED : ERROR_WAIT;                                  
                            end

        default           : begin
                              sb_fsm_state = NORMAL_EXECUTION;
                            end

      endcase 

      sb_seq_item.fsm_state <= sb_fsm_state ;

  /************************************************************************************************/
  /*                COMPARISON OF DEBUG MODULE FSM NEXT STATE SCOREBOARD VS RTL                   */
  /************************************************************************************************/                 
//
      compare(.sb_data(sb_seq_item.fsm_state), .rtl_data(seq_item.fsm_state), .label("FSM"));
//         
/*********************************************************************************************************/

  /************************************************************************************************/
  /*                        COMPUTATION OF DMSTATUS REG SCOREBOARD SIGNALS                        */
  /************************************************************************************************/
      sb_seq_item_allrunning      = (sb_seq_item.fsm_state == NORMAL_EXECUTION &&  !(sb_seq_item.ndmreset)) || !(seq_item.dmcontrol_reg[0]) || !seq_item.presetn ? 1'b1 : 1'b0;  
      sb_seq_item_anyrunning      = (sb_seq_item.fsm_state == NORMAL_EXECUTION &&  !(sb_seq_item.ndmreset)) || !(seq_item.dmcontrol_reg[0]) || !seq_item.presetn ? 1'b1 : 1'b0;  
      
      sb_seq_item_allhavereset    = seq_item.dmcontrol_reg[28] ? 1'b0 : ((sb_seq_item.h_reset || sb_seq_item.ndmreset)  ? 1'b1 : sb_seq_item_allhavereset); 
      sb_seq_item_anyhavereset    = seq_item.dmcontrol_reg[28] ? 1'b0 : ((sb_seq_item.h_reset || sb_seq_item.ndmreset)  ? 1'b1 : sb_seq_item_allhavereset);
    
      sb_seq_item_allhalted       = !seq_item.dmcontrol_reg[0] ? 1'b0 : ((sb_seq_item.fsm_state != NORMAL_EXECUTION  && sb_seq_item.fsm_state != HART_RESET)  ? 1'b1 : 1'b0); //fsm_state = HALTED
      sb_seq_item_anyhalted       = !seq_item.dmcontrol_reg[0] ? 1'b0 : ((sb_seq_item.fsm_state != NORMAL_EXECUTION  && sb_seq_item.fsm_state != HART_RESET)  ? 1'b1 : 1'b0); //fsm_state = HALTED
     
      sb_seq_item_ndmresetpending = seq_item.dmcontrol_reg[0] && seq_item.dmcontrol_reg[1]  ? 1'b1 : 1'b0;

      sb_seq_item_version         = sb_dmactive == 1'b1  ? 4'b0011 : 4'b0000; //version = 11 for dmactive = 1
     
      sb_seq_item_allunavail      = sb_seq_item.fsm_state == HART_RESET  ? 1'b1 : 1'b0; 
      sb_seq_item_anyunavail      = sb_seq_item.fsm_state == HART_RESET  ? 1'b1 : 1'b0; 
       
      //sb_seq_item_anyresumeack computation
      fork
      begin
      if(sb_seq_item.fsm_state == HALTED && sb_seq_item.resumereq) begin
        sb_seq_item_allresumeack <= 1'b1;
        sb_seq_item_anyresumeack <= 1'b1;
        valid <= 1'b0;
      end                    
      else if(sb_seq_item.fsm_state == NORMAL_EXECUTION && !sb_seq_item.resumereq) begin
        valid = 1'b1;
        sb_seq_item_allresumeack = sb_seq_item_allresumeack;
        sb_seq_item_anyresumeack = sb_seq_item_anyresumeack;
      end
      else if(valid && sb_seq_item.resumereq) begin
        sb_seq_item_allresumeack = 1'b0;
        sb_seq_item_anyresumeack = 1'b0;
      end
      else begin
        sb_seq_item_allresumeack = sb_seq_item_allresumeack;
        sb_seq_item_anyresumeack = sb_seq_item_anyresumeack;
      end
      end
      join_none
      
      sb_seq_item.dmstatus_reg  <= {7'b0000000, sb_seq_item_ndmresetpending, 4'b0000, sb_seq_item_allhavereset, sb_seq_item_anyhavereset, sb_seq_item_allresumeack, sb_seq_item_anyresumeack, 2'b00, sb_seq_item_allunavail, sb_seq_item_anyunavail, sb_seq_item_allrunning, sb_seq_item_anyrunning, sb_seq_item_allhalted, sb_seq_item_anyhalted, 4'b1010, sb_seq_item_version};

/*  comparison of dmstatus_reg[17:16] - allresumeack and anyresumeack - PENDING
      if(sb_seq_item.dmstatus_reg[17:16] == seq_item.dmstatus_reg[17:16])
        `uvm_info("SB DMS PASS",$sformatf("sb_seq_item.fsm_state: %0h, seq_item.fsm_state: %0h, valid: %0h, sb_seq_item.resumereq: %0h, seq_item.resumereq: %0h, sb dms: %0h, rtl dms: %0h", sb_seq_item.fsm_state, seq_item.fsm_state, valid, sb_seq_item.resumereq, seq_item.resumereq, sb_seq_item.dmstatus_reg[17:16] , seq_item.dmstatus_reg[17:16] ), UVM_MEDIUM)
      else
        `uvm_error("SB DMS FAIL",$sformatf("sb_seq_item.fsm_state: %0h, seq_item.fsm_state: %0h, valid: %0h, sb_seq_item.resumereq: %0h, seq_item.resumereq: %0h, sb dms: %0h, rtl dms: %0h", sb_seq_item.fsm_state, seq_item.fsm_state, valid, sb_seq_item.resumereq, seq_item.resumereq, sb_seq_item.dmstatus_reg[17:16] , seq_item.dmstatus_reg[17:16]))
*/
  /************************************************************************************************/
  /*                      COMPARISON OF DMSTATUS REG SCOREBOARD VS RTL SIGNALS                    */
  /************************************************************************************************/                 
//
      compare(.sb_data(sb_seq_item.dmstatus_reg[31:18]), .rtl_data(seq_item.dmstatus_reg[31:18]), .label("DMSTATUS"));
      compare(.sb_data(sb_seq_item.dmstatus_reg[15:0]), .rtl_data(seq_item.dmstatus_reg[15:0]), .label("DMSTATUS"));

//         
/*********************************************************************************************************/

  /************************************************************************************************/
  /*                        COMPUTATION OF ABSTRACTCS REG SCOREBOARD SIGNALS                      */
  /************************************************************************************************/     
      sb_seq_item_busy           = (sb_seq_item.fsm_state == START || sb_seq_item.fsm_state == TRANSFER) ? 1'b1 : 1'b0;
      sb_seq_item_abstractcs_reg[12] <= sb_seq_item_busy;
      sb_seq_item_abstractcs_reg[10:8] = seq_item.abstractcs_reg[10:8];

 
/*    //sb abstractcs compared with rtl abstractcs
      if(sb_seq_item_abstractcs_reg == seq_item.abstractcs_reg)
        `uvm_info("SCOREBOARD ABSTRACTCS REG PASS",$sformatf("scoreboard abstractcs_reg: %0b, rtl abstractcs_reg: %0b", sb_seq_item_abstractcs_reg, seq_item.abstractcs_reg), UVM_MEDIUM)
      else
        `uvm_error("SCOREBOARD ABSTRACTCS REG FAIL",$sformatf("scoreboard abstractcs_reg: %0b, rtl abstractcs_reg: %0b", sb_seq_item_abstractcs_reg, seq_item.abstractcs_reg))
*/
  /************************************************************************************************/
  /*                    COMPARISON OF ABSTRACTCS REG SCOREBOARD VS RTL SIGNALS                    */
  /************************************************************************************************/                 
//
      compare(.sb_data(sb_seq_item_abstractcs_reg), .rtl_data(seq_item.abstractcs_reg), .label("ABSTRACTCS"));
//         
/*********************************************************************************************************/
  
  /************************************************************************************************/
  /*            COMPUTATION OF DEBUG_REG_WRITE : ADDRESS, ENABLE & DATA SCOREBOARD SIGNALS        */
  /************************************************************************************************/ 
      `ifdef ZILLA_64_BIT
      //cmdtype=0 && transfer && write && aarsize=3
      if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b011)
        begin
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];        
            sb_seq_item.debug_reg_write_enable <= 1'b1;
            seq_item.data0_reg <= seq_item.data0_reg;
            seq_item.data1_reg <= seq_item.data1_reg;
            seq_item.debug_reg_write_data <= seq_item.debug_reg_write_data;            
            sb_seq_item.debug_reg_write_data <= {seq_item.data1_reg, seq_item.data0_reg};
        end

      //cmdtype=0 && transfer && write && aarsize=2
      else if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
            sb_seq_item.debug_reg_write_enable <= 1'b1;
            seq_item.data0_reg <= seq_item.data0_reg;
            seq_item.data1_reg <= seq_item.data1_reg;
            seq_item.debug_reg_write_data <= seq_item.debug_reg_write_data;   
            sb_seq_item.debug_reg_write_data <= {32'b0, seq_item.data0_reg};            
        end

      //when write, transfer, write enable and read enable are inactive : sb_seq_item.debug_reg_address = 0
      else if((seq_item.command_reg[17]!=1'b1 || seq_item.command_reg[16]!=1'b1) && !sb_seq_item.debug_reg_write_enable && !sb_seq_item.debug_reg_read_enable)
        begin
            sb_seq_item.debug_reg_address <= 16'b0;
        end      
 
      //for all other cases
      else 
        begin
            sb_seq_item.debug_reg_write_enable <= 1'b0;
            seq_item.data0_reg <= seq_item.data0_reg;
            seq_item.data1_reg <= seq_item.data1_reg;
            seq_item.debug_reg_write_data <= seq_item.debug_reg_write_data;
            sb_seq_item.debug_reg_write_data <= 64'h0000000000000000;
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];           
        end
    
      `elsif ZILLA_32_BIT
      //cmdtype=0 && transfer && write && aarsize=2
      if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
            sb_seq_item.debug_reg_write_enable <= 1'b1;
            seq_item.data0_reg <= seq_item.data0_reg;
            seq_item.data1_reg <= seq_item.data1_reg;
            seq_item.debug_reg_write_data <= seq_item.debug_reg_write_data;   
            sb_seq_item.debug_reg_write_data <= {seq_item.data0_reg};
        end

      //when write, transfer, write enable and read enable are inactive : sb_seq_item.debug_reg_address = 0
      else if((seq_item.command_reg[17]!=1'b1 || seq_item.command_reg[16]!=1'b1) && !sb_seq_item.debug_reg_write_enable && !sb_seq_item.debug_reg_read_enable)
        begin
            sb_seq_item.debug_reg_address <= 16'b0;
      end      
      
      //for all other cases
      else 
        begin
            sb_seq_item.debug_reg_write_enable <= 1'b0;
            seq_item.data0_reg <= seq_item.data0_reg;
            seq_item.data1_reg <= seq_item.data1_reg;
            seq_item.debug_reg_write_data <= seq_item.debug_reg_write_data;
            sb_seq_item.debug_reg_write_data <= 32'h0000000000000000;
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
      end

      `endif
  /************************************************************************************************/
  /*                COMPUTATION OF DEBUG_REG_READ : ENABLE & ADDRESS SCOREBOARD SIGNALS           */
  /************************************************************************************************/ 
      `ifdef ZILLA_64_BIT
      //cmdtype=0 && transfer && !write && aarsize=3
      if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b011)
        begin
            sb_seq_item.debug_reg_read_enable <= 1'b1;
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
        end

      //cmdtype=0 && transfer && !write && aarsize=2
      else if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_reg_read_enable <= 1'b1;
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
        end
    
      //for all other cases
      else
        begin
            sb_seq_item.debug_reg_read_enable <= 1'b0;
        end

      `elsif ZILLA_32_BIT
      //cmdtype=0 && transfer && !write && aarsize=2
      if(seq_item.command_reg[31:24]==8'b00000000 && seq_item.command_reg[17]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_reg_read_enable <= 1'b1;
            sb_seq_item.debug_reg_address <= seq_item.command_reg[15:0];
        end
    
      //for all other cases
      else 
        begin
            sb_seq_item.debug_reg_read_enable <= 1'b0;
        end
      `endif

  /************************************************************************************************/
  /*                        COMPARISON OF DEBUG_REG SCOREBOARD VS RTL SIGNALS                     */
  /************************************************************************************************/              
//
      compare(.sb_data(sb_seq_item.debug_reg_write_enable), .rtl_data(seq_item.debug_reg_write_enable), .label("DEBUG_REG_WRITE_ENABLE")); 
      compare(.sb_data(sb_seq_item.debug_reg_read_enable), .rtl_data(seq_item.debug_reg_read_enable), .label("DEBUG_REG_READ_ENABLE"));      
      compare(.sb_data(sb_seq_item.debug_reg_write_data), .rtl_data(seq_item.debug_reg_write_data), .label("DEBUG_REG_WRITE_DATA"));
      compare(.sb_data(sb_seq_item.debug_reg_address), .rtl_data(seq_item.debug_reg_address), .label("DEBUG_REG_ADDRESS"));
//         
  /*********************************************************************************************************/

  /************************************************************************************************/
  /*          COMPUTATION OF DEBUG_MEM_WRITE : ADDRESS, DATA & ENABLE  SCOREBOARD SIGNALS         */
  /************************************************************************************************/    
    `ifdef ZILLA_64_BIT
    //cmdtype=2 && busy && write && aamsize=0
    if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b000)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_write_data <= {56'b0, seq_item.data0_reg[7:0]};
            sb_seq_item.debug_mem_write_enable <= 1'b1;
        end

    //cmdtype=2 && busy && write && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b001)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_write_data <= {48'b0, seq_item.data0_reg[15:0]};
            sb_seq_item.debug_mem_write_enable <= 1'b1;               
        end
    
    //cmdtype=2 && busy && write && aamsize=2
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_write_data <= {32'b0, seq_item.data0_reg};
            sb_seq_item.debug_mem_write_enable <= 1'b1;  
        end

    //cmdtype=2 && busy && write && aamsize=3
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b011)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_write_data <= {seq_item.data1_reg, seq_item.data0_reg};
            sb_seq_item.debug_mem_write_enable <= 1'b1; 
        end

    //cmdtype=2 && busy && (!write_enable || !write)
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && (!sb_seq_item.debug_mem_write_enable || seq_item.command_reg[16]!=1'b1))
        begin
            sb_seq_item.debug_mem_write_addr <= 64'b0;
            sb_seq_item.debug_mem_write_data <= 64'b0;
            sb_seq_item.debug_mem_write_enable <= 1'b0;            
        end
    
    //for all other cases
    else 
        begin
            sb_seq_item.debug_mem_write_addr <= 64'b0;
            sb_seq_item.debug_mem_write_enable <= 1'b0;            
        end
            
    `elsif ZILLA_32_BIT
    //cmdtype=2 && busy && write && aamsize=0
    if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b000)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_write_data <= {24'b0, seq_item.data0_reg[7:0]};
            sb_seq_item.debug_mem_write_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && write && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b001)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_write_data <= {16'b0, seq_item.data0_reg[15:0]};
            sb_seq_item.debug_mem_write_enable <= 1'b1;            
        end
    
    //cmdtype=2 && busy && write && aamsize=2
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[16]==1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            sb_seq_item.debug_mem_write_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_write_data <= {seq_item.data0_reg};
            sb_seq_item.debug_mem_write_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && (!write_enable || !write)
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && (!sb_seq_item.debug_mem_write_enable || seq_item.command_reg[16]!=1'b1))

        begin
            sb_seq_item.debug_mem_write_addr <= 32'b0;
            sb_seq_item.debug_mem_write_data <= 32'b0;
            sb_seq_item.debug_mem_write_enable <= 1'b0;            
        end

    //for all other cases
    else 
        begin
            sb_seq_item.debug_mem_write_addr <= 32'b0;
            sb_seq_item.debug_mem_write_enable <= 1'b0;            
        end
    `endif
  /************************************************************************************************/
  /*                        COMPUTATION OF DEBUG_MEM_STROBE SCOREBOARD SIGNAL                     */
  /************************************************************************************************/ 
    `ifdef ZILLA_64_BIT
    //(cmdtype=2 && aamsize=0) || (cmdtype=0 && dmcontrol_reg[0])
    if((seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b000) || (seq_item.command_reg[31:24]==8'b00000000 && seq_item.dmcontrol_reg[0]))
        begin
            sb_seq_item.debug_mem_strobe <= 8'b00000001;
        end

    //cmdtype=2 && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b001)
        begin         
            sb_seq_item.debug_mem_strobe <= 8'b00000011;
        end
    
    //cmdtype=2 && aamsize=2
    else if(seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b010)
        begin          
            sb_seq_item.debug_mem_strobe <= 8'b00001111;
        end

    //cmdtype=2 && aamsize=3
    else if(seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b011)
        begin         
            sb_seq_item.debug_mem_strobe <= 8'b11111111;
        end
    
    else
        begin
            sb_seq_item.debug_mem_strobe <= 8'b0;
        end
    
    `elsif ZILLA_32_BIT
    //(cmdtype=2 && aamsize=0) || (cmdtype=0 && dmcontrol_reg[0])
    if((seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b000) || (seq_item.command_reg[31:24]==8'b00000000 && seq_item.dmcontrol_reg[0]))
        begin
            sb_seq_item.debug_mem_strobe <= 4'b0001;
        end

    //cmdtype=2 && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b001)
        begin         
            sb_seq_item.debug_mem_strobe <= 4'b0011;
        end
    
    //cmdtype=2 && aamsize=2
    else if(seq_item.command_reg[31:24]==8'b00000010 && seq_item.command_reg[22:20] == 3'b010)
        begin          
            sb_seq_item.debug_mem_strobe <= 4'b1111;
        end

    else
        begin
            sb_seq_item.debug_mem_strobe <= 4'b0000;
        end

    `endif

  /************************************************************************************************/
  /*                COMPUTATION OF DEBUG_MEM_READ : ADDRESS & ENABLE  SCOREBOARD SIGNALS          */
  /************************************************************************************************/     
    `ifdef ZILLA_64_BIT
    //cmdtype=2 && busy && aampostincrement && !write && aamsize=3
    if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b011)
        begin
            seq_item.data3_reg <= seq_item.data3_reg;
            seq_item.data2_reg <= seq_item.data2_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;
        end

    //cmdtype=2 && busy && aampostincrement && !write && aamsize=2
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            seq_item.data3_reg <= seq_item.data3_reg;
            seq_item.data2_reg <= seq_item.data2_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end
    
    //cmdtype=2 && busy && aampostincrement && !write && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b001)
        begin
            seq_item.data3_reg <= seq_item.data3_reg;
            seq_item.data2_reg <= seq_item.data2_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && aampostincrement && !write && aamsize=0
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b000)
        begin
            seq_item.data3_reg <= seq_item.data3_reg;
            seq_item.data2_reg <= seq_item.data2_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && !aampostincrement && !write && aamsize=0 to 3
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]!=1'b1 && seq_item.command_reg[16]!=1'b1 && ((seq_item.command_reg[22:20] >= 3'b000) && (seq_item.command_reg[22:20] <= 3'b011) ))
        begin
            seq_item.data3_reg <= seq_item.data3_reg;
            seq_item.data2_reg <= seq_item.data2_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data3_reg, seq_item.data2_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end


    //for all other cases - !(cmdtype=2 && busy && !write && aamsize=3)
    else
      begin
           sb_seq_item.debug_mem_read_addr <= 64'b0;
           sb_seq_item.debug_mem_read_enable <= 1'b0;
      end


    `elsif ZILLA_32_BIT
    //cmdtype=2 && busy && aampostincrement && !write && aamsize=2
    if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b010)
        begin
            seq_item.data1_reg <= seq_item.data1_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end
    
    //cmdtype=2 && busy && aampostincrement && !write && aamsize=1
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b001)
        begin
            seq_item.data1_reg <= seq_item.data1_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && aampostincrement && !write && aamsize=0
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]==1'b1 && seq_item.command_reg[16]!=1'b1 && seq_item.command_reg[22:20] == 3'b000)
        begin
            seq_item.data1_reg <= seq_item.data1_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end

    //cmdtype=2 && busy && !aampostincrement && !write && aamsize=0 to 3
    else if(seq_item.command_reg[31:24]==8'b00000010 && sb_seq_item_busy && seq_item.command_reg[19]!=1'b1 && seq_item.command_reg[16]!=1'b1 && ((seq_item.command_reg[22:20] >= 3'b000) && (seq_item.command_reg[22:20] <= 3'b011) ))
        begin
            seq_item.data1_reg <= seq_item.data1_reg;
            sb_seq_item.debug_mem_read_addr <= {seq_item.data1_reg};
            sb_seq_item.debug_mem_read_enable <= 1'b1;            
        end


    //for all other cases - !(cmdtype=2 && busy && !write && aamsize=2)
    else
      begin
           sb_seq_item.debug_mem_read_addr <= 32'b0;
           sb_seq_item.debug_mem_read_enable <= 1'b0;
      end
        
    `endif

  /************************************************************************************************/
  /*                        COMPARISON OF DEBUG_MEM SCOREBOARD VS RTL SIGNALS                     */
  /************************************************************************************************/                 
//
      compare(.sb_data(sb_seq_item.debug_mem_write_enable), .rtl_data(seq_item.debug_mem_write_enable), .label("DEBUG_MEM_WRITE_ENABLE"));
      compare(.sb_data(sb_seq_item.debug_mem_write_addr), .rtl_data(seq_item.debug_mem_write_addr), .label("DEBUG_MEM_WRITE_ADDRESS"));
      compare(.sb_data(sb_seq_item.debug_mem_write_data), .rtl_data(seq_item.debug_mem_write_data), .label("DEBUG_MEM_WRITE_DATA"));
      compare(.sb_data(sb_seq_item.debug_mem_strobe), .rtl_data(seq_item.debug_mem_strobe), .label("DEBUG_MEM_STROBE"));
      compare(.sb_data(sb_seq_item.debug_mem_read_enable), .rtl_data(seq_item.debug_mem_read_enable), .label("DEBUG_MEM_READ_ENABLE"));
      compare(.sb_data(sb_seq_item.debug_mem_read_addr), .rtl_data(seq_item.debug_mem_read_addr), .label("DEBUG_MEM_READ_ADDRESS"));
//         
/*********************************************************************************************************/

  end
 endfunction 
//
//----------------------------------------JTAG TAP STATES-----------------------------------------------------//
//    //JTAG tap states

    //write function for JTAG TAP states
    virtual function void write_con2 (input debug_seq_item seq_item1);
//      `uvm_info("DTM TO DM Scoreboard", $sformatf("Inside write function of JTAG TAP STATES"), UVM_LOW)
//  endfunction

//
        if(!seq_item1.trstn)
        begin
            TAP_state      <= TEST_LOGIC_RESET; // Reset (trstn) assert condition
            next_TAP_state <= 4'd0;
            //IDCODE_reg<=32'h1495_11c3;            
        end

            
        else                                    // Reset (trstn) de-assert condition
        begin
        case(TAP_state)                         // JTAG Test Access Port (TAP) FSM Computation
          
             TEST_LOGIC_RESET : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = TEST_LOGIC_RESET;
                                   else
                                      next_TAP_state = RUN_TEST_IDLE;
                                end               
      
            
                RUN_TEST_IDLE : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = SELECT_DR_SCAN; 
                                   else
                                      next_TAP_state = RUN_TEST_IDLE;
                                end

                               	
               SELECT_DR_SCAN : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = SELECT_IR_SCAN;
                                   else
                                      next_TAP_state = CAPTURE_DR;
                                end

               SELECT_IR_SCAN : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = TEST_LOGIC_RESET;
                                   else
                                      next_TAP_state = CAPTURE_IR;
                                end          
            
                   CAPTURE_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT1_DR;
                                   else
                                      next_TAP_state = SHIFT_DR;
                                end  
                                
                     SHIFT_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT1_DR;
                                   else
                                      next_TAP_state = SHIFT_DR;
                                end  

                     EXIT1_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = UPDATE_DR;
                                   else
                                      next_TAP_state = PAUSE_DR;
                                end  

                     PAUSE_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT2_DR;
                                   else
                                      next_TAP_state = PAUSE_DR;
                                end 

                     EXIT2_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = UPDATE_DR;
                                   else
                                      next_TAP_state = SHIFT_DR;
                                end 

                    UPDATE_DR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = SELECT_DR_SCAN;
                                   else
                                      next_TAP_state = RUN_TEST_IDLE;
                                end 

                   CAPTURE_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT1_IR;
                                   else
                                      next_TAP_state = SHIFT_IR;
                                end  
                                
                     SHIFT_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT1_IR;
                                   else
                                      next_TAP_state = SHIFT_IR;
                                end  

                     EXIT1_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = UPDATE_IR;
                                   else
                                      next_TAP_state = PAUSE_IR;
                                end  

                     PAUSE_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = EXIT2_IR;
                                   else
                                      next_TAP_state = PAUSE_IR;
                                end 

                     EXIT2_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = UPDATE_IR;
                                   else
                                      next_TAP_state = SHIFT_IR;
                                end 

                    UPDATE_IR : begin
                                   if(seq_item1.tms)
                                      next_TAP_state = SELECT_DR_SCAN;
                                   else
                                      next_TAP_state = RUN_TEST_IDLE;
                                end 

                      default : next_TAP_state = TEST_LOGIC_RESET;

        endcase        
        
            TAP_state = next_TAP_state;
        
        end

    //COMPUTATION OF SCOREBOARD SIGNAL : RESET

    if(!seq_item1.trstn)
        begin
            sb_seq_item.Reset = 1;
            check = 1;
        end

    else if((seq_item1.tms && check && (TAP_state == TEST_LOGIC_RESET || TAP_state == RUN_TEST_IDLE || TAP_state == SELECT_IR_SCAN)))
           sb_seq_item.Reset = 1;
    else if(!seq_item1.tms && check)
        begin
            sb_seq_item.Reset = 1;
            check = 0;
        end
    else
        begin
            sb_seq_item.Reset = 0;        
        end
   

    //COMPUTATION OF SCOREBOARD SIGNAL : SELECT_DR_SCAN

    if(TAP_state == SELECT_DR_SCAN)
        sb_seq_item.dr_scan    <= 1;
    else
        sb_seq_item.dr_scan    <= 0;
   
    //COMPUTATION OF SCOREBOARD SIGNAL : CAPTURE_DR

    if(TAP_state == CAPTURE_DR)
        sb_seq_item.Capture_DR <= 1;
    else
        sb_seq_item.Capture_DR <= 0;

    //COMPUTATION OF SCOREBOARD SIGNAL : SHIFT_DR

    if(TAP_state == SHIFT_DR)
        sb_seq_item.Shift_DR   <= 1;
    else
        sb_seq_item.Shift_DR   <= 0;

    //COMPUTATION OF SCOREBOARD SIGNAL : UPDATE_DR

    if(TAP_state == UPDATE_DR)
        sb_seq_item.Update_DR  <= 1;
    else
        sb_seq_item.Update_DR  <= 0;

    //COMPUTATION OF SCOREBOARD SIGNAL : CAPTURE_IR

    if(TAP_state == CAPTURE_IR)
        sb_seq_item.Capture_IR <= 1;
    else
        sb_seq_item.Capture_IR <= 0;

    //COMPUTATION OF SCOREBOARD SIGNAL : SHIFT_IR

    if(TAP_state == SHIFT_IR)
        sb_seq_item.Shift_IR   <= 1;
    else
        sb_seq_item.Shift_IR   <= 0;

    //COMPUTATION OF SCOREBOARD SIGNAL : UPDATE_IR
    
    if(TAP_state == UPDATE_IR)
        sb_seq_item.Update_IR  <= 1;
    else
        sb_seq_item.Update_IR  <= 0;
//  
  /************************************************************************************************/
  /*                        COMPARISON OF JTAG TAP STATES SCOREBOARD VS RTL SIGNALS               */
  /************************************************************************************************/              
//
      compare(.sb_data(sb_seq_item.Reset), .rtl_data(seq_item1.Reset), .label("TEST_LOGIC_RESET"));
      compare(.sb_data(sb_seq_item.dr_scan), .rtl_data(seq_item1.dr_scan), .label("SELECT_DR_SCAN"));
      compare(.sb_data(sb_seq_item.Capture_DR), .rtl_data(seq_item1.Capture_DR), .label("CAPTURE_DR"));
      compare(.sb_data(sb_seq_item.Shift_DR), .rtl_data(seq_item1.Shift_DR), .label("SHIFT_DR"));
      compare(.sb_data(sb_seq_item.Update_DR), .rtl_data(seq_item1.Update_DR), .label("UPDATE_DR"));
      compare(.sb_data(sb_seq_item.Capture_IR), .rtl_data(seq_item1.Capture_IR), .label("CAPTURE_IR"));
      compare(.sb_data(sb_seq_item.Shift_IR), .rtl_data(seq_item1.Shift_IR), .label("SHIFT_IR"));
      compare(.sb_data(sb_seq_item.Update_IR), .rtl_data(seq_item1.Update_IR), .label("UPDATE_IR"));
        
/*********************************************************************************************************/

  endfunction

endclass 
//--------------------------------------------------------------------------------------------------------------//
 
