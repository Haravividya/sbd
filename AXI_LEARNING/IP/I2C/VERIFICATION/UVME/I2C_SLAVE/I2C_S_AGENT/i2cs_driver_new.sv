
//---------------------------------------------------------------------------------------
//file name: i2cs_driver.sv
//project name : i2c_slave
//------------------------------------------------------------------------------

class i2cs_driver_tb extends uvm_driver#(i2cs_seq_item_tb);

  // instantiation for interface and sequence item
  virtual i2cs_intrf_tb intrf_inst;
  i2cs_seq_item_tb seq_item_inst;
  
  
  `uvm_component_utils(i2cs_driver_tb)   // component registration
  
  //factory registration
  function new (string name="i2cs_driver_tb",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	  if(!uvm_config_db#(virtual i2cs_intrf_tb)::get(this," ","INTERFACE_CONFIG_DB",intrf_inst))  // configiuration db 
	    `uvm_fatal(get_name(),$sformatf("Driver:uvm_config_db get failed: INTERFACE_DB\n"))
  endfunction
  

  //run phase
  task run_phase(uvm_phase phase);
  int condition=2;
  forever
    begin

      seq_item_port.get_next_item(seq_item_inst);

      // driving reset condition
      if(seq_item_inst.i2c_rst==1)
        begin
         `uvm_info("reset=1",$sformatf("start rst"),UVM_MEDIUM)
          intrf_inst.i2c_rst=1;
          intrf_inst.sdas_en=0;
          intrf_inst.sdas_out=1;
	      repeat(5) @(posedge intrf_inst.i2c_scl);
            begin
	        intrf_inst.i2c_rst=0;
            intrf_inst.sdas_en=1;
            intrf_inst.sdas_out=1; 
            end
    	end


     //driving inputs for slave to write and read conditions 
      else if (seq_item_inst.i2c_rst==0)
        begin
          `uvm_info("Test file",$sformatf("end reset"),UVM_MEDIUM)
        //  @(posedge intrf_inst.i2c_scl)
          intrf_inst.sdas_en=1;
          intrf_inst.sdas_out=1; 
          @(posedge intrf_inst.i2c_scl)
              intrf_inst.sdas_out=0;   // start
          for(int i=0;i<7;i=i+1)
            begin
              @(posedge intrf_inst.i2c_scl)
                intrf_inst.sdas_out=seq_item_inst.addr_test[6-i];   //address 
            end
            `uvm_info("Test file",$sformatf("address given"),UVM_MEDIUM)

            @(posedge intrf_inst.i2c_scl);
              intrf_inst.sdas_en= seq_item_inst.en_test;
              intrf_inst.sdas_out=seq_item_inst.rw_test;   //rw bit
              $display("sdas_out=%b",intrf_inst.sdas_out);
              `uvm_info("checking sdas out",$sformatf("intrf_inst.sdas_out=%b",intrf_inst.sdas_out),UVM_MEDIUM)

            `uvm_info("Test file",$sformatf("rw bit given"),UVM_MEDIUM)
           @(posedge intrf_inst.i2c_scl);   //expecting ack bit from slave
             intrf_inst.sdas_en=0;  

            if (seq_item_inst.rw_test==0 )   //write
              begin
                 for (int j=0;j<8;j=j+1)
                    begin
                       @(posedge intrf_inst.i2c_scl)
                       begin
                           intrf_inst.sdas_en=1;
                           intrf_inst.sdas_out=seq_item_inst.data_test[7-j];
                        end
                    end
                    @(posedge intrf_inst.i2c_scl);
                      intrf_inst.sdas_en=0;            //expecting slave write acknowledgement

                    @(posedge intrf_inst.i2c_scl);   
                      intrf_inst.sdas_en=1;            // idle state
                     `uvm_info("Test file",$sformatf("data is given"),UVM_MEDIUM)
                                          
                 end

              else if (seq_item_inst.rw_test ==1 ) // read
                begin
                  intrf_inst.sdas_en=0;
                  repeat(8) @(posedge intrf_inst.i2c_scl);
                  @(posedge intrf_inst.i2c_scl);
                   begin 
                     intrf_inst.sdas_en=1;
                     intrf_inst.sdas_out=seq_item_inst.rd_ack_test;  // rd ack
                   end

                  `uvm_info("Test file",$sformatf("data has read"),UVM_MEDIUM)
                    @(posedge intrf_inst.i2c_scl);   // idle or stop
                  
                end

             else
                 @(posedge intrf_inst.i2c_scl); // idle

        end  

      
	  seq_item_port.item_done();
	  
	end	
  endtask
endclass



