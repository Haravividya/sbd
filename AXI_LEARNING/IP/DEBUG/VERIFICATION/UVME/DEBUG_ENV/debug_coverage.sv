class debug_coverage extends uvm_subscriber#(debug_seq_item);
    
  `uvm_component_utils(debug_coverage)
  
  debug_seq_item  tx;
  
  // Covergroup 
covergroup cov_debug;

 data0_register      : coverpoint tx.data0_reg
    {
            bins other = {[0:$]}  ;
    }
   
    data1_register      : coverpoint tx.data1_reg
    {
            bins other = {[0:$]}  ;
    }

    
    data2_register      : coverpoint tx.data2_reg
    {
          
            bins other = {[0:$]}  ;
    }
    
    data3_register      : coverpoint tx.data3_reg
    {
           
            bins other = {[0:$]}  ;
    }

    cmd_type           : coverpoint tx.command_reg[31:24]
    {
            bins cmdtype_0 = {8'h0} ;
            bins cmdtype_2 = {8'h2} ;
            bins others = default ; 
    }
    
    aarsize             : coverpoint tx.command_reg[22:20] ;
    aampostincreament   : coverpoint tx.command_reg[19];
    transfer            : coverpoint tx.command_reg[17];
    write               : coverpoint tx.command_reg[16];
    regno               : coverpoint tx.command_reg[15:0] 
    {
            bins gpr[]    = { [16'h1000:16'h101f] } ;
			bins csr[]      =  {    16'h0f11, 
									16'h0f12,
									16'h0f13,
									16'h0f14,
									16'h0300,
									16'h0301,
									16'h0304,
									16'h0305,
									16'h0340,
									16'h0341,
									16'h0342,
									16'h0343,
									16'h0344,
									16'h0b00, 
									[16'h0b02 :  16'h0b1f], 
									16'h0320,
									[16'h0323  : 16'h033f ],
									16'h0bc0,
									16'h0fc0,
									16'h0fc1,
                                    16'h07b0 ,
                                    16'h07b1 } ;
    }

    corss_cmd_aarsize_write_regno  : cross cmd_type ,aarsize , write, regno 
    {
      //  ignore_bins cmdtype2_other = !binsof(cmd_type.cmdtype_0) ; 
       // ignore_bins aars = !binsof(aarsize) intersect {[3:4]}  ;

        ignore_bins   cmd_aarsize = !binsof(cmd_type.cmdtype_0) || ( !binsof(aarsize) intersect {[2:3]} ) ;
    }


    cross_cmdtype_aamsize_write : cross cmd_type , aarsize , write{
            ignore_bins  cmdtype2  = !binsof(cmd_type.cmdtype_2) ; 

    }
    cross_cmdtype_aarsize_write      : cross cmd_type , aarsize, write {
            ignore_bins cmdtype_0 = !binsof(cmd_type.cmdtype_0 ) ;
            
   }  
    
   busy                 : coverpoint tx.abstractcs_reg[12] ;
   cmderr               : coverpoint tx.abstractcs_reg[10:8] {
        
    bins cmderr2     = {2} ; 
    bins cmderr3     = {3} ;
    bins cmderr4     = {4} ;

   }

   ndmresetpending      : coverpoint tx.dmstatus_reg[24] ;
   havereset            : coverpoint tx.dmstatus_reg[19:18]{
        
        bins Nohavereset = {0} ; 
        bins allany = {3} ;
   }


    resumeack            : coverpoint tx.dmstatus_reg[17:16]{
        
        bins NoResumeAck = {0} ; 
        bins allany= {3} ;
   }


    unavail            : coverpoint tx.dmstatus_reg[13:12]{
        
        bins NoUnavail = {0} ; 
        bins allany= {3} ;
   }

   running            : coverpoint tx.dmstatus_reg[11:10]{
        
        bins NoRunning = {0} ; 
        bins allany= {3} ;
   }

     halted           : coverpoint tx.dmstatus_reg[9:8]{
        
        bins NoHalted = {0} ; 
        bins allany= {3} ;
   }

    version          : coverpoint tx.dmstatus_reg[3:0]
    {
        
        bins version1_0= {3} ;
        bins No_DM= {0} ;
     }
    

     haltreq    : coverpoint tx.dmcontrol_reg[31] ;
     resumereq  : coverpoint tx.dmcontrol_reg[30] ; 
     hartreset  : coverpoint tx.dmcontrol_reg[29] ; 
     ackhartreset  : coverpoint tx.dmcontrol_reg[28] ; 
     setresethaltreq  : coverpoint tx.dmcontrol_reg[3] ; 
     clrresethaltreq  : coverpoint tx.dmcontrol_reg[2] ; 
     ndmreset  : coverpoint tx.dmcontrol_reg[1] ; 
     dmactive  : coverpoint tx.dmcontrol_reg[0] ;
 
     exception  : coverpoint tx.exception  ;
     ebreak     : coverpoint tx.ebreak     ;
     step       : coverpoint tx.step       ;

endgroup

  function new(string name = "debug_cov", uvm_component parent);
    super.new(name,parent);
    cov_debug = new() ;
  endfunction 

function void write(input debug_seq_item t);
      tx = new() ; // seq_item;
      $cast(tx, t);
      cov_debug.sample();
  endfunction

endclass:debug_coverage
