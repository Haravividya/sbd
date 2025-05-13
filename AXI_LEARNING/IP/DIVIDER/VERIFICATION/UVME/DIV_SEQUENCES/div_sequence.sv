class div_sequence extends uvm_sequence#(div_seq_item);

  `uvm_object_utils(div_sequence)

  div_seq_item seq_item;
  virtual div_interface intf ;
  
  
  int scenario;
  rand logic [63:0] num1 = 0 ;
  rand logic [63:0] num2 = 0 ;
  rand logic [7:0]  num3 = 0 ;
  rand logic [7:0]  num4 = 0 ;
 
  
   function new(string name = "div");
    super.new(name);
  endfunction

/* task valid_i();
  seq_item.valid_i = 1 ;
  forever @(scenario)
  begin
  repeat(2)  @(posedge intf.div_clock);
   seq_item.valid_i = 0 ;
  end
 
 endtask*/



 virtual task body();
  
    
  if(scenario == 1) begin
           repeat(10) begin
            num1 = {$random(),$urandom()};
            num2 = {$random(),$urandom()};
                       
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIV ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
     end
   end
     if(scenario == 2) begin
       
       repeat(10) begin           
            num1 = {$urandom(),$urandom()};
            num2 = {$urandom(),$urandom()};
                     
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIVU ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
                
            
       end
   end
     if(scenario == 3) begin
          repeat(10) begin
            num1 = {$random(),$urandom()};
            num2 = {$urandom(),$urandom()};
            `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIV ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
           end
   end
   if(scenario == 4) begin
          repeat(10) begin           
            num1 = {$random(),$urandom()};
            num2 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIV ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
          end
   end 
   if(scenario == 5) begin
          repeat(10) begin
            num1 = {$random(),$urandom()};
            num2 = {$random(),$urandom()};
                       
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REM ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
     end
   end
     if(scenario == 6) begin
       
       repeat(1) begin           
            num1 = {$urandom(),$urandom()};
            num2 = {$urandom(),$urandom()};
                     
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REMU ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
       end
   end
     if(scenario == 7) begin
          repeat(10) begin
            num1 = {$random(),$urandom()};
            num2 = {$urandom(),$urandom()};
            `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REM ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
           end
   end
   if(scenario == 8) begin
          repeat(10) begin           
            num1 = {$random(),$urandom()};
            num2 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REMU ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == num2 ;} );
          end
   end
   if(scenario == 9) begin
          repeat(1) begin           
            num1 = {$random(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIV ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == 0 ;} );
          end
   end
   if(scenario == 10) begin
          repeat(1) begin           
            num1 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIVU ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == 0 ;} );
          end
   end
   if(scenario == 11) begin
          repeat(1) begin           
            num1 = {$random(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REM ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == 0 ;} );
          end
   end
   if(scenario == 12) begin
          repeat(1) begin           
            num1 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REMU ; seq_item.operand_dividend == num1 ; seq_item.operand_divisor == 0 ;} );
          end
   end
   if(scenario == 13) begin
          repeat(1) begin           
            num2 = {$random(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIV ; seq_item.operand_dividend == 0 ; seq_item.operand_divisor == num2 ;} );
          end
   end
   if(scenario == 14) begin
          repeat(10) begin           
            num2 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_DIVU ; seq_item.operand_dividend == 0 ; seq_item.operand_divisor == num2 ;} );
          end
   end
   if(scenario == 15) begin
          repeat(1) begin           
            num2 = {$random(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REM ; seq_item.operand_dividend == 0 ; seq_item.operand_divisor == num2 ;} );
          end
   end
   if(scenario == 16) begin
          repeat(1) begin           
            num2 = {$urandom(),$urandom()};
             `uvm_do_with(seq_item,{seq_item.opcode  == `INST_REMU ; seq_item.operand_dividend == 0 ; seq_item.operand_divisor == num2 ;} );
          end
   end
  


   

   



endtask

endclass 

