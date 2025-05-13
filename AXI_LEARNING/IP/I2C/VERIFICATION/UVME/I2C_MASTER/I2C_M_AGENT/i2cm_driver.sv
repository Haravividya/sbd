//................................I2C MASTER DRIVER FILE.................

class i2cm_driver extends uvm_driver#(i2cm_seq_item);

  virtual i2cm_intrf intrf_inst;
  i2cm_seq_item seq_item_inst;
  

  `uvm_component_utils(i2cm_driver)
  
  function new (string name="i2cm_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual i2cm_intrf)::get(this," ","I2CM_INTERFACE_DB",intrf_inst))
    `uvm_fatal(get_name(),$sformatf("Driver:uvm_config_db get failed: INTERFACE_DB\n"))
  endfunction
  
  task run_phase(uvm_phase phase);
 
	forever
	begin  // forever begin

	  `uvm_info(get_name(),$sformatf(" inside driver start"),UVM_MEDIUM)
	  seq_item_port.get_next_item(seq_item_inst);

	  if(seq_item_inst.i2c_reset_in==1)                  //for rst=1
	  begin // rst=1 begin
	  
        `uvm_info("rst=1","start",UVM_MEDIUM)
	    intrf_inst.i2c_reset_in=1;
	    //	intrf_inst.sclm_en=0;  //required if scl is inout
        intrf_inst.sdam_en=0;

        repeat(2) @(posedge intrf_inst.i2c_clock_in);

      	intrf_inst.i2c_reset_in=0;
        intrf_inst.i2c_start=0;

	  end // rst=1 end
	  

      else if(seq_item_inst.i2c_reset_in==0 & seq_item_inst.rw==0)   //write
	  
      fork
      begin  //1 input to master block- begin1
	  
        intrf_inst.i2c_master_addr_wr=seq_item_inst.i2c_master_addr_wr;
        intrf_inst.i2c_master_data_wr=seq_item_inst.i2c_master_data_wr;
        intrf_inst.rw=seq_item_inst.rw;  
        //intrf_inst.sdam_en=seq_item_inst.sdam_en_tst;
        //intrf_inst.sdam_out=0;

        @(posedge intrf_inst.i2c_clock_in)
        intrf_inst.i2c_start=1;
        @(posedge intrf_inst.i2c_clock_in)
        intrf_inst.i2c_start=seq_item_inst.i2c_start_tst;

      end  //1 input to master block- end1


      begin  //2 2nd begin in fork

      if(seq_item_inst.sdam_en_tst==0) //other than fifo full sceanrio this is 0
      begin  //3

	    int condition=1;
        while(condition)
        begin  //4
	  
          @(negedge intrf_inst.sdam_in)  //waiting for the start condition
          if(intrf_inst.i2c_scl_inout==1)   
            condition=0;   //start detected     
          else 
            condition=1;
	
        end  //4

        begin //5  starts commuinication	  

          if(condition==0)   //checking for start condition
          begin //6
		     
            repeat(8) @(negedge intrf_inst.i2c_scl_inout)  //waiting for addr and rw bit at sda
            intrf_inst.sdam_out=seq_item_inst.wr_addr_ack;  //ack for the address
            intrf_inst.sdam_en=1; 
            @(negedge intrf_inst.i2c_scl_inout)    
			
            if(seq_item_inst.wr_addr_ack==0)  // if addr ack is received then start writing data to slave
            begin//7  ack is rxvd
			
              @ (negedge intrf_inst.i2c_scl_inout)
              intrf_inst.sdam_en=0;    //disabling 
	          repeat(8) @(negedge intrf_inst.i2c_scl_inout)  //waiting for data
              intrf_inst.sdam_out=seq_item_inst.wr_data_ack;   // data ack from slave
              intrf_inst.sdam_en=1; 
              @ (negedge intrf_inst.i2c_scl_inout)
              intrf_inst.sdam_en=0;    //disabling 
              // condition=1;
			  
            end //7  ack rxvd
		
            else  // if addr ack is not received
            begin//8  ack do not rxvd
		
              @ (negedge intrf_inst.i2c_scl_inout)
              intrf_inst.sdam_en=0;
              //condition=1;
		  
            end //8 ack do not rxvd

          end //6 

        end  //5 communication end

      end  //3 fifo full scenario check
	  
    end//2 2nd  end of fork join
	  
    join
      


    //read data from slave
	else if(seq_item_inst.i2c_reset_in==0 & seq_item_inst.rw==1)   //read
 	  
      fork
      begin  //1 input data to master controller
	  
        intrf_inst.i2c_master_addr_wr=seq_item_inst.i2c_master_addr_wr;
        intrf_inst.i2c_master_data_wr=seq_item_inst.i2c_master_data_wr;
        intrf_inst.rw=seq_item_inst.rw; 
        @(posedge intrf_inst.i2c_clock_in)
         intrf_inst.i2c_start=1;
        @(posedge intrf_inst.i2c_clock_in)
         intrf_inst.i2c_start=seq_item_inst.i2c_start_tst;
		 
      end  //1  input data to master controller


      begin  //2 2nd begin of fork-join

        if(seq_item_inst.sdam_en_tst==0)  //other than fifo full scenario this is 0
        begin//3

	      int condition=1;
          while(condition)
          begin  //4
		
          @(negedge intrf_inst.sdam_in)  //waiting for the start condition
          if(intrf_inst.i2c_scl_inout==1)
            condition=0;   //start detected
          else
            condition=1;
			
          end //4

          begin //5  communication starts
	  
            if(condition==0)   //checking for start condition
            begin //6
   
		      repeat(8) @(negedge intrf_inst.i2c_scl_inout)  //waiting for addr and rw bit at sda
              intrf_inst.sdam_out=seq_item_inst.wr_addr_ack; //addr ack from slave
              @(negedge intrf_inst.i2c_scl_inout) 
              intrf_inst.sdam_en=1;  //to get ack from slave  enable
		
              if(seq_item_inst.wr_addr_ack==0) //if addr ack is received
              begin//7
		
                for(int i=0;i<8;i=i+1)                
                begin //8
		
                  @(negedge intrf_inst.i2c_scl_inout) 		  
                  intrf_inst.sdam_out=seq_item_inst.test_sdam_out[7-i]; // data read by master


                end  //8 
		
                @(negedge intrf_inst.i2c_scl_inout)  
                intrf_inst.sdam_en=0;  //ack from master 
                //condition=1;
              end//7 addr ack is rxvd
		  
              else  //if address ack is not received from the slave
              begin//9
     
                @ (negedge intrf_inst.i2c_scl_inout)
                intrf_inst.sdam_en=0;
                //condition=1;
		  
              end //9

            end //6 start condition 

          end  //5 communication end

        end//3 fifo full scenario check

      end//2 2nd bend of fork-join
	  
      join
	  
   
    seq_item_port.item_done();
	
	`uvm_info(get_name(),$sformatf(" inside driver done"),UVM_MEDIUM)

    end
  endtask
endclass
 
