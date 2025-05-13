

class i2cm_sequence extends uvm_sequence#(i2cm_seq_item);
  `uvm_object_utils(i2cm_sequence)
  
  i2cm_seq_item seq_item_inst;
  
  int scenario=0;

  logic i2c_reset_in_seq;
  logic i2c_start_seq;
  logic rw_seq;
  logic [6:0] i2c_master_addr_wr_seq;
  logic [7:0] i2c_master_data_wr_seq;
  logic fifo_full_seq;
  logic ready_out_seq;
  logic [7:0] test_sdam_out_seq;

  logic wr_addr_ack_seq;
  logic wr_data_ack_seq ;
  logic i2c_start_tst_seq;


  function new(string name="i2cm_sequence");
    super.new(name);	
  endfunction
  
  task body();

    //reset condition
	if(scenario==0)   
	begin   
      `uvm_info("scenario 0","rst should be 1",UVM_MEDIUM)
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==1;});

      `uvm_info("scenario 0 done","rst should be 1",UVM_MEDIUM)
	end


    else if (scenario==1) //rst=0 with random values
	begin
      `uvm_info("scenario 0","rst should be 1",UVM_MEDIUM)
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==0;
                                  seq_item_inst.sdam_en_tst==0;
                                  seq_item_inst.wr_addr_ack==0;
                                  seq_item_inst.wr_data_ack==0;
                                  seq_item_inst.i2c_start_tst==0;});
    end


	else if(scenario==2)  //write
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==0;
                                  seq_item_inst.i2c_start==i2c_start_seq;
                                  seq_item_inst.i2c_start_tst==0;
                                  seq_item_inst.sdam_en_tst==0;
								  seq_item_inst.rw==rw_seq;
								  seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;
                                  seq_item_inst.i2c_master_data_wr==i2c_master_data_wr_seq;
                                  seq_item_inst.wr_addr_ack==wr_addr_ack_seq;
                                  seq_item_inst.wr_data_ack==wr_data_ack_seq;});
								  
     `uvm_info("scenario2","values assigned",UVM_MEDIUM)
	end


    else if(scenario==3)// read
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==0;
                                  seq_item_inst.i2c_start==i2c_start_seq; 
                                  seq_item_inst.i2c_start_tst==0;
                                  seq_item_inst.sdam_en_tst==0;
								  seq_item_inst.rw==rw_seq;
                             	  seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;
                                  seq_item_inst.wr_addr_ack==wr_addr_ack_seq;
							      seq_item_inst.test_sdam_out==test_sdam_out_seq;});

     `uvm_info("scenario2","values assigned",UVM_MEDIUM)
	end


 	// rst =0 with ranom values for fifo full
	else if(scenario==4)   
	begin
	  //`uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==0;});
      `uvm_info("scenario 1","rst should be 0",UVM_MEDIUM)
      `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==0;
                                  seq_item_inst.i2c_start==1;
                                  seq_item_inst.i2c_start_tst==1;
                                  seq_item_inst.sdam_en_tst==1;
                                  //seq_item_inst.sdam_en==1;
                                  // seq_item_inst.sdam_out==1;
                                  seq_item_inst.wr_addr_ack==0;
                                  seq_item_inst.wr_data_ack==0;
                                  seq_item_inst.rw==0;});
      `uvm_info("scenario1","for rst 0 item",UVM_MEDIUM)
	end

/*
    else if(scenario==5) //rst=1 , i2c_start=1 and rw =1
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==1;
                                  seq_item_inst.i2c_start==i2c_start_seq;
								  seq_item_inst.rw==rw_seq;
								  //seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;
                                  seq_item_inst.wr_addr_ack==wr_addr_ack_seq;});
	end


    else if(scenario==6) //rst=1 , i2c_start=1 and rw=0
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==1;
                                  seq_item_inst.i2c_start==i2c_start_seq;
								  seq_item_inst.rw==rw_seq;
								  //seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;
								  //seq_item_inst.i2c_master_data_wr==i2c_master_data_wr_seq;});
    end


    else if(scenario==7) //rst=1 , i2c_start=0 and rw=1
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==1;
                                  seq_item_inst.i2c_start==i2c_start_seq;
								  seq_item_inst.rw==rw_seq;
								  //seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;});
    end


    else if(scenario==8) //rst=1 , i2c_start=0 and rw=0
	begin
	  `uvm_do_with(seq_item_inst,{seq_item_inst.i2c_reset_in==1;
                                  seq_item_inst.i2c_start==i2c_start_seq;
								  seq_item_inst.rw==rw_seq;
								  //seq_item_inst.i2c_master_addr_wr==i2c_master_addr_wr_seq;
								  //seq_item_inst.i2c_master_data_wr==i2c_master_data_wr_seq;});
    end



*/

	`uvm_info(get_name(),$sformatf("sequence done"),UVM_MEDIUM)
  endtask
endclass
