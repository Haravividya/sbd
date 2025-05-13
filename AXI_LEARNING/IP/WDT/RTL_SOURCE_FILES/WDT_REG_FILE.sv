module WDT_REG_FILE
(
    input       logic 		        wdt_clk		    ,
    input       logic 		        wdt_rst		    ,//global asyc reset
    input       logic [1:0] 	    wdt_reg_addr	,
    input       logic [15:0] 	    wdt_reg_data	,
    output 		logic               wdt_enable		,//to enable the WDT counter to decrement its value bit 2
    output 		logic               debug_enable	,//stop the counter decrement in debug mode	    bit 5
    output 		logic               wait_enable		,//halt the counter decrement			    bit 3
    output 		logic               stop_enable		,//to stop the counter decrement		    bit 4
    input       logic               clear_event		,//status of the WDT				    bit 8//clear event
    output      logic [1:0]         wdt_interrupt	,//to decide when the interrupt has to be generated bit 7:6
    output      logic [15:0]        timeout_limit	,//reset value of the watch dog counter
    output 		logic               reload_count	,//when two words are written to count: two service words 
    output 	    logic	            wdt_event      	 //8th bit in data bus when control register address is selected

);

localparam SERVICE_WORD_0 = 16'h5555 ;
localparam SERVICE_WORD_1 = 16'haaaa ;
logic wdt_protect;
logic wdt_lock;
logic service_wdt;


logic wdt_event_r;

assign wdt_event = clear_event ? 1'b0 : wdt_event_r;

always_ff@(posedge wdt_clk or negedge wdt_rst)
begin
	if(!wdt_rst)
	begin
		wdt_enable	    <= 1'b0;		 
		debug_enable	<= 1'b0; 
		wait_enable 	<= 1'b0;   
		stop_enable 	<= 1'b0; 
		wdt_interrupt	<= 2'b00;
		timeout_limit	<= 16'hffff;
		reload_count	<= 1'b0; 
		wdt_event_r 	<= 1'b0; 
		wdt_protect     <= 1'b0;
        wdt_lock       	<= 1'b0;
		service_wdt 	<= 1'b0;

	end
	else
	begin
		unique case(wdt_reg_addr)
			2'b00://editing the control bits of control registers
			begin
				wdt_event_r 	<= wdt_reg_data[8]	;
             			wdt_interrupt   <= wdt_reg_data[7:6]	;
             			debug_enable    <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[5]  : debug_enable	;
             			stop_enable     <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[4]  : stop_enable	;
             			wait_enable     <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[3]  : wait_enable	;
             			wdt_enable      <= wdt_protect  ?  wdt_enable 	     : wdt_reg_data[2]	;
             			wdt_protect     <= wdt_lock 	?  wdt_protect 	     : wdt_reg_data[1]	;
             			wdt_lock        <= wdt_lock 	|| wdt_reg_data[0]			;
			

			end
			2'b01://loading timeout limit
			begin
				timeout_limit  <= wdt_reg_data;
			end
			2'b10:
			begin
	     			service_wdt  <= (wdt_reg_data == SERVICE_WORD_0);
	     			reload_count <= service_wdt && (wdt_reg_data == SERVICE_WORD_1);

			end
			default:
			begin
				    reload_count <= 1'b0;
	     			wdt_event_r  <= 1'b0;

			end
		endcase
	end
end
endmodule
