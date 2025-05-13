module wdt_top
(
    input logic  		    wdt_clk_i		,
    input logic  		    wdt_rst_i		,
    input logic   [1 :0] 	wdt_reg_addr	,
    input logic   [15:0] 	wdt_reg_data	,
    output logic  [15:0] 	wdt_counter		,
    output logic  	        wdt_reset_o		, // WDT reset output logic, active low
    output logic  	        wdt_interrupt_o	, // WDT interrupt request signal output logic
    input logic   	        stop_mode_i		, // System STOP Mode
    input logic  	 	    wait_mode_i		, // System WAIT Mode
    input logic   	        debug_mode_i		  // System DEBUG Mode
);


 logic    [15:0]	timeout_value	;		
 logic    [1:0] 	wdt_interrupt	;	
 logic 		        debug_enable 	;
 logic 		        stop_enable	    ;
 logic 		        wait_enable	    ;
 logic 		        reload_event	;
 logic		        wdt_event	    ;
 logic		        clear_event	    ;
 logic              reload_count    ;
 logic              wdt_enable      ; 

    WDT_COUNTER wdt_counter_inst
    (
        .*,
        .wdt_clk		(wdt_clk_i	), 				
        .wdt_rst		(wdt_rst_i	),
        /*
        .wdt_counter		(wdt_counter	),	
        .wdt_reset_o		(wdt_reset_o	),	
        .wdt_interrupt_o	(wdt_interrupt_o),	
        .clear_event		(clear_event	),	
        .reload_count		(reload_count	),
        .wdt_event		    (wdt_event	    ),	
        .debug_mode_i		(debug_mode_i	),
        .debug_enable		(debug_enable	),
        .wait_enable		(wait_enable	),	
        .wait_mode_i		(wait_mode_i	),	
        .stop_enable		(stop_enable	),	
        .stop_mode_i		(stop_mode_i	),	
        .wdt_enable		    (wdt_enable	    ),
        */
        .wdt_interrupt_sel	(wdt_interrupt	)  
        //.timeout_value	(timeout_value	)
    );
    
    
    WDT_REG_FILE wdt_reg_file_inst
    (
        .*,
        .wdt_clk	 (wdt_clk_i		),      				
        .wdt_rst	 (wdt_rst_i		),
        /*
        .wdt_reg_addr    (wdt_reg_addr		),//from top input logic	
        .wdt_reg_data	 (wdt_reg_data		),//from top input logic
        .wdt_enable	     (wdt_enable		),//to wdt counter       
        .debug_enable	 (debug_enable		),
        .wait_enable	 (wait_enable		),       
        .stop_enable	 (stop_enable		),       
        .wdt_event	     (wdt_event		),       
        .wdt_interrupt	 (wdt_interrupt		),
        */
        .timeout_limit	 (timeout_value		)//to wdt counter
        /*
        .reload_count	 (reload_count		),//to wdt counter
        .clear_event     (clear_event		) //to wdt counter
        */
    );







endmodule
