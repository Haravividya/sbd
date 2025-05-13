//apb_slave2_scoreboard

 //Step1 : Create a new class that extends from uvm_scoreboard

 class apb_slave2_scoreboard extends uvm_scoreboard;
 
      `uvm_component_utils(apb_slave2_scoreboard)
 
       uvm_analysis_imp#(apb_slave2_seq_item, apb_slave2_scoreboard) item_collected_export;
 
       apb_slave2_seq_item data;
       

      // logic a=data.ADDR_WIDTH;
	  // int d=data.DATA_WIDTH;
      
     



  
       logic pslverr2_sb;
       logic pready2_sb;
       logic [data.DATA_WIDTH-1:0] prdata2_sb;
  
       logic [data.DATA_WIDTH-1:0]reg_addr;
       logic [data.DATA_WIDTH-1:0] mem [0:255];
       logic [data.DATA_WIDTH-1:0] temp=0;

       integer i,  flag;
       int k=0;
 
       // new - constructor
       function new (string name, uvm_component parent);
           super.new(name, parent);
           // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 1"), UVM_HIGH)
       endfunction : new
 
       function void build_phase(uvm_phase phase);
           super.build_phase(phase);
           item_collected_export = new("item_collected_export", this);
           // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 2"), UVM_HIGH)

       endfunction: build_phase

       task run_phase(uvm_phase phase);  //Run phase
         begin  
            $display("Empty Scoreboard");
         end
      endtask
   
   
       virtual function void write(apb_slave2_seq_item data);
       begin
         // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 3"), UVM_LOW)
             //data.print();

           // `uvm_info( "flag",$sformatf("flag:%d" , flag), UVM_LOW)
           if(data.presetn==0)
             
              begin

                temp=0;
	         	prdata2_sb  =temp;
                temp=0;
                pslverr2_sb =0;
                k=0;
		        pready2_sb  =0;
         

                for(i=0;i<256;i=i+1)
	              begin
		         	mem[i]=0;
	              end
             // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 5"), UVM_HIGH)

              end
        
            if(data.presetn==1 && data.psel2==1 && data.penable==1)
                begin
	               if(data.paddr< 'h100)
	                 begin
                       if(data.pwrite==1)
	                      begin
                             mem[data.paddr] = data.pwdata;
	                       end
	                   else
	                      begin
                             
                             prdata2_sb=temp;

                              temp = mem[data.paddr];
                          
                          end
                     end
               end
		    
			 
           if(data.presetn==1 && data.psel2==1 && data.penable==1)
              begin
	            pready2_sb  =1;
              end
           else
              begin
                pready2_sb  =0;
               // prdata1_sb  =0;
              end

     	      if(data.presetn==1 && data.psel2==1 && data.penable==1)
                begin
	               if(data.paddr>='h100)
	                 begin
                       if(data.pwrite==0)
	                      begin
                            prdata2_sb=temp;
                            temp=flag;
                           
                           end
                      end
                 end


           if(prdata2_sb === data.prdata2) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("prdata::: Expected-SCB:%d ,Actual-DUT:%d" , prdata2_sb ,data.prdata2), UVM_LOW)
             end
           else
              begin
               `uvm_error("MYERR",$sformatf("prdata::: Expected-SCB:%d ,Actual-DUT:%d" , prdata2_sb ,data.prdata2))      
               end


/*

            if(pslverr2_sb == data.pslverr2) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("pslverr::: Expected-SCB:%d ,Actual-DUT:%d" , pslverr2_sb ,data.pslverr2), UVM_LOW)
             end
            else
              begin
               `uvm_error("MYERR",$sformatf("pslverr::: Expected-SCB:%d ,Actual-DUT:%d" , pslverr2_sb ,data.pslverr2))      
               end
 */    
/*

	        if(pready2_sb == data.pready2) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("pready::: Expected-SCB:%d ,Actual-DUT:%d" , pready2_sb ,data.pready2), UVM_LOW)
             end
           else
              begin
               `uvm_error("MYERR",$sformatf("pready::: Expected-SCB:%d ,Actual-DUT:%d" , pready2_sb ,data.pready2))      
               end

*/
	 end
   endfunction : write
 
endclass : apb_slave2_scoreboard

