/***********************************************************

File name   : jtag_scoreboard.sv
Description : 
. 

***********************************************************/

class jtag_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(jtag_scoreboard)
	 
  jtag_seq_item jtag_item_queue[$];
  jtag_seq_item seq_item, sb_seq_item;
  int current_queue_size=0;
  int queue_size=0;
  int shift_IR_count;
  int shift_DR_count;
  uvm_analysis_imp #(jtag_seq_item,jtag_scoreboard) sb_analysis_imp;

  // parameter declaration of TAP Controller States
  localparam TEST_LOGIC_RESET = 4'd0 ; 
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
	
  reg [3:0] TAP_state;
  reg Instruction_reg[4];
  reg BYPASS_reg = 0;
  reg [31:0] IDCODE_reg;
  reg [31:0] USERCODE_reg;
  reg [8:0] USERDATA_reg;
  reg temp_instr_reg[4];
  reg temp_BYPASS_reg;

  

  function new(string name, uvm_component parent);                      
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);                             //build phase
    sb_analysis_imp = new("sb_analysis_imp",this);	
    sb_seq_item = jtag_seq_item::type_id::create("sb_seq_item", this);     

  endfunction

  
  virtual function void write (input jtag_seq_item seq_item);
  begin
    `uvm_info("Scoreboard", $sformatf("Inside write function"), UVM_LOW)
   
     
      $display("Inside scoreboard");
     
        $display("got the seq_item");
       // seq_item = jtag_seq_item::type_id::create("seq_item", this);
              
        
        if(!(seq_item.TRST))
		begin
		  TAP_state = TEST_LOGIC_RESET;
          Instruction_reg = {0,1,0,0};
          BYPASS_reg = 0;
          IDCODE_reg = 32'h1495_11c3;
          USERCODE_reg = 32'h0;
          USERDATA_reg = 8'h0;
          shift_IR_count = 0;
          shift_DR_count = 0;
          sb_seq_item.TDO = 0;
          sb_seq_item.user_data_out = 0;
		end
		else
		begin
		  case(TAP_state)
		    TEST_LOGIC_RESET : TAP_state = seq_item.TMS ? TEST_LOGIC_RESET : RUN_TEST_IDLE; //Reset State						
		    RUN_TEST_IDLE    : TAP_state = seq_item.TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE; //IDLE State
						
			// Data Register Path 
			SELECT_DR_SCAN   : TAP_state = seq_item.TMS ? SELECT_IR_SCAN   : CAPTURE_DR   ; //Selects DR Path						
			CAPTURE_DR       : TAP_state = seq_item.TMS ? EXIT1_DR         : SHIFT_DR     ; //DR Capture State						
			SHIFT_DR         : TAP_state = seq_item.TMS ? EXIT1_DR         : SHIFT_DR     ; //Shift State for DR						
			EXIT1_DR         : TAP_state = seq_item.TMS ? UPDATE_DR        : PAUSE_DR     ; //Exit 1 State for DR						
			PAUSE_DR         : TAP_state = seq_item.TMS ? EXIT2_DR         : PAUSE_DR     ; //Pause State for DR						
			EXIT2_DR         : TAP_state = seq_item.TMS ? UPDATE_DR        : SHIFT_DR     ; //Exit 2 State for DR						
			UPDATE_DR        : TAP_state = seq_item.TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE; //Update Sttae for DR
						
			// Instruction Register path
			SELECT_IR_SCAN   : TAP_state = seq_item.TMS ? TEST_LOGIC_RESET : CAPTURE_IR   ; //Selects IR Path						
    		CAPTURE_IR       : TAP_state = seq_item.TMS ? EXIT1_IR         : SHIFT_IR     ; //IR Capture State						
			SHIFT_IR         : TAP_state = seq_item.TMS ? EXIT1_IR         : SHIFT_IR     ; //Shift State for IR						
	    	EXIT1_IR         : TAP_state = seq_item.TMS ? UPDATE_IR        : PAUSE_IR     ; //Exit 1 State for IR						
			PAUSE_IR         : TAP_state = seq_item.TMS ? EXIT2_IR         : PAUSE_IR     ; //Pause State for IR						
			EXIT2_IR         : TAP_state = seq_item.TMS ? UPDATE_IR        : SHIFT_IR     ; //Exit 2 State for IR						
			UPDATE_IR        : TAP_state = seq_item.TMS ? SELECT_DR_SCAN   : RUN_TEST_IDLE; //Update Sttae for IR
					
			default          : TAP_state <= TEST_LOGIC_RESET                      ; //Default State
		  endcase
          $display("Scoreboard TAP state: %d",TAP_state);
		end

        if (TAP_state == CAPTURE_IR)
        begin
          Instruction_reg={1,0,0,0};
        end


        if (TAP_state == SHIFT_IR)
        begin
          
          $display("Scoreboard Shift_IR TAP state: %d",TAP_state);
          if(shift_IR_count > 0)
          begin
            sb_seq_item.TDO = Instruction_reg[shift_IR_count - 1];
            Instruction_reg[shift_IR_count - 1] = temp_instr_reg[shift_IR_count - 1];
          end
          temp_instr_reg[shift_IR_count] = seq_item.TDI;
          shift_IR_count++;
        end
        
        if (TAP_state == EXIT1_IR)
        begin
          sb_seq_item.TDO = Instruction_reg[shift_IR_count - 1];
          Instruction_reg[shift_IR_count - 1] = temp_instr_reg[shift_IR_count - 1];
        end

        if (TAP_state == UPDATE_IR)
        begin
          $display("Instruction_reg = %b,%b,%b,%b",Instruction_reg[0],Instruction_reg[1],Instruction_reg[2],Instruction_reg[3]);
          shift_IR_count = 0;
        end


        if(TAP_state == SHIFT_DR)
        begin
          $display("Scoreboard SHIFT_DR TAP state: %d",TAP_state,);

          //BYPASS instruction
          if ((Instruction_reg[0] == 1) && (Instruction_reg[1] == 1) && (Instruction_reg[2] == 1) && (Instruction_reg[3] == 1))
          begin
            if (shift_DR_count == 0) BYPASS_reg=0;
            $display("Shift_DR-BYPASS instruction");
            if (shift_DR_count > 0)
            begin
              sb_seq_item.TDO = BYPASS_reg;
              BYPASS_reg = temp_BYPASS_reg;
            end
            temp_BYPASS_reg = seq_item.TDI;
            shift_DR_count++;
            $display("BYPASS_reg = %b, temp_BYPASS_reg = %b",BYPASS_reg, temp_BYPASS_reg);
          end

          //IDCODE instruction
          else if ((Instruction_reg[0] == 0) && (Instruction_reg[1] == 1) && (Instruction_reg[2] == 0) && (Instruction_reg[3] == 0))
          begin
            $display("Shift_DR-IDCODE instruction");
            sb_seq_item.TDO = IDCODE_reg[shift_DR_count];
            shift_DR_count++;
          end

          //USERCODE instruction
          else if ((Instruction_reg[0] == 0) && (Instruction_reg[1] == 1) && (Instruction_reg[2] == 1) && (Instruction_reg[3] == 0))
          begin
            $display("Shift_DR-USERCODE instruction");
            sb_seq_item.TDO = USERCODE_reg[shift_DR_count];
            shift_DR_count++;
          end

          //USERDATA instruction
          else if ((Instruction_reg[0] == 0) && (Instruction_reg[1] == 0) && (Instruction_reg[2] == 0) && (Instruction_reg[3] == 1))
          begin
            $display("Shift_DR-USERDATA instruction");
            if(shift_DR_count == 0)
            begin
              USERDATA_reg = seq_item.user_data_in;
              shift_DR_count++;
            end
            else
              sb_seq_item.user_data_out = USERDATA_reg;
          end
        end

        if (TAP_state == EXIT1_IR)
        begin
          if ((Instruction_reg[0] == 1) && (Instruction_reg[1] == 1) && (Instruction_reg[2] == 1) && (Instruction_reg[3] == 1))
          begin
            sb_seq_item.TDO = BYPASS_reg;
            BYPASS_reg = temp_BYPASS_reg;
          end
        end

        if (TAP_state == UPDATE_DR)
        begin
          shift_DR_count = 0;
        end
        
        //SCOREBOARD comparision
        if ((Instruction_reg[0] == 0) && (Instruction_reg[1] == 0) && (Instruction_reg[2] == 0) && (Instruction_reg[3] == 1))
        begin
          if(seq_item.user_data_out == sb_seq_item.user_data_out)
            `uvm_info("scoreboard", $sformatf("user data out MATCHED"),UVM_LOW)
          else
            `uvm_error("SCOREBOARD","user data out NOT MATCHED")
        end
        else
        begin
          if (seq_item.TDO == sb_seq_item.TDO)
            `uvm_info("scoreboard", $sformatf("TDO output MATCHED"),UVM_LOW)
          else
            `uvm_error("SCOEBOARD", "TDO output NOT MATCHED")
        end
        $display("exiting scoreboard");
      
    
     

     seq_item.print();
     sb_seq_item.print();
    end 

  endfunction 
  
 /* task run_phase(uvm_phase phase);                                        //Run phase
  begin  
    forever
     endtask*/

  

endclass :jtag_scoreboard



