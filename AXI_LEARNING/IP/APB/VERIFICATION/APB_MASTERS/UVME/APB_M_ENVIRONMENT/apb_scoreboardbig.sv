class apb_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(apb_scoreboard)
 
  uvm_analysis_imp #(apb_item,apb_scoreboard) analysis_imp_scoreboard;
 
  apb_item item;
  
 
  function new(string name, uvm_component parent);                       //  new  funcion
    super.new(name,parent);
  endfunction
 
 
  function void build_phase(uvm_phase phase);
    analysis_imp_scoreboard = new("analysis_imp_scoreboard",this);      //  build phase
  endfunction

extern task apb_logic(apb_item item);

////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////  
  
  function void write(apb_item item);                                    // write function 
    //que.push_back(pkg); 
	item.print();
  endfunction 
 

task run_phase(uvm_phase phase);                                      // run phase
  forever
    begin
     apb_logic(item);
     if(item.psel1==psel1 && item.psel2 == psel2 && item.penable == penable && item.pwrite == pwrite && item.pwdata == pwdata && item.paddr == paddr && item.apb_read_data_out == apb_read_data_out)
       begin
       `uvm_info("check",$sformatf("*********Data Matched*********"),UVM_LOW)
       end
     else
       begin
        `uvm_info("check",$sformatf("*********Data Missmatched*********"),UVM_LOW)
       end   
     end	
  endtask 

endclass

task apb_scoreboard::apb_logic(apb_item item);
  logic pready;
  logic pslverr;
  logic [31:0] prdata;
  logic psel1;
  logic psel2;
  logic [31:0] apb_write_data;
  logic [31:0] apb_write_paddr;
  logic [31:0] apb_read_paddr;
  logic read_write;
  logic transfer;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] apb_read_data_out;
////////////////////////////////////////////////////////////
  logic [2:0] present_state;
  logic [2:0] next_state;

// PARAMETERS DECLARATION FOR OPERATING STATES IN APB
reg [2:0] IDLE = 3'b001; 
reg [2:0] SETUP = 3'b010;
reg [2:0] ACCESS = 3'b100 ;



   pready = item.pready;
   pslverr = item.pslverr;
   prdata = item.prdata;
   apb_write_data = item.apb_write_data;
   apb_write_paddr = item.apb_write_paddr;
   apb_read_paddr = item.apb_read_paddr;
   read_write = item.read_write;
   transfer = item.transfer;

//FSM OPERATING STATES LOGIC
	/*begin
		if(!presetn)
			present_state <= IDLE;
		else
			present_state<= next_state; 
	end*/
	
	//begin
		if(!item.presetn)
			begin
			next_state = IDLE;
			end
		else
			begin
				pwrite = ~read_write;
				case(present_state)
                  
				IDLE:	begin 
							penable =0;
							if(!transfer)
								next_state = IDLE ;
							else
								next_state = SETUP;
						end

				SETUP:  begin
							penable=0;

							if(read_write) 
								begin   
									paddr = apb_read_paddr;
								end
							else 
								begin   			       
									paddr = apb_write_paddr;
									pwdata = apb_write_data;
								end			    
									if(transfer && !pslverr)
										begin
											next_state = ACCESS;
										end
									else
										begin
											next_state = IDLE;
										end
						end

				ACCESS:	begin
							if(psel1|| psel2)
								penable=1;
								if(transfer & !pslverr)
									begin
										if(pready)
											begin
												if(!read_write)
													begin			          
														next_state = SETUP;
													end
												else 
													begin
														next_state = SETUP; 			          	   
														apb_read_data_out = prdata; 
													end
											end
										else next_state = ACCESS;
									end
							else next_state = IDLE;
						end
			 
				default: next_state = IDLE; 
               	endcase
           // end
    end

//PSELX LOGIC FOR SELECTING SLAVE
//assign {psel1,psel2} = ((present_state != IDLE) ? (paddr[31] ? {1'b0,1'b1} : {1'b1,1'b0}) : 2'd0);

endtask :apb_logic






/*
task apb_logic(input logic pready,input logic pslverr,input logic [31:0] prdata, output logic psel1 ,output logic psel2 , input logic [31:0] apb_write_data , input logic [31:0] apb_write_paddr , input logic [31:0] apb_read_paddr, input logic read_write , input logic transfer , output logic penable , output logic pwrite , output logic [31:0] paddr , output logic [31:0] pwdata , output logic [31:0] apb_read_data_out );
  logic pready;
  logic pslverr;
  logic [31:0] prdata;
  logic psel1;
  logic psel2;
  logic [31:0] apb_write_data;
  logic [31:0] apb_write_paddr;
  logic [31:0] apb_read_paddr;
  logic read_write;
  logic transfer;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] apb_read_data_out;
////////////////////////////////////////////////////////////

logic [2:0] present_state,next_state;

// PARAMETERS DECLARATION FOR OPERATING STATES IN APB
localparam IDLE = 3'b001, SETUP = 3'b010, ACCESS = 3'b100 ;

//FSM OPERATING STATES LOGIC
	begin
		if(!presetn)
			present_state <= IDLE;
		else
			present_state<= next_state; 
	end
	
	begin
		if(!presetn)
			next_state = IDLE;
		else
			begin
				pwrite = ~read_write;
				case(present_state)
                  
				IDLE:	begin 
							penable =0;
							if(!transfer)
								next_state = IDLE ;
							else
								next_state = SETUP;
						end

				SETUP:  begin
							penable=0;

							if(read_write) 
								begin   
									paddr = apb_read_paddr;
								end
							else 
								begin   			       
									paddr = apb_write_paddr;
									pwdata = apb_write_data;
								end			    
									if(transfer && !pslverr)
										begin
											next_state = ACCESS;
										end
									else
										begin
											next_state = IDLE;
										end
						end

				ACCESS:	begin
							if(psel1|| psel2)
								penable=1;
								if(transfer & !pslverr)
									begin
										if(pready)
											begin
												if(!read_write)
													begin			          
														next_state = SETUP;
													end
												else 
													begin
														next_state = SETUP; 			          	   
														apb_read_data_out = prdata; 
													end
											end
										else next_state = ACCESS;
									end
							else next_state = IDLE;
						end
			 
				default: next_state = IDLE; 
               	endcase
            end
    end

//PSELX LOGIC FOR SELECTING SLAVE
assign {psel1,psel2} = ((present_state != IDLE) ? (paddr[31] ? {1'b0,1'b1} : {1'b1,1'b0}) : 2'd0);


endtask	*/	


