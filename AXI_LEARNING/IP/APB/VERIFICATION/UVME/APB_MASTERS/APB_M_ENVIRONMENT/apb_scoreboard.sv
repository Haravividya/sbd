  `uvm_analysis_imp_decl(_mntr2scb)
  `uvm_analysis_imp_decl(_mntrout2scb)

class apb_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(apb_scoreboard)

  uvm_analysis_imp_mntr2scb #(apb_item,apb_scoreboard) analysis_imp_scoreboard_mntr2scb;
   uvm_analysis_imp_mntrout2scb #(apb_item,apb_scoreboard) analysis_imp_scoreboard_mntrout2scb;
  apb_item item;
  
  logic queue_pready[$];
  logic queue_pslverr[$];
  logic [31:0] queue_prdata[$];
  logic [31:0] queue_apb_write_data[$];
  logic [31:0] queue_apb_write_paddr[$];
  logic [31:0] queue_apb_read_paddr[$];
  logic queue_read_write[$];
  logic queue_transfer[$];
  logic queue_psel1[$];
  logic queue_psel2[$];
  logic queue_penable[$];
  logic queue_pwrite[$];
  logic [31:0] queue_paddr[$];
  logic [31:0] queue_pwdata[$];
  logic [31:0] queue_apb_read_data_out[$];

  logic que_pready;
  logic que_pslverr;
  logic [31:0] que_prdata;
  logic [31:0] que_apb_write_data;
  logic [31:0] que_apb_write_paddr;
  logic [31:0] que_apb_read_paddr;
  logic que_read_write;
  logic que_transfer;
  logic que_psel1;
  logic que_psel2;
  logic que_penable;
  logic que_pwrite;
  logic [31:0] que_paddr;
  logic [31:0] que_pwdata;
  logic [31:0] que_apb_read_data_out;
 

  function new(string name, uvm_component parent);                       //  new  funcion
    super.new(name,parent);
  endfunction
 
 
  function void build_phase(uvm_phase phase);
    analysis_imp_scoreboard_mntr2scb = new("analysis_imp_scoreboard_mntr2scb",this);      //  build phase
    analysis_imp_scoreboard_mntrout2scb = new("analysis_imp_scoreboard_mntrout2scb",this);      //  build phase
  endfunction

  
  function void write_mntr2scb(apb_item item);                                    // write function 

    queue_pready.push_back({item.pready});
    queue_pslverr.push_back({item.pslverr});
    queue_prdata.push_back({item.prdata});
    queue_apb_write_data.push_back({item.apb_write_data});
    queue_apb_write_paddr.push_back({item.apb_write_paddr});
    queue_apb_read_paddr.push_back({item.apb_read_paddr});
    queue_read_write.push_back({item.read_write});
    queue_transfer.push_back({item.transfer});

    //item.print();
  endfunction 


  function void write_mntrout2scb(apb_item item);                                    // write function 

    queue_psel1.push_back({item.psel1});
    queue_psel2.push_back({item.psel2});
    queue_penable.push_back({item.penable});
    queue_pwrite.push_back({item.pwrite});
    queue_paddr.push_back({item.paddr});
    queue_pwdata.push_back({item.pwdata});
    queue_apb_read_data_out.push_back({item.apb_read_data_out});

    //item.print();
  endfunction 

 task run_phase(uvm_phase phase);                                      // run phase
  forever
  begin

    wait(queue_transfer.size()>0);
  que_pready = queue_pready.pop_front();
  que_pslverr = queue_pslverr.pop_front();
  que_prdata = queue_prdata.pop_front();
  que_apb_write_data = queue_apb_write_data.pop_front();
  que_apb_write_paddr = queue_apb_write_paddr.pop_front();
  que_apb_read_paddr = queue_apb_read_paddr.pop_front();
  que_read_write = queue_read_write.pop_front() ;
  que_transfer = queue_transfer.pop_front();
  que_psel1 = queue_psel1.pop_front();
  que_psel2 = queue_psel2.pop_front();
  que_penable = queue_penable.pop_front();
  que_pwrite = queue_pwrite.pop_front();
  que_paddr = queue_paddr.pop_front();
  que_pwdata = queue_pwdata.pop_front();
  que_apb_read_data_out = queue_apb_read_data_out.pop_front();


  if(que_penable==0 && (que_psel1 ==1 || que_psel2 ==1) && que_pwrite ==1)
  begin
    if((que_pwdata==que_apb_write_data) && (que_apb_write_paddr == que_paddr))
      begin
        `uvm_info("Writing"," ",UVM_LOW)
        `uvm_info("Writing data through Bridge",$sformatf("PASS  apb_write_paddr: %0h  paddr : %0h apb_write_data: %0h  pwdata : %0h",que_apb_write_paddr,que_paddr,que_apb_write_data,que_pwdata),UVM_LOW)
      end
    else
      begin
        //`uvm_info("Writing data mismatch occured"," ",UVM_LOW)
        `uvm_info("Writing data mismatch occured through Bridge",$sformatf("FAIL  apb_write_paddr: %0h  paddr : %0h apb_write_data: %0h  pwdata : %0h",que_apb_write_paddr,que_paddr,que_apb_write_data,que_pwdata),UVM_LOW)
      end
  end

  if(que_penable==1 && (que_psel1 ==1 || que_psel2 ==1) && que_pwrite ==0 && que_pready==1 && que_transfer==1 )
    begin
      if(que_prdata==que_apb_read_data_out ) 
        begin
          `uvm_info("Reading"," ",UVM_LOW)
          `uvm_info("Reading data through Bridge",$sformatf("PASS  apb_read_paddr: %0h  paddr : %0h apb_read_data_out: %0h  prdata : %0h  ",que_apb_read_paddr,que_paddr,que_apb_read_data_out,que_prdata),UVM_LOW)
        end
      else
        begin
          //`uvm_info("Reading data in process"," ",UVM_LOW)
        end
    end

  if(que_transfer==0 && que_paddr!=0 )
    begin
      `uvm_info("No Transfer"," ",UVM_LOW)
      `uvm_info("No data transfer through Bridge",$sformatf("PASS  apb_read_data_out: %0h  prdata : %0h  apb_write_data: %0h  pwdata : %0h ",que_apb_read_data_out,que_prdata,que_apb_write_data,que_pwdata),UVM_LOW)
    end

  end	

  endtask 

endclass

