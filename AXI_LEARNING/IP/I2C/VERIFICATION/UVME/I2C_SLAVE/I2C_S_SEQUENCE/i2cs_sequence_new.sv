
//----------------------------------------------------------------------------------------
//file name: i2cs_sequence.sv
//project name: i2c_slave
//------------------------------------------------------------------------------------------

class i2cs_sequence_tb extends uvm_sequence#(i2cs_seq_item_tb);
  
  //component registration
  `uvm_object_utils(i2cs_sequence_tb)
  
  // creating handle for sequence item
  i2cs_seq_item_tb seq_item_inst;
  
  // proprties of sequence
  int scenario=0;
  logic i2c_rst;
  logic [6:0]addr_seq;
  logic rw_seq=1'bx;
  logic [7:0] data_seq;
  logic rd_ack_seq;

  //factory registratioin
  function new(string name="i2cs_sequence_tb");
    super.new(name);	
  endfunction
  
  task body();
    begin
    
      `uvm_info(get_name(),$sformatf("step3:inside sequence"),UVM_MEDIUM)
      
	  //reset scenario
	  if(scenario==0)
          begin
	    `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_rst==1;});
	  end


	  else if(scenario==1)
          begin
	        `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_rst==0;}); 							
	      end																	
	 
      
	  //write scenario
	  else if(scenario==2)
          begin
	     `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_rst==0;
                                         seq_item_inst.addr_test==addr_seq;
                                         seq_item_inst.en_test ==1'b1;
                                         seq_item_inst.rw_test==rw_seq;
                                         seq_item_inst.data_test==data_seq;});
          end

          //read scenario
      else if(scenario==3)
          begin
	     `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_rst==0;
                                         seq_item_inst.addr_test==addr_seq;
                                         seq_item_inst.en_test ==1;
                                         seq_item_inst.rw_test==rw_seq;
                                         seq_item_inst.rd_ack_test==rd_ack_seq;});
                                         

          end
     // scenario for rw bit as high impedence 
     else if(scenario==4)
          begin
	     `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_rst==0;
                                         seq_item_inst.addr_test==addr_seq;
                                         seq_item_inst.en_test ==0;
                                         seq_item_inst.rw_test==rw_seq;
                                         seq_item_inst.rd_ack_test==rd_ack_seq;});
                                        
          end 

        `uvm_info(get_name(),$sformatf("sequence done"),UVM_MEDIUM) 
     end
  endtask


endclass

