class div_scb extends uvm_scoreboard;

  `uvm_component_utils(div_scb)

  uvm_analysis_imp#(div_seq_item,div_scb) analysis_imp_scb;

  div_seq_item seq_item;
  virtual div_interface intf;
  
  logic sb_reset;
  logic sb_opcode ;
  logic sb_valid_i ;
  logic [63 : 0] sb_operand_dividend;
  logic [63 : 0] sb_operand_divisor;
  logic [63 : 0] sb_result;
  logic sb_valid_o ;
  

  
  //Constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  //Build phase 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_imp_scb = new("analysis_imp_scb",this);

  endfunction

 virtual task run_phase(uvm_phase phase);

 endtask


function void result_checker();
    if(sb_reset == 1'b1) begin
        sb_result  = 0 ;
    end
    else if ((sb_opcode == `INST_DIVU) || (sb_opcode ==`INST_DIV) )
    begin
        
        sb_result = sb_operand_dividend / sb_operand_divisor;
        
    end
    
    else if ((sb_opcode == `INST_REMU) || (sb_opcode ==`INST_REM) )
        begin
        sb_result = sb_operand_dividend % sb_operand_divisor ;
        end

endfunction 

function void write(input div_seq_item seq_item);
    sb_opcode = seq_item.opcode;
    sb_valid_i = seq_item.valid_i ;
    sb_operand_dividend = seq_item.operand_dividend ;
    sb_operand_divisor = seq_item.operand_divisor ;

    sb_reset = seq_item.div_reset ;
    result_checker() ; 
    if(seq_item.div_reset)
        begin
            if(seq_item.result != 0)
                `uvm_error(get_type_name() , "SB:FAIL\t result !=0 For Reset");
        end
    else 
        begin
            if(seq_item.result !=  sb_result)begin
                `uvm_error(get_type_name() , $sformatf ("SB:FAIL\t RTL::Result:%0d != SB:: Dividend :%0d \n Divisor = %0d , sb_result = %0d" , seq_item.result , sb_operand_dividend , sb_operand_divisor , sb_result)) ; 
                seq_item.print() ; 
            end
       end

endfunction 


endclass

