
//apb_slave1_scoreboard

 //Step1 : Create a new class that extends from uvm_scoreboard

 class apb_slave1_scoreboard extends uvm_scoreboard;
 
      `uvm_component_utils(apb_slave1_scoreboard)
 
       uvm_analysis_imp#(apb_slave1_seq_item, apb_slave1_scoreboard) item_collected_export;
 
       apb_slave1_seq_item data;
       
      
  
       logic pslverr1_sb;
       logic pready1_sb;
       logic [31:0] prdata1_sb;
  
       logic [31:0]reg_addr;
       logic [31:0] mem [0:255];
       logic [31:0] temp=0;

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
   
   
       virtual function void write(apb_slave1_seq_item data);
       begin
         // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 3"), UVM_LOW)
         // data.print();
         // `uvm_info( "flag",$sformatf("flag:%d" , flag), UVM_LOW)
       if(data.presetn==0)
           begin
              temp=0;
	      prdata1_sb  =temp;
              temp=0;
              pslverr1_sb =0;
              k=0;
              pready1_sb  =0;
         
              for(i=0;i<256;i=i+1)
	          begin
		     mem[i]=0;
	          end
               // `uvm_info("scb", $sformatf("SCOREBOARD CHECK 5"), UVM_HIGH)
           end
        
       if(data.presetn==1 && data.psel1==1 && data.penable==1)
           begin
	      if(data.paddr<32'h00000100)
	          begin
                     if(data.pwrite==1)
	                begin
                          mem[data.paddr] = data.pwdata;
	                end
	             else
	                begin 
                          prdata1_sb=temp;
                          temp = mem[data.paddr];
                        end
                 end
          end 
		    
			 
       if(data.presetn==1 && data.psel1==1 && data.penable==1)
           begin
	      pready1_sb  =1;
           end
        else
           begin
              pready1_sb  =0;
            end

	if(data.presetn==1 && data.psel1==1 && data.penable==1)
            begin
	       if(data.paddr>=32'h00000100)
	          begin
                     if(data.pwrite==0)
	                 begin
                            prdata1_sb=temp;
                            temp=flag;
                         end
                 end
	   end


         if(prdata1_sb === data.prdata1) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("prdata::: Expected-SCB:%d ,Actual-DUT:%d" , prdata1_sb ,data.prdata1), UVM_LOW)
             end
          else
             begin
               `uvm_error("MYERR",$sformatf("prdata::: Expected-SCB:%d ,Actual-DUT:%d" , prdata1_sb ,data.prdata1))      
              end


/*

           if(pslverr1_sb == data.pslverr1) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("pslverr::: Expected-SCB:%d ,Actual-DUT:%d" , pslverr1_sb ,data.pslverr1), UVM_LOW)
             end
            else
              begin
               `uvm_error("MYERR",$sformatf("pslverr::: Expected-SCB:%d ,Actual-DUT:%d" , pslverr1_sb ,data.pslverr1))      
               end
 */    
/*

	   if(pready1_sb == data.pready1) //scoreboard == DUT result
             begin                        
                `uvm_info( "PASSED",$sformatf("pready::: Expected-SCB:%d ,Actual-DUT:%d" , pready1_sb ,data.pready1), UVM_LOW)
             end
           else
              begin
               `uvm_error("MYERR",$sformatf("pready::: Expected-SCB:%d ,Actual-DUT:%d" , pready1_sb ,data.pready1))      
               end

*/
	 end
   endfunction : write
 
endclass : apb_slave1_scoreboard

