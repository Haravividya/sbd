/**************************************************************************
Project name:ahb_master 
Description: This is the module which has a reference signals and check whether it
is matching with obtained signals which is coming from monitor
this module acts as reference module.
File name:ahb_master_scoreboard.sv
**************************************************************************/

//user defined class derived from base class 
class ahb_master_scoreboard_tb extends uvm_scoreboard;

//factory registration
  `uvm_component_utils(ahb_master_scoreboard_tb)
 
//declare handle for port 
  uvm_analysis_imp #(ahb_master_seq_item_tb,ahb_master_scoreboard_tb) item_collected_export; 

//declare handle for seq item
  ahb_master_seq_item_tb pkt_qu[$];  
  ahb_master_seq_item_tb sb; 
  ahb_master_seq_item_tb seq_item_inst;

  bit [4:0] count;
  bit [2:0] next_state;
  bit [2:0] current_state;

  parameter IDLE      =  3'b000 ,   // FSM State's
            ADDPHASE  =  3'b001 ,
            WRITE     =  3'b010 , 
            WAITWR    =  3'b011 ,
            LASTWR    =  3'b100 ,
            READ      =  3'b101 , 
            WAITRD    =  3'b110 ,
            LASTRD    =  3'b111 ;
         

  parameter SINGLE    =  3'b000 , // hburst signals
            INCR      =  3'b001 ,
            WRAP4     =  3'b010 ,
            INC4      =  3'b011 ,
            WRAP8     =  3'b100 ,
            INC8      =  3'b101 ,
            WRAP16    =  3'b110 ,
            INC16     =  3'b111 ;


 virtual ahb_master_interface_tb i_inst;// optional if we need to connect scoreboard and interface. 
//constructor 
  function new (string name = "ahb_master_scoreboard_tb", uvm_component parent = null);
    super.new (name, parent);
  endfunction

//build phase - creates the obj of port and seq item	
  function void build_phase (uvm_phase phase);
    item_collected_export = new("item_collected_export", this);
                     sb   = ahb_master_seq_item_tb::type_id::create("sb");
     //connecting monitor to interface (virtual) using uvm_congifg_db get() method
     //optional if we need to connect scoreboard and interface.
        if(!uvm_config_db#(virtual ahb_master_interface_tb)::get(this,"","INTERFACE_INST_DB",i_inst))
          `uvm_fatal(get_name(),$sformatf("monitor: uvm_config_db get failed: INTERFACE_INST_DB\n"));
 
  endfunction
    

  
//write method is called here it will get inputs and output from monitor    
  virtual function void write(input ahb_master_seq_item_tb pkt);
// push_back method to push pkt(coming from monitor) to end of the queue 
             pkt_qu.push_back(pkt); 
  endfunction

//run phase - have scoreboard logic and comparision 
  task run_phase (uvm_phase phase);
   forever
    begin
        wait(pkt_qu.size() > 0);
// pop_front method to pop pkt(coming from monitor) which is pushed to front of the queue 
        seq_item_inst = pkt_qu.pop_front();      
 
//scoreboard logic  
  //---------------Combinational Logic for FSM----------------------//
     //when Reset asserted in combinational logic of fsm 
      if( !seq_item_inst.hrst_n )
       begin
         sb.haddr       =  0   ;
         sb.hwrite      =  0   ;
         sb.hwdata      =  0   ;
         sb.rdata       =  0   ;
         sb.hburst      =  0   ;
         sb.hsize       =  0   ;
         sb.htrans      =  0   ;
         count          =  0   ;
         sb.hbusreq     =  0   ;
         current_state <= IDLE ;
       end
      //when reset deasserted in combinational logic of fsm
      else  
       begin
         current_state <= next_state ;                   
            case ( current_state)

     IDLE :     begin           // initially master is in idle state         
                if ( seq_item_inst.busreq)
                begin
                    next_state = ADDPHASE ;
                end

                else

                begin 
                    next_state = IDLE ;
                end

                end
//--------------------------------------------------
   ADDPHASE :   begin      //address phase which defines address and control signals
                
                if ( seq_item_inst.hgrant && seq_item_inst.iwrite && seq_item_inst.hready  )
                begin
                    next_state = WRITE ;
                end

                else if ( seq_item_inst.hgrant && !seq_item_inst.iwrite && seq_item_inst.hready  )
                begin
                    next_state = READ ;
                end

                else 
                begin 
                    next_state = ADDPHASE ;
                end

                end
//----------------------------------------------------------

    WRITE :     begin  // write operation                  
                
                if (seq_item_inst.hgrant && seq_item_inst.hready && (seq_item_inst.itrans == 2'b10))
                begin
                    next_state = WAITWR ; 
                end

                else if (seq_item_inst.hgrant && seq_item_inst.hready && (seq_item_inst.itrans == 2'b11))
                begin
                    next_state = WRITE ;
                end

                else if ( !seq_item_inst.hready  )
                begin
                    next_state = WAITWR ;
                end
                else if (!seq_item_inst.hgrant )
                begin
                    next_state = LASTWR ;
                end
                
                else 
                begin
                    next_state = WRITE ;
                end
                end
//----------------------------------------------------------

        READ:  begin    // read operation                  
                
                if (seq_item_inst.hgrant && seq_item_inst.hready && (seq_item_inst.itrans == 2'b10))
                begin
                    next_state = WAITRD ; 
                end

                else if (seq_item_inst.hgrant && seq_item_inst.hready && (seq_item_inst.itrans == 2'b11))
                begin
                    next_state = READ ;
                end

                else if ( !seq_item_inst.hready  )
                begin
                    next_state = WAITRD ;
                end
                else if (!seq_item_inst.hgrant) 
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

                if (seq_item_inst.hready && !seq_item_inst.hresp)
                begin
                    next_state = IDLE;
                end
                
                else if (seq_item_inst.hready && seq_item_inst.hresp)
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

                if (  seq_item_inst.hready && !seq_item_inst.hresp)
                begin
                    next_state = IDLE;
                end
                
                else if (seq_item_inst.hready && seq_item_inst.hresp)
                begin
                    next_state = READ;
                end

                else 
                begin
                    next_state = WAITRD ;
                end

            end

//------------------------------------------

 LASTWR :  begin // last write data during master lost seq_item_inst.hgrant signal
           if ( seq_item_inst.hgrant )
           begin
               next_state = WRITE ;
           end

           else
           begin
               next_state = LASTWR ;
           end
       end

//--------------

 LASTRD :  begin  //last read data during master lost seq_item_inst.hgrant signal
           if ( seq_item_inst.hgrant )
           begin
               next_state = READ ;
           end

           else 
           begin
               next_state = LASTRD;
           end
       end


           default : begin    // default state to avoid glitch 
                    next_state = IDLE ;
           end

    endcase
  end 



//---------------Sequential Logic for FSM----------------------//
begin 
    //when Reset asserted in sequential logic of fsm
    if( !seq_item_inst.hrst_n )
       begin
         sb.haddr       = 32'b00000000 ;
         sb.hwrite      = 1'b0         ;
         sb.hwdata      = 32'b00000000 ;
         sb.rdata       = 32'b00000000 ;
         sb.hburst      = 3'b000       ;
         sb.hsize       = 3'b000       ;
         sb.htrans      = 2'b00        ;
         count          = 5'b00000     ;
         sb.hbusreq     = 1'b0         ;
         current_state <= IDLE         ;
       end
         
    //when Reset deasserted in sequential logic of fsm    
    else
         current_state <= next_state ;
       case ( current_state )
        
         IDLE :   begin 
 
                  sb.haddr   <= 0 ;
                  sb.hwdata  <= 0 ;
                  sb.rdata   <= 0 ;
                  sb.hsize   <= 0 ;
                  sb.htrans  <= 0 ;
                  sb.hburst  <= 0 ;
                  sb.hbusreq <=0  ;
                  end

       ADDPHASE   :  begin 
                  sb.haddr  <= seq_item_inst.addr  ;
                  sb.hwrite <= seq_item_inst.iwrite ;
                  sb.hsize  <= seq_item_inst.isize ;
                  sb.htrans <= seq_item_inst.itrans ;
                  sb.hburst <= seq_item_inst.iburst ;
                  sb.hbusreq<= seq_item_inst.busreq ;
                  count = 5'b00000 ;
                  end
      
       WRITE   :   begin                      
                  sb.haddr  <= seq_item_inst.addr ;
                  sb.hwrite <= seq_item_inst.iwrite ;
                  sb.hburst <= seq_item_inst.iburst ;
                  sb.hsize  <= seq_item_inst.isize ;
                  sb.htrans <= seq_item_inst.itrans ;
                  
                  case (seq_item_inst.iburst )
               
                SINGLE : begin
                         if ( count < 5'b00001)
                         begin
                             count  <= count + 5'b00001 ;
                             sb.hwdata <= seq_item_inst.wdata ;
                         end
                         else
                         begin
                             count <= 5'b00000 ;
                         end
                         end
 
                INCR   : begin
                         if( count < 5'b10000) 
                         begin
                           count  <= count + 5'b00001 ;
                           sb.hwdata <= seq_item_inst.wdata ;
                         end

                         else
                         begin
                            count <= 5'b00000; 
                         end
                         end

                WRAP4  :  begin
                       
                         if( count < 5'b00100)
                         begin
                            count  <= count + 5'b00001 ;
                            sb.hwdata <= seq_item_inst.wdata ;
                         end

                         else 
                         begin
                            count <= 5'b00000;
                         end                        
                         end 


                INC4  :   begin
                         if( count < 5'b00100) 
                         begin
                           count  <= count + 5'b00001 ;
                           sb.hwdata <= seq_item_inst.wdata ;
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
                            sb.hwdata <= seq_item_inst.wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end
              
               INC8 :  begin

                        if( count < 5'b01000) 
                        begin
                            count  <= count + 5'b00001;
                            sb.hwdata <= seq_item_inst.wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

                WRAP16 :   begin
                        if( count < 5'b10000)
                        begin                            
                            count  <= count + 5'b00001 ;
                            sb.hwdata <= seq_item_inst.wdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

                INC16   :   begin

                        if( count < 5'b10000)
                        begin
                            count  <= count + 5'b00001;
                            sb.hwdata <= seq_item_inst.wdata ;
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

       READ  :  begin    
                  sb.haddr  <= seq_item_inst.addr ;
                  sb.hwrite <= seq_item_inst.iwrite ;
                  sb.hburst <= seq_item_inst.iburst ;
                  sb.hsize  <= seq_item_inst.isize ;
                  sb.htrans <= seq_item_inst.itrans ; 
                 
                  
                  case ( seq_item_inst.iburst )
               
               SINGLE  : begin
                         if ( count < 5'b00001)
                         begin                             
                             count <= count + 5'b00001 ;
                             sb.rdata <= seq_item_inst.hrdata ;
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
                           sb.rdata <= seq_item_inst.hrdata ;
                         end

                         else
                         begin                            
                            count <= 5'b00000 ; 
                         end
                         end

               WRAP4    :begin
                       
                         if( count < 5'b00100)
                         begin
                            count <= count + 5'b00001 ;
                            sb.rdata <= seq_item_inst.hrdata ;
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
                           sb.rdata <= seq_item_inst.hrdata ;
                         end
                         else
                         begin
                           count <= 5'b00000;
                         end
                         end
 
              WRAP8 : begin

                        if( count < 5'b01000) 
                        begin
                            count <= count + 5'b00001 ;
                            sb.rdata <= seq_item_inst.hrdata ;
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
                            sb.rdata <= seq_item_inst.hrdata ;
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
                            sb.rdata <= seq_item_inst.hrdata ;
                        end

                        else

                        begin
                            count <= 5'b00000;
                        end
                        end

            INC16  :   begin

                        if( count < 5'b10000) 
                        begin
                            count <= count + 5'b00001;
                            sb.rdata <= seq_item_inst.hrdata ;
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
                   

      WAITWR   : begin                     
                  sb.haddr  <= seq_item_inst.addr ;
                  sb.hwrite <= seq_item_inst.iwrite ;
                  sb.hwdata  <= seq_item_inst.hwdata ;
                  sb.htrans <= seq_item_inst.itrans ;
                  count  <= count ;
                  end

      WAITRD   :  begin                     
                  sb.haddr  <= seq_item_inst.addr ;
                  sb.hwrite <= seq_item_inst.iwrite ;
                  sb.rdata  <= seq_item_inst.rdata ;
                  sb.htrans <= seq_item_inst.itrans ;
                  count  <= count ;
                  end

     LASTWR : begin
                  sb.hwdata <= seq_item_inst.hwdata ;
               end

           
     LASTRD : begin
                 sb.rdata <= seq_item_inst.rdata ;
               end    



//-----------------------------------------------

      default :   begin

                  sb.haddr  <= 0 ;
                  sb.hwrite <= 0 ;
                  sb.hwdata <= 0 ; 
                  sb.rdata  <= 0 ;
                  sb.hburst <= 0 ;
                  sb.hsize  <= 0 ;
                  sb.htrans <= 0 ;                 
                  count     <= 0 ;
                  end 
            
       endcase
    
    end 



  //comparision of DUT value with scorebboard calculated data out 	 
            
      if((sb.haddr === seq_item_inst.haddr) && (sb.rdata === seq_item_inst.rdata) && (sb.hwdata === seq_item_inst.hwdata) && (sb.hwrite === seq_item_inst.hwrite) && (sb.htrans === seq_item_inst.htrans) && (sb.hbusreq === seq_item_inst.hbusreq) && (sb.hburst === seq_item_inst.hburst) && (sb.hsize === seq_item_inst.hsize))

	   `uvm_info(get_type_name(),$sformatf("test passed, sb.haddr=%h,RTL_haddr=%d,sb.rdata=%h,RTL_rdata=%h,sb.hwdata=%h,RTL_hwdata=%d,sb.hwrite=%h,RTL_hwrite=%h,sb.htrans=%h,RTL_htrans=%h,sb.hbusreq=%h,RTL_hbusreq=%h,sb.hburst=%h,RTL_hburst=%h,sb.hsize=%h,RTL_hsize=%h",sb.haddr,seq_item_inst.haddr,sb.rdata,seq_item_inst.rdata,sb.hwdata,seq_item_inst.hwdata,sb.hwrite,seq_item_inst.hwrite,sb.htrans,seq_item_inst.htrans,sb.hbusreq,seq_item_inst.hbusreq,sb.hburst,seq_item_inst.hburst,sb.hsize,seq_item_inst.hsize),UVM_MEDIUM)           
      else                                                                   
       `uvm_error(get_type_name(),$sformatf("test failed, sb.haddr=%h,RTL_haddr=%d,sb.rdata=%h,RTL_rdata=%h,sb.hwdata=%h,RTL_hwdata=%d,sb.hwrite=%h,RTL_hwrite=%h,sb.htrans=%h,RTL_htrans=%h,sb.hbusreq=%h,RTL_hbusreq=%h,sb.hburst=%h,RTL_hburst=%h,sb.hsize=%h,RTL_hsize=%h",sb.haddr,seq_item_inst.haddr,sb.rdata,seq_item_inst.rdata,sb.hwdata,seq_item_inst.hwdata,sb.hwrite,seq_item_inst.hwrite,sb.htrans,seq_item_inst.htrans,sb.hbusreq,seq_item_inst.hbusreq,sb.hburst,seq_item_inst.hburst,sb.hsize,seq_item_inst.hsize))     

  
  end
    
 endtask

endclass


