
class csr_rand_sequence extends uvm_sequence #(csr_seqitem);

//Factory registration
	`uvm_object_utils(csr_rand_sequence)
		csr_seqitem seq_item;
		int count;
                logic [11:0]rand_array[];
                
//Constructor

	function new(string name = "csr_sequence");
		super.new(name);
	endfunction
	
	task body();
               rand_array=new[77];
               rand_array='{12'hB03,12'hB04,12'hB05,12'hB06,12'hB07,12'hB08,12'hB09,12'hB0A,12'hB0B,12'hB0C,12'hB0D,12'hB0E,12'hB0F,12'hB10,12'hB11,12'hB12,12'hB1,12'hB14,12'hB15,12'hB16,12'hB17,12'hB18,12'hB19,12'hB1A,12'hB1B,12'hB1C,12'hB1D,12'hB1E,12'hB1F,12'h323,12'h324,12'h325,12'h326,12'h327,12'h328,12'h329,12'h32A,12'h32B,12'h32C,12'h32D,12'h32E,12'h32F,12'h330,12'h331,12'h332,12'h333,12'h334,12'h335,12'h336,12'h337,12'h338,12'h339,12'h33A,12'h33B,12'h33C,12'h33D,12'h33E,12'h33F,12'hB00,12'hB02,12'hF11,12'hF12,12'hF13,12'hF14,12'h300,12'h301,12'h304,12'h305,12'h340,12'h341,12'h342,12'h344,12'h320,12'h343,12'hFC0,12'hBC0};

		repeat(count)begin  
                                     
            `uvm_do_with(seq_item,{seq_item.csr_addr_in inside{rand_array};});
		   
			end
	endtask
endclass
