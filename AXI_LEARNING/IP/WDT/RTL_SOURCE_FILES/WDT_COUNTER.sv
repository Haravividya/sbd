module WDT_COUNTER
//#(parameter 16 = 16)
(
 input logic 			            wdt_clk		        ,
 input logic 			            wdt_rst		        ,
output  logic     [15:0] 	        wdt_counter		    , // Modulo Counter value
output  logic                       wdt_reset_o		    , // WDT Reset
output  logic                       wdt_interrupt_o	    , // WDT Interrupt Request
output  logic                       clear_event		    , // WDT status bit
 input logic                        reload_count	    , // Correct control words written
 input logic                        wdt_event		    , // Reset the WDT event register
 input logic                        debug_mode_i	    , // System DEBUG Mode
 input logic                        debug_enable	    , // Enable WDT in system debug mode
 input logic                        wait_enable		    , // Enable WDT in system wait mode
 input logic                        wait_mode_i		    , // System WAIT Mode
 input logic                        stop_enable		    , // Enable WDT in system stop mode
 input logic                        stop_mode_i		    , // System STOP Mode
 input logic                        wdt_enable		    , // Enable WDT Timout Counter
 input logic      [1:0]             wdt_interrupt_sel   , // WDT IRQ Enable/Value
 input logic      [15:0] 	        timeout_value	      // WDT Counter initial value
);

 logic 			        stop_counter	; // Enable WDT because of external inputs
 logic 			        event_reset		; // Clear WDT event status bit
 logic  			    wdt_irq_dec		; // WDT Interrupt Request Decode
 logic  			    wdt_irq		    ; // WDT Interrupt Request
 logic  			    reload_1		; // Resync register for commands crossing from bus_clk domain to cop_clk domain
 logic  			    reload_2		; //

  
assign event_reset  = reload_count || wdt_event;//to reset the count
assign stop_counter = (debug_mode_i && debug_enable) || (wait_mode_i && wait_enable) || (stop_mode_i && stop_enable) || (!wdt_enable) ; // to stop the counter

//  Watchdog Timout Counter
always_ff @(posedge wdt_clk or negedge wdt_rst)
begin
    if (!wdt_rst)
    begin
      wdt_counter  	<= {16{1'b1}}		;
    end
    else if(reload_1)
    begin
      wdt_counter  	<= timeout_value	;
    end
    else if (!stop_counter)
    begin
      wdt_counter  	<= wdt_counter - 1'b1	;
    end
end

  //  wdt reset Output Register
always_ff @(posedge wdt_clk or negedge wdt_rst)
begin
  if ( !wdt_rst )
  begin
    wdt_reset_o 	<= 1'b0			;
  end
  else if ( reload_1 )
  begin
    wdt_reset_o 	<= 1'b0			;
  end
  else
  begin
    wdt_reset_o 	<= (wdt_counter == {16{1'b0}})	;
  end
end

  // Stage one of pulse strecher and resync
  always_ff @(posedge wdt_clk or negedge wdt_rst)
  begin
    if ( !wdt_rst )
    begin
      reload_1 		<= 1'b0			;
    end
    else
    begin
      reload_1 		<= ( reload_count || !wdt_enable) || (reload_1 && !reload_2);
    end
  end

  // Stage two pulse strecher and resync
  always_ff @(posedge wdt_clk or negedge wdt_rst)
  begin
    if ( !wdt_rst )
    begin
      reload_2 		<= 1'b1			;
    end
    else
    begin
      reload_2 		<= reload_1		;
    end
  end



  // Decode WDT Interrupt Request
  always_comb
    unique case (wdt_interrupt_sel) // synopsys parallel_case
       2'b01  : wdt_irq_dec 	= (wdt_counter <= 16'd16);
       2'b10  : wdt_irq_dec 	= (wdt_counter <= 16'd32);
       2'b11  : wdt_irq_dec 	= (wdt_counter <= 16'd64);
       default: wdt_irq_dec 	= 1'b0			 ;
    endcase

  //  Watchdog Interrupt and resync
  always_ff @(posedge wdt_clk or negedge wdt_rst)
  begin
    if ( !wdt_rst )
      begin
        wdt_irq   	    <= 1'b0		;
        wdt_interrupt_o <= 1'b0		;
      end
    else
      begin
        wdt_irq   	    <= wdt_irq_dec  ;
        wdt_interrupt_o <= wdt_irq	    ;
      end
end

  //  Watchdog Status Bit
  always_ff @(posedge wdt_clk or negedge wdt_rst)
    if ( !wdt_rst )
      clear_event 	<= 1'b0;
    else
      clear_event 	<= wdt_reset_o || (clear_event && !event_reset);



endmodule

