`timescale 1ns/1ps
module ahb_master1 # ( parameter DSIZE = 32 ,
                      parameter ASIZE = 32 ) 
          
  (                              
    // global signals

    input logic hclk ,
    input logic hrst_n ,

    //signals from slave to masterI
   
    input logic  [ASIZE-1 : 0] addr ,
    input logic  [DSIZE-1 : 0] wdata ,
    input logic  [DSIZE-1 : 0] hrdata ,
    input logic  iwrite ,
    input logic  hready ,
    input logic  hresp ,
    input logic  [2:0] iburst ,
    input logic  [2:0] isize ,
    input logic  [1:0] itrans ,
    input logic busreq ,
    input logic hgrant ,
    


    // signals to slave from master
    
    output logic  [DSIZE-1 : 0] rdata ,
    output logic  [ASIZE-1 : 0] haddr ,
    output logic  [DSIZE-1 : 0] hwdata ,
    output logic  [2:0] hburst , 
    output logic  [2:0] hsize ,
    output logic  [1:0] htrans ,
    output logic  hwrite  ,
    output logic  hbusreq 
    
   );

 /*timeunit 1ns;
 timeprecision 1ps;*/

logic [4:0] count ;   // counter logic
logic [2:0] current_state ,next_state ;  //Different states for FSM


parameter IDLE      =  3'b000 ,   // FSM State's
          ADDPHASE  =  3'b001 ,
          WRITE     =  3'b010 , 
          WAITWR    =  3'b011 ,
          LASTWR    =  3'b100 ,
          READ      =  3'b101 , 
          WAITRD    =  3'b110 ,
          LASTRD    =  3'b111 ;
          

parameter OKAY   = 1'b0 ,   // response from slave
          ERROR  = 1'b1 ;
          //RETRY  = 2'b10 ,
          //SPLIT1 = 2'b11 ;

parameter //IDLET      = 2'b00 ,  // htrans signals
          //BUSY       = 2'b01 ,
          NONSEQ     = 2'b10 ,
          SEQ        = 2'b11 ;

parameter SINGLE = 3'b000 ,    // hburst signals
          INCR =   3'b001 ,
          WRAP4 = 3'b010 ,
          INC4 = 3'b011 ,
          WRAP8 = 3'b100 ,
          INC8 = 3'b101 ,
          WRAP16 = 3'b110 ,
          INC16 = 3'b111 ;
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


always_ff @ ( posedge hclk or negedge hrst_n )
begin
     if ( !hrst_n )
         begin
           current_state <= IDLE ;
         end
         
    else 
         begin
           current_state <= next_state ;
         end
end


//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


always_comb    
                         // Combinational logic for FSM 
begin
      
    unique case ( current_state)

     IDLE :     begin           // initially master is in idle state         
                if ( busreq  )
                begin
                next_state = ADDPHASE ;
                end

                else

                begin 
                next_state = IDLE ;
                end

                end
//--------------------------------------------------
   ADDPHASE :   begin      // address phase which defines address and control signals
                
                if ( hgrant && iwrite && hready  )
                begin
                next_state = WRITE ;
                end

                else if ( hgrant && ! iwrite && hready  )
                begin
                    next_state = READ ;
                end

                else 
                begin 
                next_state = ADDPHASE ;
                end

                end
//----------------------------------------------------------

    WRITE :     begin    // write operation                  
                
                if (hgrant && hready && (itrans == NONSEQ))
                begin
                    next_state = WAITWR ; 
                end

                else if (hgrant && hready && (itrans == SEQ))
                begin
                    next_state = WRITE ;
                end

                else if ( !hready  )
                begin
                    next_state = WAITWR ;
                end
                else if (! hgrant )
                begin
                    next_state = LASTWR ;
                end
                
                else 
                begin
                    next_state = WRITE ;
                end
                end
//----------------------------------------------------------

        READ :  begin  // read operation                  
                
                if (hgrant && hready && (itrans == NONSEQ))
                begin
                    next_state = WAITRD ; 
                end

                else if (hgrant && hready && (itrans == SEQ))
                begin
                    next_state = READ ;
                end

                else if ( !hready  )
                begin
                    next_state = WAITRD ;
                end
                else if (! hgrant) 
                begin
                    next_state = LASTRD ;
                end
                
                else 
                begin
                    next_state = READ ;
                end
                end

//--------------------------------

    WAITWR :begin  // write wait state with response 

                if (hready && hresp==OKAY   )
                begin
                    next_state = IDLE ;
                end
                
                else if (hready && hresp==ERROR )
                begin
                    next_state = WRITE ;
                end

                else 
                begin
                    next_state = WAITWR ;
                end

            end

//-------------------------------------

   WAITRD : begin // read wait state with response

                if (  hready && hresp==OKAY   )
                begin
                    next_state = IDLE ;
                end
                
                else if (hready && hresp==ERROR )
                begin
                    next_state = READ ;
                end

                else 
                begin
                    next_state = WAITRD ;
                end

            end

//------------------------------------------

LASTWR:  begin // last write data during master lost hgrant signal
           if ( hgrant )
           begin
               next_state = WRITE ;
           end

           else
           begin
               next_state = LASTWR ;
           end
       end

//--------------

LASTRD:begin  //last read data during master lost hgrant signal
           if ( hgrant )
           begin
               next_state = READ ;
           end

           else 
           begin
               next_state = LASTRD ;
           end
       end

//-------------------------------------

     default : begin    // default state to avoid glitch 
                    next_state = IDLE ;
                end

      endcase
end

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


always_ff @ ( posedge hclk or negedge hrst_n  ) // sequential logic for FSM
begin 

   if( !hrst_n )
       begin
         haddr  <= 32'b00000000 ;
         hwrite <= 1'b0 ;
         hwdata <= 32'b00000000 ;
         rdata  <= 32'b00000000 ;
         hburst <= 3'b000 ;
         hsize  <= 3'b000 ;
         htrans <= 2'b00 ;
         count  <= 5'b00000 ;
         hbusreq <= 1'b0 ;
       end
  else 

       unique case ( current_state )
        
         IDLE :    begin 
 
                  haddr  <= 32'b0  ;
                  hwdata <= 32'b0 ;
                  rdata  <= 32'b0 ;
                  hsize  <= 3'b000 ;
                  htrans <= 2'b00 ;
                  hburst <= 3'b000 ;
                  hbusreq <= 1'b0 ;
                  end

     ADDPHASE   :  begin 
                  haddr  <= addr  ;
                  hwrite <= iwrite ;
                  hsize  <= isize ;
                  htrans <= itrans ;
                  hburst <= iburst ;
                  hbusreq <= busreq ;
                  count <=5'b00000;
                  
                  end
      
      WRITE   :  begin
                  
                  haddr  <= addr ;
                  hwrite <= iwrite ;
                  hburst <= iburst ;
                  hsize  <= isize ;
                  htrans <= itrans ;
                 

                  unique case (iburst )
                                   
               
                SINGLE : begin
                         if ( count < 5'b00001) 
                         begin
                             count  <= count + 5'b00001 ;
                             hwdata <= wdata ;
                         end
                         else
                         begin
                             count <= 5'b00000 ;
                         end
                         end
 
                INCR   :begin
                         if( count < 5'b10000) 
                         begin
                           count  <= count + 5'b00001 ;
                           hwdata <= wdata ;
                         end

                         else
                         begin
                            count <= 5'b00000; 
                         end
                         end

               WRAP4   :begin
                       
                         if( count < 5'b00100)
                         begin
                            count  <= count + 5'b00001 ;
                            hwdata <= wdata ;
                         end

                         else 
                         begin
                            count <= 5'b00000;
                         end                        
                         end 


               INC4  : begin
                         if( count < 5'b00100) 
                         begin
                           count  <= count + 5'b00001 ;
                           hwdata <= wdata ;
                         end
                         else
                         begin
                           count <= 5'b00000;
                         end
                         end
 
               WRAP8  : begin

                        if( count < 5'b01000)
                        begin
                            count  <= count + 5'b00001 ;
                            hwdata <= wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end
              
              INC8  : begin

                        if( count < 5'b01000)
                        begin
                            count  <= count + 5'b00001;
                            hwdata <= wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

             WRAP16  :  begin
                        if( count < 5'b10000)
                        begin                            
                            count  <= count + 5'b00001 ;
                            hwdata <= wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

            INC16    :   begin

                        if( count < 5'b10000) 
                        begin
                            count  <= count + 5'b00001;
                            hwdata <= wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end


                      default:  
                      begin
                            count <= 5'b00000;
                      end
                     

                     
                   endcase
                  
               end


///----------------------------------------------


       READ   :  begin    
                  haddr  <= addr ;
                  hwrite <= iwrite ;
                  hburst <= iburst ;
                  hsize  <= isize ;
                  htrans <= itrans ;
               
               
                  unique case ( iburst )
                                    
               
               SINGLE  : begin
                         if ( count < 5'b00001)
                         begin                             
                             count <= count + 5'b00001 ;
                             rdata <= hrdata ;
                         end
                         else
                         begin
                             count <= 5'b00000;
                         end
                         end

               INCR   :begin
                         if( count < 5'b10000) 
                         begin
                           count <= count + 5'b00001 ;
                           rdata <= hrdata ;
                         end

                         else
                         begin                            
                            count <= 5'b00000 ; 
                         end
                         end

               WRAP4   :begin
                       
                         if( count < 5'b00100)
                         begin
                            count <= count + 5'b00001 ;
                            rdata <= hrdata ;
                         end

                         else 
                         begin
                            count <= 5'b00000;
                         end                        
                         end 


               INC4    : begin
                         if( count < 5'b00100)
                         begin
                           count <= count + 5'b00001 ;
                           rdata <= hrdata ;
                         end
                         else
                         begin
                           count <= 5'b00000;
                         end
                         end
 
               WRAP8  : begin

                        if( count < 5'b01000) 
                        begin
                            count <= count + 5'b00001 ;
                            rdata <= hrdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end
              
              INC8  : begin

                        if( count < 5'b01000)
                        begin
                            count <= count + 5'b00001;
                            rdata <= hrdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                    end

             WRAP16  :  begin
                        if( count < 5'b10000) 
                        begin
                            count <= count + 5'b00001;
                            rdata <= hrdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

            INC16  :   begin

                        if( count < 5'b10000) 
                        begin
                            count <= count + 1;
                            rdata <= hrdata ;
                        end

                        else

                        begin
                            count <= 5'b00000 ;
                        end
                        end 

                       default:     
                       begin
                            count <= 5'b00000;
                       end
                   

                    
                   endcase
                   end
               
//------------------------------------------------------------
                   

      WAITWR   :  begin                     
                  haddr  <= addr ;
                  hwrite <= iwrite ;
                  hwdata  <= hwdata ;
                  htrans <= itrans ;
                  count  <= count ;
                  end

      WAITRD   :  begin                     
                  haddr  <= addr ;
                  hwrite <= iwrite ;
                  rdata  <= rdata ;
                  htrans <= itrans ;
                  count  <= count ;
                  end

     LASTWR  : begin
                  hwdata <= hwdata ;
               end

           
     LASTRD  : begin
                 rdata <= rdata ;
               end    



//-----------------------------------------------

      default :   begin

                  haddr  <= 32'b0 ;
                  hwrite <= 1'b0 ;
                  hwdata <= 32'b0 ; 
                  rdata  <= 32'b0 ;
                  hburst <= 3'b000 ;
                  hsize  <= 3'b000 ;
                  htrans <= 2'b00 ;                 
                  count  <= 5'b00000 ;
                  end 
            
       endcase
    
   end
   endmodule
