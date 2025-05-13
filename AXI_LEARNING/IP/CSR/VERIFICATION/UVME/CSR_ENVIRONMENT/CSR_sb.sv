class csr_sb extends uvm_scoreboard;

	`uvm_component_utils(csr_sb)
	
	 uvm_analysis_imp#(csr_seqitem,csr_sb)scoreboard_analysis_imp;
	 
	csr_seqitem sampled_data[$];
	csr_seqitem seq_item;
    bit mcountinhibit_d=0;
    logic [7:0]prv_interrupt_num=0;
    logic [7:0]mcause_r =0;
    static logic [63:0]mem[int]; //ref memory
     logic [7:0] interrupt_num=0;

	logic [11:0] counter_address [$] = {12'hB03,12'hB04,12'hB05,12'hB06,12'hB07,12'hB08,12'hB09,12'hB0A,12'hB0B,12'hB0C,12'hB0D,12'hB0E,12'hB0F,
	                            12'hB10,12'hB11,12'hB12,12'hB13,12'hB14,12'hB15,12'hB16,12'hB17,12'hB18,12'hB19,12'hB1A,12'hB1B,12'hB1C,12'hB1D, 12'hB1E,12'hB1F};
    logic [11:0] event_address [$] = {12'h323,12'h324,12'h325,12'h326,12'h327,12'h328,12'h329,12'h32A,12'h32B,12'h32C,12'h32D,12'h32E,12'h32F,
	                            12'h330,12'h331,12'h332,12'h333,12'h334,12'h335,12'h336,12'h337,12'h338,12'h339,12'h33A,12'h33B,12'h33C,12'h33D,12'h33E,12'h33F}; 
  // new - constructor
	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction 
	
  //build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		     memory_values();
		scoreboard_analysis_imp = new("scoreboard_analysis_imp", this);
	endfunction
	
	function void memory_values();
	 
	 mem[12'h301]=64'b10_0000_0000_0000_0000_0000_0000_0000_0000_0000_001000_0000_0001_0001_0000_0000;//misa
	 mem[12'hF11]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;//mvendorid
	 mem[12'hF12]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;//marchid
	 mem[12'hF13]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;//mimpid
	 mem[12'hF14]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;//mhartid
	 mem[12'h300]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001_1000_0000_0000;//mstatus
	 mem[12'h305]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001;//mtvec
	 mem[12'h344]= '0;//mip
	 mem[12'h304]= '0;//mie
	 mem[12'h342]=64'b0000_0000_0000_0000_0000_0000_0000_0000_0111_0000_0000_0000_0000_0000_0000_0000;//mcause
	 mem[12'h343]= '0;//mtval
	 mem[12'h340]= '0;//mscratch
	 mem[12'h320]= '0;//mcountinhibit
	 mem[12'h341]= '0;//mepc
	 mem[12'hB00]= '0;//MCYCLE
	 mem[12'hB02]= '0;//minstret
     mem[12'hFC0]= '0;//mintstatus
     mem[12'hBC0]= 64'h0000_0000_0001_1000;//zic_base_csr
	 foreach (counter_address[i]) mem[counter_address[i]] = '0; //mhpm_counter
	 foreach (event_address[i]) mem[event_address[i]] = '0; //mhpm_event

	endfunction
	
	function void write(csr_seqitem seq_item);
		sampled_data.push_back(seq_item);
	endfunction
	
	task run_phase(uvm_phase phase);
		forever
		begin
		  csr_seqitem seq_in;
		  wait(sampled_data.size()>0);
		  seq_in=sampled_data.pop_front();
	    `uvm_info("MINTSTATUS CSR scb",$sformatf("rtl_csr_read_data : %0h active_level_priority : %h",seq_in.csr_read_data_o,seq_in.interrupt_active_level_priority_o), UVM_MEDIUM)

	      if(seq_in.csr_rst==0)begin
		      memory_values();
	    `uvm_info("RESET",$sformatf("reset : %0h",seq_in.csr_rst), UVM_MEDIUM)
          end

          else
           begin
		      fork
                    mvendorid_csr(seq_in);
                    mhartid_csr(seq_in);
                    misa_csr(seq_in);
                    mimpid_csr(seq_in);
                    marchid_csr(seq_in);
                    mstatus_csr(seq_in);
                    mtvec_csr(seq_in);
                    mie_csr(seq_in);
                    mip_csr(seq_in);
                    mcause_csr(seq_in);
                    mtval_csr(seq_in);
                    mscratch_csr(seq_in);
		            mcount_inhibit_csr(seq_in);
		            mcycle_csr(seq_in);
		            minstret_csr(seq_in);
		            mepc_csr(seq_in);
		            mhpm_counter_csr3(seq_in);
		            mhpm_counter_csr4(seq_in);
                    mhpm_counter_csr5(seq_in);
		            mhpm_counter_csr6(seq_in);
		            mhpm_counter_csr7(seq_in);
		            mhpm_counter_csr8(seq_in);
		            mhpm_counter_csr9(seq_in);
		            mhpm_counter_csr10(seq_in);
		            mhpm_counter_csr11(seq_in);
		            mhpm_counter_csr12(seq_in);
		            mhpm_counter_csr13(seq_in);
		            mhpm_counter_csr14(seq_in);
		            mhpm_counter_csr15(seq_in);
		            mhpm_counter_csr16(seq_in);
		            mhpm_counter_csr17(seq_in);
		            mhpm_counter_csr18(seq_in);
		            mhpm_counter_csr19(seq_in);
		            mhpm_counter_csr20(seq_in);
		            mhpm_counter_csr21(seq_in);
		            mhpm_counter_csr22(seq_in);
		            mhpm_counter_csr23(seq_in);
		            mhpm_counter_csr24(seq_in);
		            mhpm_counter_csr25(seq_in);
		            mhpm_counter_csr26(seq_in);
		            mhpm_counter_csr27(seq_in);
		            mhpm_counter_csr28(seq_in);
		            mhpm_counter_csr29(seq_in);
		            mhpm_counter_csr30(seq_in);
		            mhpm_counter_csr31(seq_in);
		            mhpm_event_csr(seq_in);
                    mintstatus_csr(seq_in);
                    zic_base_csr(seq_in);
	              join
                 end
               end
        endtask
    
      //---MVENDORID CSR---//
      function void mvendorid_csr(csr_seqitem seq_in);
        if(seq_in.csr_addr_in == 12'hF11 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hF11]===seq_in.csr_read_data_o)
	    `uvm_info("MVENDORID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF11]), UVM_MEDIUM)
	  else
	    `uvm_error("MVENDORID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF11]))
        end
      endfunction

       //---MHARTID CSR---//
      function void mhartid_csr(csr_seqitem seq_in);
        if(seq_in.csr_addr_in == 12'hF14 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hF14]===seq_in.csr_read_data_o)
	    `uvm_info("MHARTID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF14]), UVM_MEDIUM)
	  else
	    `uvm_error("MHARTID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF14]))
        end
      endfunction

      //---MISA CSR---//
      function void misa_csr(csr_seqitem seq_in);
        if(seq_in.csr_addr_in == 12'h301 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h301]===seq_in.csr_read_data_o)
	    `uvm_info("MISA CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h301]), UVM_MEDIUM)
	  else
	    `uvm_error("MISA CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h301]))
        end
      endfunction
	  
	 //---------MIMPID CSR--------//
	 function void mimpid_csr(csr_seqitem seq_in);
        if(seq_in.csr_addr_in == 12'hF13 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hF13]===seq_in.csr_read_data_o)
	    `uvm_info("MIMPID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF13]), UVM_MEDIUM)
	  else
	    `uvm_error("MIMPID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF13]))
        end
      endfunction
	  
	  //------MARCHID CSR---//
	  function void marchid_csr(csr_seqitem seq_in);
        if(seq_in.csr_addr_in == 12'hF14 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hF14]===seq_in.csr_read_data_o)
	    `uvm_info("MARCHID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF14]), UVM_MEDIUM)
	  else
	    `uvm_error("MARCHID CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hF14]))
        end
      endfunction
	  

      //-----------------MSTATUS CSR-----------//
      function void mstatus_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h300 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h300]===seq_in.csr_read_data_o)
	    `uvm_info("MSTATUS CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h300]), UVM_MEDIUM)
	  else
	    `uvm_error("MSTATUS CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h300]))
    end

    //mstatus_mie_o
    if(mem[12'h300][3]===seq_in.mstatus_mie_o)
	    `uvm_info("MSTATUS_MIE_O CSR",$sformatf("rtl_csr_mstatus_mie_o : %0h ref_csr_mstatus_mie_o : %0h",seq_in.mstatus_mie_o,mem[12'h300][3]), UVM_HIGH)
    else
	    `uvm_error("MSTATUS_MIE_O CSR",$sformatf("rtl_csr_mstatus_mie_o : %0h ref_csr_mstatus_mie_o : %0h",seq_in.mstatus_mie_o,mem[12'h300][3]))

      //write
    if(seq_in.csr_addr_in == 12'h300 && seq_in.csr_write_en_in)	
    begin
	   if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h300][7]=seq_in.csr_write_data_in[7];	
             mem[12'h300][3]=seq_in.csr_write_data_in[3];	
             `uvm_info("MSTATUS_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)//complete write
           end
	   else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h300][7]= mem[12'h300][7] | seq_in.csr_write_data_in[7];	
             mem[12'h300][3]= mem[12'h300][3] | seq_in.csr_write_data_in[3];	
             `uvm_info("MSTATUS_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)//set
           end
	   else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
           begin
             mem[12'h300][7]= mem[12'h300][7] & (~seq_in.csr_write_data_in[7]);	
             mem[12'h300][3]= mem[12'h300][3] & (~seq_in.csr_write_data_in[3]);	
             `uvm_info("MSTATUS_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)//clear
           end
      end

    //mie_set
   else if(seq_in.mie_set)
    begin
	  mem[12'h300][3]=1'b1;
	end

    //mie_clear
	else if (seq_in.mie_clear)
	begin
	  mem[12'h300][3]=1'b0;
	end
    
   endfunction : mstatus_csr

      //----------------------MTVEC CSR---------------------//
      function void mtvec_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h305 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h305]===seq_in.csr_read_data_o)
	    `uvm_info("MTVEC CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h305]), UVM_MEDIUM)
	  else
	    `uvm_error("MTVEC CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h305]))
        end

        //csr_mtvec_o
        if(mem[12'h305]===seq_in.csr_mtvec_o)
	       `uvm_info("MTVEC_O CSR",$sformatf("rtl_csr_mtvec_o : %0h ref_csr_mtvec_o : %0h",seq_in.csr_mtvec_o,mem[12'h305]), UVM_HIGH)
        else
           `uvm_error("MTVEC_O CSR",$sformatf("rtl_csr_mtvec_o : %0h ref_csr_mtvec_o : %0h",seq_in.csr_mtvec_o,mem[12'h305]))
         
        //write
       if(seq_in.csr_addr_in == 12'h305 && seq_in.csr_write_en_in)	
        begin
	   if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h305] = {seq_in.csr_write_data_in[63:2],2'b01};
             `uvm_info("MTVEC_CSR",$sformatf("WRITE OPERATION, ref_csr_write_data : %0h",mem[12'h305]), UVM_MEDIUM)//complete write
	   end
	   else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h305][63:2] = mem[12'h305][63:2] | seq_in.csr_write_data_in[63:2];

             `uvm_info("MTVEC_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)//set
           end
	   else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
           begin
             mem[12'h305][63:2] = mem[12'h305][63:2] & (~seq_in.csr_write_data_in[63:2]);	

	        `uvm_info("MTVEC_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)//clear
           end
        end
      endfunction : mtvec_csr

      //------------------MIP CSR--------------//
      function void mip_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h344 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h344]===seq_in.csr_read_data_o)
	    `uvm_info("MIP CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h344]), UVM_MEDIUM)
	  else
	    `uvm_error("MIP CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h344]))
        end
        //write
        if(seq_in.csr_addr_in == 12'h344 && seq_in.csr_write_en_in)	
        begin
		if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)//write
		    begin
                      mem[12'h344][11] = seq_in.csr_write_data_in[11];
		              mem[12'h344][7] = seq_in.csr_write_data_in[7];
                      mem[12'h344][3] = seq_in.csr_write_data_in[3];
		      `uvm_info("MIP_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)
		    end
		    else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)//set
		    begin
                      mem[12'h344][11]=mem[12'h344][11] | seq_in.csr_write_data_in[11];
		              mem[12'h344][7] = mem[12'h344][7] | seq_in.csr_write_data_in[7];
                      mem[12'h344][3] = mem[12'h344][3] | seq_in.csr_write_data_in[3];
		      `uvm_info("MIP_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)
		    end
	            else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)//clear
		    begin
                      mem[12'h344][11] = mem[12'h344][11] & (~seq_in.csr_write_data_in[11]);
		              mem[12'h344][7] = mem[12'h344][7] & (~seq_in.csr_write_data_in[7]);
                      mem[12'h344][3] = mem[12'h344][3] & (~seq_in.csr_write_data_in[3]);
		      `uvm_info("MIP_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)
                    end
        end
      endfunction : mip_csr

  //--------------------MIE CSR-------------------//
	function void mie_csr(csr_seqitem seq_in);
        //read
		if(seq_in.csr_addr_in == 12'h304 && seq_in.csr_read_en_in)
		begin
		  if(mem[12'h304]===seq_in.csr_read_data_o)
			`uvm_info("MIE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h304]), UVM_MEDIUM)
		  else
			`uvm_error("MIE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h304]))
			end
			//write
			if(seq_in.csr_addr_in == 12'h304 && seq_in.csr_write_en_in)	
			begin
                if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
		        begin
                             mem[12'h304][11] = seq_in.csr_write_data_in[11];
		             mem[12'h304][7] = seq_in.csr_write_data_in[7];
                             mem[12'h304][3] = seq_in.csr_write_data_in[3];
		            `uvm_info("MIE_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)
		         end
		        else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
		        begin
                                    mem[12'h304][11] = mem[12'h304][11] | seq_in.csr_write_data_in[11];
		                    mem[12'h304][7] = mem[12'h304][7] | seq_in.csr_write_data_in[7];
                                    mem[12'h304][3] = mem[12'h304][3] | seq_in.csr_write_data_in[3];
		            `uvm_info("MIE_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)
		        end
	            else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
		        begin
                                      mem[12'h304][11] = mem[12'h304][11] & (~seq_in.csr_write_data_in[11]);
		                      mem[12'h304][7] = mem[12'h304][7] & (~seq_in.csr_write_data_in[7]);
                                      mem[12'h304][3] = mem[12'h304][3] & (~seq_in.csr_write_data_in[3]);
		            `uvm_info("MIE_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)
                end

        end
      endfunction : mie_csr

 //---------------MCAUSE CSR---------------------//
      function void mcause_csr(csr_seqitem seq_in);

            mcause_r = mem[12'h342][23:16];
        //read
	if(seq_in.csr_addr_in == 12'h342 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h342]===seq_in.csr_read_data_o)
	    `uvm_info("MCAUSE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h342]), UVM_MEDIUM)
	  else
	    `uvm_error("MCAUSE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h342]))
        end


        //csr_mcause_o
        if(mem[12'h342][7:0]===seq_in.csr_mcause_o)
	    `uvm_info("MCAUSE CSR",$sformatf("rtl_csr_mcause_o : %0h ref_csr_mcause_o : %0h",seq_in.csr_mcause_o,mem[12'h342][7:0]), UVM_HIGH)
        else
	    `uvm_error("MCAUSE CSR",$sformatf("rtl_csr_mcause_o : %0h ref_csr_mcause_o : %0h",seq_in.csr_mcause_o,mem[12'h342][7:0]))


        //exception_id_write_valid_i	
	   if(seq_in.exception_id_write_valid_i	)
	    begin
          mem[12'h342]={1'b0,32'd0,1'b1,2'b11,1'b0,3'd0,prv_interrupt_num,4'd0,seq_in.exception_code_in[11:0]};
          `uvm_info("MCAUSE_CSR",$sformatf("EXCEPTION VALID"), UVM_MEDIUM)
        end
        
       //interrupt_id_write_valid_i	
       else if(seq_in.interrupt_id_write_valid_i)
        begin
          mem[12'h342]={1'b1,32'd0,1'b1,2'b11,1'b0,3'd0,prv_interrupt_num,4'd0,seq_in.interrupt_code_in[11:0]};
          `uvm_info("MCAUSE_CSR",$sformatf("INTERRUPT VALID"), UVM_MEDIUM)
        end
        
        //write
       if(seq_in.csr_addr_in == 12'h342 && seq_in.csr_write_en_in)	
        begin
	     if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
            begin
            mem[12'h342] = {seq_in.csr_write_data_in[63],32'd0,1'b1,2'b11,seq_in.csr_write_data_in[27],3'd0,seq_in.csr_write_data_in[23:16],4'd0,seq_in.csr_write_data_in[11:0]};
             `uvm_info("MCAUSE_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)//complete write
	   end
	   else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h342][63]   = mem[12'h342][63]    | seq_in.csr_write_data_in[63];//set opeartion
             mem[12'h342][27]   = mem[12'h342][27]    | seq_in.csr_write_data_in[27];
             mem[12'h342][23:16]= mem[12'h342][23:16] | seq_in.csr_write_data_in[23:16];
             mem[12'h342][11:0 ]= mem[12'h342][11:0]  | seq_in.csr_write_data_in[11:0];
             `uvm_info("MCAUSE_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)
           end
	   else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
           begin
             mem[12'h342][63]= mem[12'h342][63] & (~seq_in.csr_write_data_in[63]);//clear operation	
             mem[12'h342][27]= mem[12'h342][27] & (~seq_in.csr_write_data_in[27]);
             mem[12'h342][23:16]=mem[12'h342][23:16] & (~seq_in.csr_write_data_in[23:16]);
             mem[12'h342][11:0]=mem[12'h342][11:0] & (~seq_in.csr_write_data_in[11:0]);
         `uvm_info("MCAUSE_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)
           end
        end
            $display($time," mcause end  : %0h",mem[12'h342][23:16]);
      endfunction : mcause_csr
      

//-------------------------------MTVAL CSR----------------------------------------//
      function void mtval_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h343 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h343]===seq_in.csr_read_data_o)
	    `uvm_info("MTVAL CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h343]), UVM_MEDIUM)
	  else
	    `uvm_error("MTVAL CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h343]))
        end
           //write
	if(seq_in.csr_addr_in == 12'h343 && seq_in.csr_write_en_in)
        begin
             mem[12'h343] = seq_in.csr_write_data_in;
             `uvm_info("MTVAL_CSR",$sformatf("WRITE OPERATION,ref_csr_write_data : %0h",mem[12'h343]), UVM_MEDIUM)
	end
        //ld_sd_misalign
	if(seq_in.exception_valid_in && seq_in.ld_sd_misalign_valid_in)
	begin
          mem[12'h343] = seq_in.ld_sd_misalign_addr_in;
          `uvm_info("MTVAL_CSR",$sformatf("LD_SD MISALIGN"), UVM_MEDIUM)
        end
	//instr misalign
	else if (seq_in.exception_valid_in && seq_in.instr_misalign_valid_in)
	begin
          mem[12'h343] = seq_in.instr_misalign_addr_in;
          `uvm_info("MVTAL_CSR",$sformatf("INSTR MISALIGN"), UVM_MEDIUM)
	end
	//invalid  instr misalign
	else if (seq_in.exception_valid_in && seq_in.invalid_instr_valid_in)
	begin
          mem[12'h343] = {32'd0,seq_in.invalid_instruction_in};
          `uvm_info("MVTAL_CSR",$sformatf("INVALID INSTR"), UVM_MEDIUM)
	end
        //exception valid
        else if (seq_in.exception_valid_in)
	begin
          mem[12'h343] ='0;
          `uvm_info("MVTAL_CSR",$sformatf("EXCEPTION VALID INSTR"), UVM_MEDIUM)
	end
      endfunction : mtval_csr

//-----------------------------MSCRATCH CSR---------------------------------------//
      function void mscratch_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h340 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h340]===seq_in.csr_read_data_o)
	    `uvm_info("MSCRATCH CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h340]), UVM_MEDIUM)
	  else
	    `uvm_error("MSCRATCH CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h340]))
        end
        //write
        if(seq_in.csr_addr_in == 12'h340 && seq_in.csr_write_en_in)	
        begin
	   if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h340] = seq_in.csr_write_data_in;
             `uvm_info("MSCRATCH_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)//complete write
	   end
	   else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h340] = mem[12'h340] | seq_in.csr_write_data_in;	
    	
             `uvm_info("MSCRATCH_CSR",$sformatf("SET OPERATION"), UVM_MEDIUM)//set
           end
	   else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
           begin
             mem[12'h340] = mem[12'h340] & (~seq_in.csr_write_data_in);	
           	
	     `uvm_info("MSCRATCH_CSR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)//clear
           end
        end
      endfunction : mscratch_csr

//--------------------------MEPC CSR-----------------------------//
     function void mepc_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'h341 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h341]===seq_in.csr_read_data_o)
	    `uvm_info("MEPC CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h341]), UVM_MEDIUM)
	  else
	    `uvm_error("MEPC CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h341]))
      end

      //mepc_o
    if(mem[12'h341][19:0]===seq_in.csr_mepc_o)
       `uvm_info("MEPC_O CSR",$sformatf("rtl_csr_mepc_o : %0h ref_csr_mepc_o : %0h",seq_in.csr_mepc_o,mem[12'h341][19:0]), UVM_HIGH)//do not want to display statement for every negedge.
    else
	   `uvm_error("MEPC_O CSR",$sformatf("rtl_csr_mepc_o : %0h ref_csr_mepc_o : %0h",seq_in.csr_mepc_o,mem[12'h341][19:0]))
      

    // exception
	if(seq_in.csr_mepc_write_valid && !seq_in.instr_misalign_valid_in)
	begin
          mem[12'h341]={44'd0,seq_in.csr_mepc_in};
    end

      //write
      else if(seq_in.csr_addr_in == 12'h341 && seq_in.csr_write_en_in)	
        begin
           mem[12'h341] = seq_in.csr_write_data_in;
           `uvm_info("MEPC_CSR",$sformatf("WRITE OPERATION"), UVM_MEDIUM)
	end

      endfunction : mepc_csr	
      
//---------------------MINTSTATUS CSR---------------------//
         function void mintstatus_csr(csr_seqitem seq_in);

          interrupt_num = mem[16'hFC0][7:0];
          prv_interrupt_num = interrupt_num; 
         $display($time,"prv_interrupt_num :%0h",prv_interrupt_num);
         //read
         if(seq_in.csr_addr_in == 12'hFC0 && seq_in.csr_read_en_in)
	   begin
	  if(mem[12'hFC0]===seq_in.csr_read_data_o)
	    `uvm_info("MINTSTATUS CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hFC0]), UVM_MEDIUM)
	  else
	    `uvm_error("MINTSTATUS CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hFC0]))
        end

	
    //exception_valid_in
       if(seq_in.exception_valid_in)begin
           mem[12'hFC0][7:0]=8'hFF;
       end

    //interrupt_valid_in
      else if(seq_in.interrupt_valid_in)
      	begin
          mem[12'hFC0][7:0]=seq_in.interrupt_lvl_pr_i;
     	end

     //mret_valid_i
     else if(seq_in.mret_valid_i)
         begin
            mem[12'hFC0][7:0]=mem[12'h342][23:16];
          end

        //interrupt_active_level_priority_o
      if(mem[12'hFC0][7:0]===seq_in.interrupt_active_level_priority_o[7:0])
	    `uvm_info("MINTSTATUS CSR",$sformatf("rtl_csr_interrupt_active_level_priority_data : %0h ref_csr_interrupt_active_level_priority_data :  %0h",seq_in.interrupt_active_level_priority_o[7:0],mem[12'hFC0][7:0]), UVM_HIGH) 
      else
        `uvm_error("MINTSTATUS CSR",$sformatf("rtl_csr_interrupt_active_level_priority_data : %0h ref_csr_interrupt_active_level_priority_data  : %0h",seq_in.interrupt_active_level_priority_o[7:0],mem[12'hFC0][7:0]))
         $display($time,"mintstatus :%0h",mem[12'hFC0][7:0]);
      endfunction : mintstatus_csr
//-----------------------ZIC_BASE CSR-------------------//
      function void zic_base_csr(csr_seqitem seq_in);
        //read
	if(seq_in.csr_addr_in == 12'hBC0 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hBC0]===seq_in.csr_read_data_o)
	    `uvm_info("ZIC_BASE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hBC0]), UVM_MEDIUM)
	  else
	    `uvm_error("ZIC_BASE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hBC0]))
        end
        //write
        if(seq_in.csr_addr_in == 12'hBC0 && seq_in.csr_write_en_in)	
        begin
           mem[12'hBC0] = seq_in.csr_write_data_in;
           `uvm_info("ZIC_BASE",$sformatf("WRITE OPERATION"), UVM_MEDIUM)
	end
      endfunction : zic_base_csr
//-----------------------MCOUNT INHIBIT CSR-------------------//
      task mcount_inhibit_csr(csr_seqitem seq_in);
     //read
	if(seq_in.csr_addr_in == 12'h320 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'h320]===seq_in.csr_read_data_o)
	    `uvm_info("MCOUNT INHIBIT CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h320]), UVM_MEDIUM)
	  else
	    `uvm_error("MCOUNT INHIBIT CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'h320]))
        end

        //write
        if(seq_in.csr_addr_in == 12'h320 && seq_in.csr_write_en_in)	
        begin
             #mcountinhibit_d;
	     if(!seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
            begin
             mem[12'h320] = seq_in.csr_write_data_in;
             `uvm_info("MCOUNT INHIBIT",$sformatf("WRITE OPERATION"), UVM_MEDIUM)
	       end
	     else if(seq_in.csr_set_bit_in && !seq_in.csr_clear_bit_in)
           begin
             mem[12'h320] = mem[12'h320] | seq_in.csr_write_data_in;//set operation:
          	
             `uvm_info("MCOUNT INHIBIT SET",$sformatf("SET OPERATION"), UVM_MEDIUM)
           end
	     else if(!seq_in.csr_set_bit_in && seq_in.csr_clear_bit_in)
           begin
             mem[12'h320] = mem[12'h320] & (~seq_in.csr_write_data_in);//clear operation	
           	
	     `uvm_info("MCOUNT INHIBIT CLEAR",$sformatf("CLEAR OPERATION"), UVM_MEDIUM)
           end
        end
      endtask : mcount_inhibit_csr		

		
//-----------------------MCYCLE CSR--------------------------------//
     function void mcycle_csr(csr_seqitem seq_in);
  
   //read
	if(seq_in.csr_addr_in == 12'hB00 && seq_in.csr_read_en_in)
	begin
	  if(mem[12'hB00]===seq_in.csr_read_data_o)
	    `uvm_info("MCYCLE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB00]), UVM_MEDIUM)
	  else
	    `uvm_error("MCYCLE CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB00]))
    end
 
    //write
     if(seq_in.csr_addr_in == 12'hB00 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB00] = seq_in.csr_write_data_in;
           `uvm_info("MCYCLE_CSR",$sformatf("WRITE OPERATION, ref_csr_write:%0h",mem[12'hB00]), UVM_MEDIUM)
     	end
   
  else if(mem[12'h320][0]===0)begin
	mem[12'hB00]+= 1;
	end

      endfunction : mcycle_csr		

		
//----------------------MINSTRET CSR----------------------//
     function void minstret_csr(csr_seqitem seq_in);
	
	 //read
	 if(seq_in.csr_addr_in == 12'hB02 && seq_in.csr_read_en_in)
	begin

	  if(mem[12'hB02]===seq_in.csr_read_data_o)
	    `uvm_info("MINSTRET CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB02]), UVM_MEDIUM)
	  else
	    `uvm_error("MINSTRET CSR",$sformatf("rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB02])) 
        end
	
		
	//write
       if(seq_in.csr_addr_in == 12'hB02 && seq_in.csr_write_en_in)
        begin
           mem[12'hB02] = seq_in.csr_write_data_in;
           `uvm_info("MINSTRET_CSR",$sformatf("WRITE OPERATION, ref_csr_write:%0h",mem[12'hB02]), UVM_MEDIUM)
	end

 else if(mem[12'h320][2]===0)begin
		mem[12'hB02]+=1;
        //$display($time,"mem :%0h",mem[12'hB02]);
        end
      endfunction : minstret_csr		

//---------MHPM EVENT CSR--------------------------//
     function void mhpm_event_csr(csr_seqitem seq_in);
        logic event_flag = 0;
	    int count;
        foreach (event_address[i]) if(seq_in.csr_addr_in == event_address[i])
		begin 
		event_flag = 1'b1; 
		count = i;  
		end
 //read
	if(event_flag && seq_in.csr_read_en_in)
	begin
	  if(mem[seq_in.csr_addr_in]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM EVENT CSR",$sformatf("MHPMEVENT_%0d rtl_csr_read_data : %0h ref_csr_read_data : %0h",count,seq_in.csr_read_data_o,mem[seq_in.csr_addr_in]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM EVENT CSR",$sformatf("MHPMEVENT _%0d rtl_csr_read_data : %0h ref_csr_read_data : %0h",count,seq_in.csr_read_data_o,mem[seq_in.csr_addr_in]))
        end

	//write
        if(event_flag && seq_in.csr_write_en_in)	
        begin
           mem[seq_in.csr_addr_in] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_EVENT_CSR",$sformatf("MHPMEVENT_%0d WRITE OPERATION",count), UVM_MEDIUM)
	      end
        event_flag = 0;
      endfunction : mhpm_event_csr	


//---------MHPM COUNTER CSR --------------------------//
     function void mhpm_counter_csr3(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB03 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB03]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_3 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB03]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_3 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB03]))
        end	
	 
	//write
        if(seq_in.csr_addr_in==12'hB03 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB03] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_3 WRITE OPERATION,ref_csr_write:%2h",mem[12'hB03]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][3] && mem[12'h323]!=0) begin
           mem[12'hB03]+= 1;
           end
      endfunction : mhpm_counter_csr3
//-------------------------MHPM_COUNTER_CSR4------------//
function void mhpm_counter_csr4(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB04 && seq_in.csr_read_en_in) 

		begin
	  if(mem[12'hB04]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_4 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB04]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_4 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB04]))
        end
        
       //write
        if(seq_in.csr_addr_in==12'hB04 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB04] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_4 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB04]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][4] && mem[12'h324]!=0) begin
           mem[12'hB04]+= 1;
           end
      endfunction : mhpm_counter_csr4
 
//-------------------------MHPM_COUNTER_CSR5------------//
function void mhpm_counter_csr5(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB05 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB05]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_5 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB05]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_5 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB05]))
        end
       
      //write
        if(seq_in.csr_addr_in==12'hB05 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB05] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_5 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB05]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][5] && mem[12'h325]!=0) begin
           mem[12'hB05]+= 1;
           end
      endfunction : mhpm_counter_csr5
 //-------------------------MHPM_COUNTER_CSR6------------//
function void mhpm_counter_csr6(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB06 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB06]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_6 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB06]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_6 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB06]))
        end
      
      //write
        if(seq_in.csr_addr_in==12'hB06 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB06] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_6 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB06]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][6] && mem[12'h326]!=0) begin
           mem[12'hB06]+= 1;
           end
      endfunction : mhpm_counter_csr6
 //-------------------------MHPM_COUNTER_CSR7------------//
function void mhpm_counter_csr7(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB07 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB07]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_7 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB07]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_7 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB07]))
        end
  
//write
        if(seq_in.csr_addr_in==12'hB07 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB07] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_7 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB07]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][7] && mem[12'h327]!=0) begin
           mem[12'hB07]+= 1;
           end
      endfunction : mhpm_counter_csr7
 
 //-------------------------MHPM_COUNTER_CSR8------------//
function void mhpm_counter_csr8(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB08 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB08]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_8 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB08]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_8 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB08]))
        end
       
//write
        if(seq_in.csr_addr_in==12'hB08 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB08] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_8 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB08]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][8] && mem[12'h328]!=0) begin
           mem[12'hB08]+= 1;
           end
         endfunction :  mhpm_counter_csr8

 //-------------------------MHPM_COUNTER_CSR9------------//
function void mhpm_counter_csr9(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB09 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB09]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_9 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB09]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_9 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB09]))
        end
//write
        if(seq_in.csr_addr_in==12'hB09 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB09] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_9 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB09]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][9] && mem[12'h329]!=0) begin
           mem[12'hB09]+= 1;
           end

         endfunction :  mhpm_counter_csr9
 //-------------------------MHPM_COUNTER_CSR10------------//
function void mhpm_counter_csr10(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0A && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0A]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_10 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0A]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_10 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0A]))
        end
       	
//write
        if(seq_in.csr_addr_in==12'hB0A && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0A] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_10 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0A]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][10] && mem[12'h32A]!=0) begin
           mem[12'hB0A]+= 1;
           end

         endfunction :  mhpm_counter_csr10
 //-------------------------MHPM_COUNTER_CSR11------------//
function void mhpm_counter_csr11(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0B && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0B]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_11 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0B]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_11 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0B]))
        end
     
//write
        if(seq_in.csr_addr_in==12'hB0B && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0B] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_11 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0B]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][11] && mem[12'h32B]!=0) begin
           mem[12'hB0B]+= 1;
           end

         endfunction :  mhpm_counter_csr11
 //-------------------------MHPM_COUNTER_CSR12------------//
function void mhpm_counter_csr12(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0C && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0C]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_12 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0C]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_12 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0C]))
        end
        
       //write
        if(seq_in.csr_addr_in==12'hB0C && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0C] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_12 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0C]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][12] && mem[12'h32C]!=0) begin
           mem[12'hB0C]+= 1;
           end

         endfunction :  mhpm_counter_csr12
 //-------------------------MHPM_COUNTER_CSR13------------//
function void mhpm_counter_csr13(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0D && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0D]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_13 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0D]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_13 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0D]))
        end

      //write
        if(seq_in.csr_addr_in==12'hB0D && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0D] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_13 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0D]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][13] && mem[12'h32D]!=0) begin
           mem[12'hB0D]+= 1;
           end

         endfunction :  mhpm_counter_csr13
 //-------------------------MHPM_COUNTER_CSR14------------//
function void mhpm_counter_csr14(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0E && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0E]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_14 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0E]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_14 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0E]))
        end
        
      //write
        if(seq_in.csr_addr_in==12'hB0E && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0E] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_14 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0E]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][14] && mem[12'h32E]!=0) begin
           mem[12'hB0E]+= 1;
           end

         endfunction :  mhpm_counter_csr14
 //-------------------------MHPM_COUNTER_CSR15------------//
function void mhpm_counter_csr15(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB0F && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB0F]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_15 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0F]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_15 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB0F]))
        end
        
//write
        if(seq_in.csr_addr_in==12'hB0F && seq_in.csr_write_en_in)	
        begin
           mem[12'hB0F] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_15 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB0F]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][15] && mem[12'h32F]!=0) begin
           mem[12'hB0F]+= 1;
           end

         endfunction :  mhpm_counter_csr15
 //-------------------------MHPM_COUNTER_CSR16------------//
function void mhpm_counter_csr16(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB10 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB10]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_16 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB10]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_16 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB10]))
        end
        
       //write
        if(seq_in.csr_addr_in==12'hB10 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB10] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_16 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB10]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][16] && mem[12'h330]!=0) begin
           mem[12'hB10]+= 1;
           end

         endfunction :  mhpm_counter_csr16
 //-------------------------MHPM_COUNTER_CSR17------------//
function void mhpm_counter_csr17(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB11 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB11]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_17 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB11]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_17 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB11]))
        end
        
//write
        if(seq_in.csr_addr_in==12'hB11 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB11] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_17 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB11]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][17] && mem[12'h331]!=0) begin
           mem[12'hB11]+= 1;
           end

         endfunction :  mhpm_counter_csr17

 //-------------------------MHPM_COUNTER_CSR18------------//
function void mhpm_counter_csr18(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB12 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB12]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_18 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB12]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_18 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB12]))
        end
      
//write
        if(seq_in.csr_addr_in==12'hB12 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB12] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_18 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB12]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][18] && mem[12'h332]!=0) begin
           mem[12'hB12]+= 1;
           end

         endfunction :  mhpm_counter_csr18

 //-------------------------MHPM_COUNTER_CSR19------------//
function void mhpm_counter_csr19(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB13 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB13]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_19 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB13]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_19 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB13]))
        end
//write
        if(seq_in.csr_addr_in==12'hB13 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB13] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_19 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB13]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][19] && mem[12'h333]!=0) begin
           mem[12'hB13]+= 1;
           end

         endfunction :  mhpm_counter_csr19

 //-------------------------MHPM_COUNTER_CSR20------------//
function void mhpm_counter_csr20(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB14 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB14]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_20 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB14]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_20 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB14]))
        end
      
      //write
        if(seq_in.csr_addr_in==12'hB14 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB14] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_20 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB14]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][20] && mem[12'h334]!=0) begin
           mem[12'hB14]+= 1;
           end

         endfunction :  mhpm_counter_csr20

 //-------------------------MHPM_COUNTER_CSR21------------//
function void mhpm_counter_csr21(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB15 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB15]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_21 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB15]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_21 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB15]))
        end
   
//write
        if(seq_in.csr_addr_in==12'hB15 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB15] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_21 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB15]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][21] && mem[12'h335]!=0) begin
           mem[12'hB15]+= 1;
           end

         endfunction :  mhpm_counter_csr21

 //-------------------------MHPM_COUNTER_CSR22------------//
function void mhpm_counter_csr22(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB16 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB16]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_22 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB16]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_22 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB16]))
        end
//write
        if(seq_in.csr_addr_in==12'hB16 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB16] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_22 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB16]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][22] && mem[12'h336]!=0) begin
           mem[12'hB16]+= 1;
           end

         endfunction :  mhpm_counter_csr22

 //-------------------------MHPM_COUNTER_CSR23------------//
function void mhpm_counter_csr23(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB17 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB17]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_23 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB17]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_23 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB17]))
        end
    
//write
        if(seq_in.csr_addr_in==12'hB17 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB17] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_23 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB17]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][23] && mem[12'h337]!=0) begin
           mem[12'hB17]+= 1;
           end

         endfunction :  mhpm_counter_csr23

 //-------------------------MHPM_COUNTER_CSR24------------//
function void mhpm_counter_csr24(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB18 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB18]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_24 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB18]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_24 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB18]))
        end
  
//write
        if(seq_in.csr_addr_in==12'hB18 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB18] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_24 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB18]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][24] && mem[12'h338]!=0) begin
           mem[12'hB18]+= 1;
           end

         endfunction :  mhpm_counter_csr24

 //-------------------------MHPM_COUNTER_CSR25------------//
function void mhpm_counter_csr25(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB19 && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB19]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_25 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB19]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_25 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB19]))
        end
//write
        if(seq_in.csr_addr_in==12'hB19 && seq_in.csr_write_en_in)	
        begin
           mem[12'hB19] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_25 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB19]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][25] && mem[12'h339]!=0) begin
           mem[12'hB19]+= 1;
           end

         endfunction :  mhpm_counter_csr25

 //-------------------------MHPM_COUNTER_CSR26------------//
function void mhpm_counter_csr26(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1A && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1A]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_26 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1A]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_26 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1A]))
        end
    
//write
        if(seq_in.csr_addr_in==12'hB1A && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1A] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_26 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1A]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][26] && mem[12'h33A]!=0) begin
           mem[12'hB1A]+= 1;
           end

         endfunction :  mhpm_counter_csr26

 //-------------------------MHPM_COUNTER_CSR27------------//
function void mhpm_counter_csr27(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1B && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1B]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_27 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1B]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_27 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1B]))
        end
  
//write
        if(seq_in.csr_addr_in==12'hB1B && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1B] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_27 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1B]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][27] && mem[12'h33B]!=0) begin
           mem[12'hB1B]+= 1;
           end

         endfunction :  mhpm_counter_csr27

 //-------------------------MHPM_COUNTER_CSR28------------//
function void mhpm_counter_csr28(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1C && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1C]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_28 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1C]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_28 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1C]))
        end
   
//write
        if(seq_in.csr_addr_in==12'hB1C && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1C] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_28 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1C]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][28] && mem[12'h33C]!=0) begin
           mem[12'hB1C]+= 1;
           end

         endfunction :  mhpm_counter_csr28

 //-------------------------MHPM_COUNTER_CSR29------------//
function void mhpm_counter_csr29(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1D && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1D]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_29 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1D]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_29 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1D]))
        end
//write
        if(seq_in.csr_addr_in==12'hB1D && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1D] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_29 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1D]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][29] && mem[12'h33D]!=0) begin
           mem[12'hB1D]+= 1;
           end

         endfunction :  mhpm_counter_csr29

 //-------------------------MHPM_COUNTER_CSR30------------//
function void mhpm_counter_csr30(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1E && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1E]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_30 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1E]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_30 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1E]))
        end
   
//write
        if(seq_in.csr_addr_in==12'hB1E && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1E] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_30 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1E]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][30] && mem[12'h33E]!=0) begin
           mem[12'hB1E]+= 1;
           end

         endfunction :  mhpm_counter_csr30

 //-------------------------MHPM_COUNTER_CSR31------------//
function void mhpm_counter_csr31(csr_seqitem seq_in);
       
       //read
        if(seq_in.csr_addr_in ==12'hB1F && seq_in.csr_read_en_in) 
		begin
	  if(mem[12'hB1F]===seq_in.csr_read_data_o)
	    `uvm_info("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_31 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1F]), UVM_MEDIUM)
	  else
	    `uvm_error("MHPM COUNTER CSR",$sformatf("MHPMCOUNTER_31 rtl_csr_read_data : %0h ref_csr_read_data : %0h",seq_in.csr_read_data_o,mem[12'hB1F]))
        end
      
//write
        if(seq_in.csr_addr_in==12'hB1F && seq_in.csr_write_en_in)	
        begin
           mem[12'hB1F] = seq_in.csr_write_data_in;
           `uvm_info("MHPM_COUNTER_CSR",$sformatf("MHPMCOUNTER_31 WRITE OPERATION,ref_csr_write:%0h",mem[12'hB1F]), UVM_MEDIUM)
	     end
    
      else if(!mem[12'h320][31] && mem[12'h33F]!=0) begin
           mem[12'hB1F]+= 1;
           end

         endfunction :  mhpm_counter_csr31
endclass



