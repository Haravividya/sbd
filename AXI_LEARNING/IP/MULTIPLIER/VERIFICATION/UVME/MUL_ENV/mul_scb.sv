class mul_scb extends uvm_scoreboard;

  `uvm_component_utils(mul_scb)

  uvm_analysis_imp#(mul_seq_item,mul_scb) analysis_imp_scb;

  mul_seq_item seq_item;
  
  logic sb_reset;
  logic [`DATA_WIDTH - 1 : 0] sb_oper1;
  logic [`DATA_WIDTH - 1 : 0] sb_oper2;
  logic [(`DATA_WIDTH * 2) - 1 : 0] sb_product;

  
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


function void product_checker();
    if(sb_reset == 1'b1) begin
        sb_product  = 0 ;
    end
    else
    begin
        sb_product = sb_oper1 * sb_oper2;
    end

endfunction 

function void write(input mul_seq_item seq_item);
    sb_oper1 = seq_item.oper1 ;
    sb_oper2 = seq_item.oper2 ;
    sb_reset = seq_item.mul_reset ;
    product_checker() ; 
    if(seq_item.mul_reset)
        begin
            if(seq_item.result != 0)
                `uvm_error(get_type_name() , "SB:FAIL\t result !=0 For Reset");
        end
    else 
        begin
            if(seq_item.result !=  sb_product)begin
                `uvm_error(get_type_name() , $sformatf ("SB:FAIL\t RTL::Result:%0d != SB::sb_oper1 :%0d \n sb_oper2 = %0d , sb_result = %0d" , seq_item.result , sb_oper1 , sb_oper2 , sb_product)) ; 
                seq_item.print() ; 
            end
       end

endfunction 


endclass
