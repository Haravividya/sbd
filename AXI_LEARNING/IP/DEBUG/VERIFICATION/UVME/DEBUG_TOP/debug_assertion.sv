
 property p1;
    @(posedge pclock)  dmcontrol_reg[0]&&dmcontrol_reg[31] |-> haltreq ; 
 endproperty

 property p2;
   @(posedge pclock) dmcontrol_reg[0]&&dmcontrol_reg[29] |=> h_reset ;  
 endproperty

 property p3;
   @(posedge pclock) dmcontrol_reg[0] && dmcontrol_reg[30] |-> resumereq ; 
 endproperty

 property p4;
   @(posedge pclock) dmcontrol_reg[0] && dmcontrol_reg[3] |-> setresethaltreq && resethaltreq ; 
 endproperty

 property p5;
   @(posedge pclock) dmcontrol_reg[0] && dmcontrol_reg[2] |-> clrresethaltreq && !resethaltreq ; 
 endproperty

 property p6;
   @(posedge pclock) dmcontrol_reg[0] && dmcontrol_reg[1] |-> ndmreset ; 
 endproperty

 property p7;
   @(posedge pclock) !dmcontrol_reg[0] |=> (dmstatus_reg == 32'h00000CA0); 
 endproperty
 
 property p8;
    @(posedge pclock) ( haltreq && (fsm_state == 4'h0 || fsm_state == 4'h1)) |=> (fsm_state == 4'h2) ;  
 endproperty

 property p9;
    @(posedge pclock) h_reset |-> (fsm_state == 4'h1) ;  
 endproperty
  
 assert property(p1); 
 assert property(p2); 
 assert property(p3);
 assert property(p4); 
 assert property(p5); 
 assert property(p6); 
 assert property(p7); 
 assert property(p8); 
 assert property(p9); 
 assert property( @(posedge pclock) (resumereq && fsm_state == 4'h2) |=> (fsm_state == 4'h0 )) ;
 assert property( @(posedge pclock)  ndmreset  |=> (fsm_state == 4'h1 )) ;
 assert property( @(posedge pclock)  (fsm_state == 4'h1 && resethaltreq &&  !dmcontrol_reg[29] && !ndmreset  )  |=> (fsm_state == 4'h2 )) ;
 
 assert property( @(posedge pclock) (haltreq) |-> ##2 (dmstatus_reg[9:8]==2'b11)  ) ;
 assert property( @(posedge pclock) (resumereq && fsm_state == 4'h2 ) |-> ##2 (dmstatus_reg[17:16]==2'b11)  ) ;
 assert property( @(posedge pclock) (h_reset && !ndmreset && (!dmcontrol_reg[28]) ) |=> (dmstatus_reg[19:18]==2'b11 && dmstatus_reg[13:12] == 2'b11 && dmstatus_reg[11:8]==4'b0000 )  ) ;
 assert property( @(posedge pclock) (ndmreset && (!dmcontrol_reg[29]) && (!dmcontrol_reg[28])) |-> ##2 (dmstatus_reg[13:12] == 2'b11 && dmstatus_reg[11:8]==4'b0000 )  ) ;
 assert property( @(posedge pclock) (ndmreset) |=>  (dmstatus_reg[24]==1'b1 && dmstatus_reg[19:18]==2'b11 ) ) ;
 assert property( @(posedge pclock)  (command_reg[31:24]== 8'h0 && (command_reg[22:20]==3 || command_reg[22:20]==2) &&command_reg[17:16]==2'b11) |=>  (debug_reg_write_enable) ) ; 
 assert property( @(posedge pclock)  (command_reg[31:24]== 8'h0 && (command_reg[22:20]==3 || command_reg[22:20]==2) &&command_reg[17:16]==2'b10) |=>  (debug_reg_read_enable ) ) ; 
 assert property( @(posedge pclock)  (command_reg[31:24]== 8'h2 && (command_reg[22:20] >= 0 && command_reg[22:20] <=3) &&command_reg[16]==0) |->  ##[0:2](debug_mem_read_enable ) ) ; 
 assert property( @(posedge pclock)  (command_reg[31:24]== 8'h2 && (command_reg[22:20] >= 0 && command_reg[22:20] <=3) &&command_reg[16]==1) |->  ##[0:2](debug_mem_write_enable)  ) ; 
 assert property( @(posedge pclock)  (command_reg[17]==1'b0) |=>  (!debug_reg_read_enable && !debug_reg_write_enable )) ; 
 assert property( @(posedge pclock)  (dmcontrol_reg[28] && dmcontrol_reg[0]) |=>  (dmstatus_reg[19:18] == 2'b00 ) ) ; 
 assert property( @(posedge pclock)  ((command_reg[31:24] == 8'h2) && command_reg[19] && fsm_state == 6) |-> (data2_reg == ($past(data2_reg) + (2 ** command_reg[22:20])))); 
 
 //when fsm is in halted state , if command reg is not zero , then the command will start to execute
 assert property( @(posedge pclock)  ( command_reg != 0 && fsm_state ==2 ) |=>  (fsm_state == 3 )) ; 
 assert property( @(posedge pclock)  ( fsm_state == 3 && abstractcs_reg[10:8] != 0 ) |-> ##1 (fsm_state == 7)) ; 
 assert property( @(posedge pclock)  ( fsm_state == 3 && abstractcs_reg[10:8] ==0 && command_reg[17]==1'b1 ) |-> ##1 (fsm_state == 4)) ; 
 assert property( @(posedge pclock)  ( fsm_state == 3 && abstractcs_reg[10:8] ==0 && command_reg[17]==1'b0 ) |-> ##1 (fsm_state == 6)) ; 
 assert property( @(posedge pclock)  ( fsm_state == 4 ) |=> (fsm_state == 6)) ; 
 assert property( @(posedge pclock)  ( fsm_state == 6 && exception ) |=>  (fsm_state == 7)) ; 
 assert property( @(posedge pclock)  ( fsm_state == 6 && !exception ) |=>  (fsm_state == 2)) ; 
 assert property( @(posedge pclock)  ( !dmcontrol_reg[0] ) |=> (fsm_state == 0)) ;

//fsm state based:

 assert property( @(posedge pclock)  fsm_state == 0 && (!ndmreset) |=>  dmstatus_reg[11:10]== 2'b11 ) ;
 assert property( @(posedge pclock)  fsm_state == 2 |=>  dmstatus_reg[9:8] == 2'b11 ) ;
 assert property( @(posedge pclock)  fsm_state == 1 && !dmcontrol_reg[28] |=>  dmstatus_reg[19:18] == 2'b11 && dmstatus_reg[13:12] == 2'b11 ) ;
 assert property( @(posedge pclock)  ( $rose(dmstatus_reg[9:8])) |-> (dmstatus_reg[11:10] == 2'b00 && dmstatus_reg[13:12] == 2'b00 )) ;
 assert property( @(posedge pclock)  ( $rose(dmstatus_reg[11:10])) |-> (dmstatus_reg[9:8] == 2'b00 && dmstatus_reg[13:12] == 2'b00 )) ;
 assert property( @(posedge pclock)  ( $rose(dmstatus_reg[13:12])) |-> (dmstatus_reg[9:8] == 2'b00 && dmstatus_reg[11:10] == 2'b00 )) ;
 //ebreak and step
 assert property( @(posedge pclock)  ( (ebreak || step ) &&fsm_state ==0  ) |=> ( fsm_state == 2)) ;
