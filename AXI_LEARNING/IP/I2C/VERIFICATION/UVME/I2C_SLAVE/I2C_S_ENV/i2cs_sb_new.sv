//--------------------------------------------------------------------------
// File name: i2cs_sb_new.sv
//project : i2c_slave
//---------------------------------------------------------------------------


class i2cs_sb extends uvm_scoreboard;

    // component registration
    `uvm_component_utils(i2cs_sb)
    
    // handle for sequence item
    i2cs_seq_item_tb sb_i2cs_seq_item;

    // analysis port
    uvm_analysis_imp#(i2cs_seq_item_tb, i2cs_sb) item_collected_export;

    // constructor 
    function new(string name="i2cs_sb", uvm_component parent=null);
        super.new(name, parent);
	    sb_i2cs_seq_item=new("sb_i2cs_seq_item");
    endfunction
    
    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	    item_collected_export=new("item_collected_export",this);
    endfunction
    
    //write function
    virtual function void write(i2cs_seq_item_tb sb_i2cs_seq_item);
        `uvm_info(get_name(),$sformatf("Inside sb write "),UVM_MEDIUM)
        $display("sb_i2cs_seq_item received");
	    sb_i2cs_seq_item.print();  
        i2cs_optn(sb_i2cs_seq_item);
	    `uvm_info(get_name(),$sformatf("Inside sb exiting "),UVM_MEDIUM)	
    endfunction


  // i2cs_optn for define monitoring 
   virtual function void i2cs_optn (i2cs_seq_item_tb sb_i2cs_seq_item);

       // declare all the signals
       logic sb_i2c_sda_inout;
       logic sb_i2c_scl_inout;
       static logic [7:0] sb_i2c_slave_addr_wr;
       static logic [7:0] sb_i2c_slave_data_wr;
       static logic [7:0] sb_i2c_slave_data_rd;
       static logic [6:0] sb_addr_test;
       static logic       sb_rw_test  ;
       static logic [7:0] sb_data_test;
       static logic [7:0] sb_read_test;

   
       parameter idle=4'b0000,
			      addr=4'b0001,
			      ack=4'b0010,
                  read=4'b0011,
                  rd_ack=4'b0100,
			      write=4'b0101,
                  wr_ack=4'b0110,
                  stop=4'b0111;
			 
       static reg [3:0] present_state, next_state;
       static reg [2:0] addcount=3'b111;
       static reg [3:0] wrcount=4'b1000;
       static reg [3:0] rdcount=4'b1000;
  
       fork
  
         begin
           if(sb_i2cs_seq_item.i2c_rst==1)
             present_state = idle; 
           else
             begin
               `uvm_info(" inside else reset is",$sformatf("reset is %d ",sb_i2cs_seq_item.i2c_rst),UVM_MEDIUM)

               present_state = next_state;
             end
          end

         
         begin

            case(present_state)  

              idle : begin
                       `uvm_info(" inside idle",$sformatf("idle state"),UVM_MEDIUM)
                       if(sb_i2cs_seq_item.sdas_in==0)
                           begin
                             next_state =addr;
                             addcount =3'b111;
                           end
                       else
                         next_state = idle;
                     end

              addr:   begin
                                 
                        if(addcount>3'b000)
		                begin
                          sb_addr_test[addcount-1]=sb_i2cs_seq_item.sdas_in;
                          `uvm_info(" inside address state",$sformatf(" sb_i2cs_seq_item.sdas_in=%b,sb_addr_test[%0d]=%b ", sb_i2cs_seq_item.sdas_in,addcount-1,sb_addr_test[addcount-1]),UVM_MEDIUM)
			              addcount=addcount-3'b001;
			              next_state = addr;
			            end	
			
                        else
			            begin
                          sb_rw_test=sb_i2cs_seq_item.sdas_in;
                          $display("sb_rw_test=%b",sb_rw_test);
                          `uvm_info(" At rw bit",$sformatf("sb_i2cs_seq_item.sdas_in=%b, sb_rw_test=%b ", sb_i2cs_seq_item.sdas_in,sb_rw_test),UVM_MEDIUM)
                          next_state=ack;	
                          addcount=3'b000;
                          `uvm_info(" address and rw bit ",$sformatf("sb_address=%d, sb_rw_test=%b",sb_addr_test,sb_rw_test),UVM_MEDIUM)
                         end
                     end

              ack:   begin
                       if(sb_i2cs_seq_item.sdas_in==0)
                         begin
                           `uvm_info(" inside ack is",$sformatf("acknowledgement"),UVM_MEDIUM)
                           if(sb_rw_test===0)
                             begin
                               next_state=write;
                               wrcount=4'b1000;
                             end
                            else if(sb_rw_test===1) 
                              begin
                                rdcount=4'b1000;
                                next_state =read;
                              end
                            else
                                next_state = idle;
                          end
                        else
                          begin
                          next_state =idle;
                          `uvm_info(" inside idle after slave acknwoledgement",$sformatf("idle state"),UVM_MEDIUM)
                          end
                     end

              write: begin
                       if(wrcount>4'b0001)
                       begin
                        sb_data_test[wrcount-1]=sb_i2cs_seq_item.sdas_in;
                        `uvm_info(" write",$sformatf("sb_data_test[%d]=%b",wrcount-1,sb_data_test[wrcount-1]),UVM_MEDIUM)
                        wrcount=wrcount-1;
                        next_state=write;
                       end

                       else
                       begin
                         sb_data_test[0]=sb_i2cs_seq_item.sdas_in;
                        `uvm_info(" write",$sformatf("sb_data_test[0]=%b",sb_data_test[0]),UVM_MEDIUM)
                         next_state= wr_ack;
                         `uvm_info(" write data ",$sformatf("sb_data_test=%d",sb_data_test),UVM_MEDIUM)
                       end 
                     end

               read: begin
                        `uvm_info(" read data ",$sformatf(" read data state"),UVM_MEDIUM)
                       if(rdcount>4'b0001)
                       begin
                         sb_read_test[rdcount-1]=sb_i2cs_seq_item.sdas_in;
                         `uvm_info(" reading data",$sformatf("read data[%d]=%b",rdcount-1,sb_i2cs_seq_item.sdas_in),UVM_MEDIUM)
                         next_state=read;
                         rdcount=rdcount-1;
                       end

                       else
                       begin
                         
                         sb_read_test[0]=sb_i2cs_seq_item.sdas_in;
                         `uvm_info(" reading data",$sformatf("read data[0]=%b",sb_i2cs_seq_item.sdas_in),UVM_MEDIUM)
                         `uvm_info(" reading data",$sformatf("read data=%d",sb_read_test),UVM_MEDIUM)
                         next_state= rd_ack;
                       end
                     end

               wr_ack:begin
                        next_state = idle;
                        `uvm_info(" inside write acknowledgement",$sformatf("write ack state"),UVM_MEDIUM)
                      end

               rd_ack: begin
                         if(sb_i2cs_seq_item.sdas_in==1)
                             begin
                             next_state= stop;
                             `uvm_info(" inside read ackmowledgement",$sformatf("read ack state"),UVM_MEDIUM)

                           end

                         else
                             begin
                           next_state=idle;
                           `uvm_info(" inside  idle state after read data",$sformatf("idle state"),UVM_MEDIUM)
                            end
                       end

                stop: begin
                        next_state= idle;
                        `uvm_info(" inside stop",$sformatf("stop state"),UVM_MEDIUM)

                      end

                default: begin
                           next_state=idle;
                           `uvm_info("  default, inside idle",$sformatf("idle state"),UVM_MEDIUM)
                         end
            endcase

          end
        join

      endfunction

	   
endclass

