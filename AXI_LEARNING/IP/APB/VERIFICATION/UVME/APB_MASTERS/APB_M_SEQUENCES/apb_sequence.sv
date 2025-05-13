class apb_sequence extends uvm_sequence#(apb_item);

  `uvm_object_utils(apb_sequence)          // Factory registration
 
  apb_item item;
 
  int  scenario;
  logic read_writet;
  logic [31:0] apb_write_paddrt;
  logic transfert;
  logic [31:0] apb_write_datat;
  logic [31:0] apb_read_paddrt;

  function new(string name = "apb_sequence");
    super.new(name);
  endfunction
 
  task body();
  
  /*repeat(5)                            
  begin
    `uvm_do(item) 
  end
  item = apb_item::type_id::create("item");  
 begin
 start_item(item);
 assert (!item.randomize() with {apb_write_paddr inside {[32'h10000000:32'h1000001C]};}) begin
 `uvm_error("Body", "Randomization Error");
 end 
 finish_item(item);
 end*/

    `uvm_info ("Sequence", $sformatf("Starting Sequence"), UVM_LOW)

     if(scenario == 1)		//write random
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
	repeat(5)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.transfer==transfert;})
      end

     else if(scenario == 2)		//write fixed data
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(4)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.apb_write_data==apb_write_datat;item.transfer==transfert;})
      end

     else if(scenario == 3)		//write fixed data
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(10)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.apb_write_data==apb_write_datat;item.transfer==transfert;})
      end

     else if(scenario == 4)		//read random address
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
	repeat(5)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.transfer==transfert;})
      end

     else if(scenario == 5)		//read fixed address
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(10)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.apb_read_paddr == apb_read_paddrt;item.transfer==transfert;})
      end

     else if(scenario == 6)		//read fixed address
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(10)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.apb_read_paddr == apb_read_paddrt;item.transfer==transfert;})
      end

     else if(scenario == 7)		//no transfer
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(10)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.apb_read_paddr == apb_read_paddrt;item.transfer==transfert;})
      end

     else if(scenario == 8)		//no transfer write
      begin
	//#100
        //`uvm_do_with(item, {item.presetn == 0;}) item.apb_write_paddr == apb_write_paddrt; 
        //repeat(240)                             //  write sequences	
        `uvm_do_with(item,{item.read_write == read_writet;item.transfer==transfert;})
      end
	      

/*   repeat(10)                             //  write sequences
  begin

    `uvm_do_with(item,{item.read_write == 1'b0;item.apb_write_paddr == 32'h14255429;item.transfer==1;})
  end 
 
  repeat(10)                            //  read sequences
  begin

    `uvm_do_with(item,{item.read_write == 1'b1;item.apb_read_paddr == 32'h14255429;item.transfer==1;})

  end */

  endtask
endclass 

 

