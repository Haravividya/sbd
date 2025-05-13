class wdt_test extends uvm_test;

  `uvm_component_utils(wdt_test)

  wdt_env wdt_en;
  wdt_sequence wdt_seq;
  logic [15:0] test_timer;
  logic [15:0] test_timer1;
 // logic [15:0] test_timer2;
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

      wdt_seq = wdt_sequence::type_id::create("wdt_seq",this);
      test_timer    = 16'h0010;
      wdt_seq.timer = test_timer;
      if(($value$plusargs("TEST_CASE=%d",test_case)<=9))
      begin
       // test_timer    = 16'h0010;
       // wdt_seq.timer = test_timer;
        wdt_seq.case_sel = test_case;
        wdt_seq.start(wdt_en.wdt_agn.wdt_seqcr);
        repeat(100)@(posedge wdt_en.wdt_agn.wdt_drv.wdt_vif.clk);
      end
      else if($value$plusargs("TEST_CASE=%d",test_case))
      begin
       //test_timer1 = ($urandom_range(16'h0000,16'hFFFC));
        wdt_seq.timer = test_timer1;
        wdt_seq.case_sel = test_case;
        wdt_seq.start(wdt_en.wdt_agn.wdt_seqcr);
        repeat(100)@(posedge wdt_en.wdt_agn.wdt_drv.wdt_vif.clk);
      end
       /*else if(($value$plusargs("TEST_CASE=%d",test_case)==72))
      begin
        test_timer2 = $urandom;
        wdt_seq.timer = test_timer2;
        wdt_seq.case_sel = test_case;
        wdt_seq.start(wdt_en.wdt_agn.wdt_seqcr);
        repeat(100)@(posedge wdt_en.wdt_agn.wdt_drv.wdt_vif.clk);
      end*/
      else
      begin
        `uvm_error("Test Case",$sformatf("Invalid test case"))
      end

    end
    phase.drop_objection(this);

  endtask

endclass
