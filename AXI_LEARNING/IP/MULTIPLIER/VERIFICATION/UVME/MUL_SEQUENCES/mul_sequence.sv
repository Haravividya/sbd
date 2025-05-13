class mul_sequence extends uvm_sequence#(mul_seq_item);

  `uvm_object_utils(mul_sequence)

  mul_seq_item seq_item;
  virtual mul_interface intf ;
  
  
  int scenario;
  logic [63:0] num1 = 0 ;
  logic [63:0] num2 = 0 ;

  
   function new(string name = "mul");
    super.new(name);
  endfunction

 virtual task body();
   
     if(scenario == 0) begin
       repeat(100) begin
        num1 = {$random(),$urandom()};
        num2 = {$random(),$urandom()};

        `uvm_do_with(seq_item,{seq_item.oper1 == num1 ; seq_item.oper2 == num2 ; } );
       end
     end
     if(scenario == 1) begin
           repeat(10) begin
                  `uvm_do(seq_item); 
            end
     end
     if(scenario == 2) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3 ; seq_item.oper2== 'h3 ; } );
     end
     if(scenario == 3) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7 ; seq_item.oper2== 'h7 ; } );
     end
     if(scenario == 4) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hF ; seq_item.oper2== 'hF ; } );
     end
     if(scenario == 5) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1F ; seq_item.oper2== 'h1F ; } );
     end
     if(scenario == 6) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3F ; seq_item.oper2== 'h3F ; } );
     end
     if(scenario == 7) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7F ; seq_item.oper2== 'h7F ; } );
     end
     if(scenario == 8) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFF ; seq_item.oper2== 'hFF ; } );
     end
     if(scenario == 9) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FF ; seq_item.oper2== 'h1FF ; } );
     end
     if(scenario == 10) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FF ; seq_item.oper2== 'h3FF ; } );
     end
     if(scenario == 11) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FF ; seq_item.oper2== 'h7FF ; } );
     end
     if(scenario == 12) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFF ; seq_item.oper2== 'hFFF ; } );
     end
     if(scenario == 13) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FFF ; seq_item.oper2== 'h1FFF ; } );
     end
     if(scenario == 14) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FFF ; seq_item.oper2== 'h3FFF ; } );
     end
     if(scenario == 15) begin
                      
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FFF ; seq_item.oper2== 'h7FFF ; } );
     end
     if(scenario == 16) begin
        
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF ; seq_item.oper2== 'hFFFF ; } );
     end
     if(scenario == 17) begin
     
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1_FFFF ; seq_item.oper2== 'h1_FFFF ; } );
     end
     if(scenario == 18) begin
        
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3_FFFF ; seq_item.oper2== 'h3_FFFF ; } );
     end
     if(scenario == 19) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7_FFFF ; seq_item.oper2== 'h7_FFFF ; } );
     end
     if(scenario == 20) begin
           
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hF_FFFF ; seq_item.oper2== 'hF_FFFF ; } );
     end
     if(scenario == 21) begin
            
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1F_FFFF ; seq_item.oper2== 'h1F_FFFF ; } );
     end
     if(scenario == 22) begin
          
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3F_FFFF ; seq_item.oper2== 'h3F_FFFF ; } );
     end
     if(scenario == 23) begin
           
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7F_FFFF ; seq_item.oper2== 'h7F_FFFF ; } );
     end
     if(scenario == 24) begin

                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFF_FFFF ; seq_item.oper2== 'hFF_FFFF ; } );
     end
     if(scenario == 25) begin
              
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FF_FFFF ; seq_item.oper2== 'h1FF_FFFF ; } );
     end
     if(scenario == 26) begin
          
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FF_FFFF ; seq_item.oper2== 'h3FF_FFFF ; } );
     end
     if(scenario == 27) begin
             
                `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FF_FFFF ; seq_item.oper2== 'h7FF_FFFF ; } );
     end
     if(scenario == 28) begin
        
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFF_FFFF ; seq_item.oper2== 'hFFF_FFFF ; } );
     end
     if(scenario == 29) begin

                `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FFF_FFFF ; seq_item.oper2== 'h1FFF_FFFF ; } );
     end
     if(scenario == 30) begin
           
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FFF_FFFF ; seq_item.oper2== 'h3FFF_FFFF ; } );
     end
     if(scenario == 31) begin
          
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FFF_FFFF ; seq_item.oper2== 'h7FFF_FFFF ; } );
     end
     if(scenario == 32 ) begin
              
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF_FFFF ; seq_item.oper2== 'hFFFF_FFFF ; } );
     end
     if(scenario == 33 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1_FFFF_FFFF ; seq_item.oper2== 'h1_FFFF_FFFF ; } );
      end
      if(scenario == 34 ) begin
                    
                `uvm_do_with(seq_item,{seq_item.oper1 == 'h3_FFFF_FFFF ; seq_item.oper2== 'h3_FFFF_FFFF ; } );
      end
      if(scenario == 35 ) begin
                   
                `uvm_do_with(seq_item,{seq_item.oper1 == 'h7_FFFF_FFFF ; seq_item.oper2== 'h7_FFFF_FFFF ; } );
      end
      if(scenario == 36 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hF_FFFF_FFFF ; seq_item.oper2== 'hF_FFFF_FFFF ; } );
      end
      if(scenario == 37 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1F_FFFF_FFFF ; seq_item.oper2== 'h1F_FFFF_FFFF ; } );
      end
      if(scenario == 38 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3F_FFFF_FFFF ; seq_item.oper2== 'h3F_FFFF_FFFF ; } );
      end
      if(scenario == 39 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7F_FFFF_FFFF ; seq_item.oper2== 'h7F_FFFF_FFFF ; } );
      end       
      if(scenario == 40 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFF_FFFF_FFFF ; seq_item.oper2== 'hFF_FFFF_FFFF ; } );
      end       
      if(scenario == 41 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FF_FFFF_FFFF ; seq_item.oper2== 'h1FF_FFFF_FFFF ; } );
      end
      if(scenario == 42 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FF_FFFF_FFFF ; seq_item.oper2== 'h3FF_FFFF_FFFF ; } );
      end
      if(scenario == 43 ) begin

                    `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FF_FFFF_FFFF ; seq_item.oper2== 'h7FF_FFFF_FFFF ; } );
      end
      if(scenario == 44 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFF_FFFF_FFFF ; seq_item.oper2== 'hFFF_FFFF_FFFF ; } );
      end
      if(scenario == 45 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FFF_FFFF_FFFF ; seq_item.oper2== 'h1FFF_FFFF_FFFF ; } );
      end
      if(scenario == 46 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FFF_FFFF_FFFF ; seq_item.oper2== 'h3FFF_FFFF_FFFF ; } );

      end
      if(scenario == 47 ) begin
                
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FFF_FFFF_FFFF ; seq_item.oper2== 'h7FFF_FFFF_FFFF ; } );
      end
      if(scenario == 48 ) begin
                  
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF_FFFF_FFFF ; seq_item.oper2== 'hFFFF_FFFF_FFFF ; } );
      end
      if(scenario == 49 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1_FFFF_FFFF_FFFF ; seq_item.oper2== 'h1_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 50 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3_FFFF_FFFF_FFFF ; seq_item.oper2== 'h3_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 51 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7_FFFF_FFFF_FFFF ; seq_item.oper2== 'h7_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 52 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hF_FFFF_FFFF_FFFF ; seq_item.oper2== 'hF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 53 ) begin

               `uvm_do_with(seq_item,{seq_item.oper1 == 'h1F_FFFF_FFFF_FFFF ; seq_item.oper2== 'h1F_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 54 ) begin
                `uvm_do_with(seq_item,{seq_item.oper1 == 'h3F_FFFF_FFFF_FFFF ; seq_item.oper2== 'h3F_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 55 ) begin
                    
                `uvm_do_with(seq_item,{seq_item.oper1 == 'h7F_FFFF_FFFF_FFFF ; seq_item.oper2== 'h7F_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 56 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'hFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 57 ) begin

              `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h1FF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 58 ) begin

                `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h3FF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 59 ) begin
            
               `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h7FF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 60 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'hFFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 61 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h1FFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h1FFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 62 ) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3FFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h3FFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 63 ) begin
                 
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h7FFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h7FFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 64 ) begin

                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'hFFFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 65) begin
                     
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h3 ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 66) begin
                  
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hF ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 67) begin
                       
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFF ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 68) begin

                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 69) begin
                    
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF_FFFF ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 70) begin
                     
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hFFFF_FFFF_FFFF_FFFF ; seq_item.oper2== 'h0 ; } );
      end
      if(scenario == 71) begin
                  
                  `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'h3 ; } );
      end
      if(scenario == 72) begin
                       
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hF ; } );
      end
      if(scenario == 73) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hFF ; } );
      end
      if(scenario == 74 ) begin
             
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hFFFF ; } );
      end
      if(scenario == 75 ) begin

                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hFFFF_FFFF ; } );
      end
      if(scenario == 76 ) begin
                   
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hFFFF_FFFF ; } );
      end
      if(scenario == 77 ) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h0 ; seq_item.oper2== 'hFFFF_FFFF_FFFF_FFFF ; } );
      end
      if(scenario == 78 ) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h5555_5555_5555_5555 ; seq_item.oper2== 'h5555_5555_5555_5555 ; } );
      end
      if(scenario == 79 ) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'h5555_5555_5555_5555 ; seq_item.oper2== 'hAAAA_AAAA_AAAA_AAAA ; } );
      end
      if(scenario == 80 ) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hAAAA_AAAA_AAAA_AAAA  ; seq_item.oper2== 'h5555_5555_5555_5555 ; } );
      end
      if(scenario == 81 ) begin
         
                 `uvm_do_with(seq_item,{seq_item.oper1 == 'hAAAA_AAAA_AAAA_AAAA  ; seq_item.oper2== 'hAAAA_AAAA_AAAA_AAAA ; } );
      end


 
  
endtask

endclass 




