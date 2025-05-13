class wdt_wait_test extends uvm_test;

  `uvm_component_utils(wdt_wait_test)

  wdt_env wdt_en;
  wdt_wait_seq wdt_seq;
  logic [15:0] test_timer;
  int test_case;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    wdt_en = wdt_env::type_id::create("wdt_en",this);

  endfunction

  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
    begin

      wdt_seq = wdt_wait_seq::type_id::create("wdt_seq",this);
     // test_timer    = 16'h0010;
      wdt_seq.tmr = test_timer;
      if($value$plusargs("TEST_CASE=%d",test_case)==32)
      begin
      wdt_seq.case_sel = test_case;
      wdt_seq.start(wdt_en.wdt_agn.wdt_seqcr);
      repeat(100)@(posedge wdt_en.wdt_agn.wdt_drv.wdt_vif.clk);
      end
      else if($value$plusargs("TEST_CASE=%d",test_case))
      begin
      wdt_seq.case_sel = test_case;
      wdt_seq.start(wdt_en.wdt_agn.wdt_seqcr);
      repeat(100)@(posedge wdt_en.wdt_agn.wdt_drv.wdt_vif.clk);
      end
 
      else
      begin
        `uvm_error("Test Case",$sformatf("Invalid test case"))
      end


    end
    phase.drop_objection(this);

  endtask

endclass
