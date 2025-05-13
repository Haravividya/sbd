`ifndef JTAG_DEFS__SVH
 `define JTAG_DEFS__SVH
`define DM_CONTROL        (7'h10 << 34)     //  Enable DM_CONTROL Register with address 7'h10
`define DM_STATUS         (7'h11 << 34)     //  Enable DM_STATUS Register with address 7'h11
`define HART_INFO         (7'h12 << 34)     //  Enable HART_INFO Register with address 7'h12
`define ABSTRACTCS_ADDR   (7'h16 << 34)	    //  Definition for Abstractcs register address
`define COMMAND_ADDR      (7'h17 << 34)		//  Definition for Command register address
`define	PROGBUFF0_ADDR    (7'h20 << 34)		//  Definition for Program buffer 0 register address
`define	PROGBUFF1_ADDR    (7'h21 << 34)		//  Definition for Program buffer 1 register address
`define	PROGBUFF2_ADDR    (7'h22 << 34)		//  Definition for Program buffer 2 register address
`define	PROGBUFF3_ADDR    (7'h23 << 34)		//  Definition for Program buffer 3 register address
`define	PROGBUFF4_ADDR    (7'h24 << 34)		//  Definition for Program buffer 4 register address
`define	PROGBUFF5_ADDR    (7'h25 << 34)		//  Definition for Program buffer 5 register address
`define	PROGBUFF6_ADDR    (7'h26 << 34)		//  Definition for Program buffer 6 register address
`define	PROGBUFF7_ADDR    (7'h27 << 34)		//  Definition for Program buffer 7 register address
`define	PROGBUFF8_ADDR    (7'h28 << 34)		//  Definition for Program buffer 8 register address
`define	PROGBUFF9_ADDR    (7'h29 << 34)		//  Definition for Program buffer 9 register address
`define	PROGBUFF10_ADDR   (7'h2A << 34)		//  Definition for Program buffer 10 register address
`define	PROGBUFF11_ADDR   (7'h2B << 34)		//  Definition for Program buffer 11 register address
`define	PROGBUFF12_ADDR   (7'h2C << 34)		//  Definition for Program buffer 12 register address
`define	PROGBUFF13_ADDR   (7'h2D << 34)		//  Definition for Program buffer 13 register address
`define	PROGBUFF14_ADDR   (7'h2E << 34)		//  Definition for Program buffer 14 register address
`define	PROGBUFF15_ADDR   (7'h2F << 34)		//  Definition for Program buffer 15 register address
`define	DATA0_ADDR 	      (7'h04 << 34)		//  Definition for Data0 register address
`define	DATA1_ADDR        (7'h05 << 34)		//  Definition for Data1 register address
`define	DATA2_ADDR        (7'h06 << 34)		//  Definition for Data2 register address
`define DATA3_ADDR        (7'h07 << 34)		//  Definition for Data3 register address
`define	DATA4_ADDR        (7'h08 << 34)		//  Definition for Data4 register address
`define	DATA5_ADDR        (7'h09 << 34)		//  Definition for Data5 register address
`define	DATA6_ADDR        (7'h0A << 34)		//  Definition for Data6 register address
`define	DATA7_ADDR        (7'h0B << 34)		//  Definition for Data7 register address
`define	DATA8_ADDR        (7'h0C << 34)		//  Definition for Data8 register address
`define	DATA9_ADDR        (7'h0D << 34)		//  Definition for Data9 register address
`define	DATA10_ADDR       (7'h0E << 34)		//  Definition for Data10 register address
`define	DATA11_ADDR       (7'h0F << 34)		//  Definition for Data11 register address
`define WRONG_ADDR        (7'hFF << 34)
`define OP_READ           (1 << 0)          //  Perform READ operation (OP = 1)
`define OP_WRITE          (2 << 0)          //  Perform WRITE operation (OP = 2)
`define OP_NOP            (0 << 0)          //  No operaton
`define DM_ACTIVE         (1 << 2)          //  Make DM_ACTIVE bit high in DM_CONTROL register
`define NDMRESET          (1 << 3)          //  Make NDMRESET bit high in DM_CONTROL register 
`define CLRRESETHALTREQ   (1 << 4)          //  Make CLRRESETHALTREQ bit high in DM_CONTROL register
`define SETRESETHALTREQ   (1 << 5)          //  Make SETRESETHALTREQ bit high in DM_CONTROL register
`define CLRKEEPALIVE      (1 << 6)          //  Make CLRKEEPALIVE  bit high in DM_CONTROL register
`define SETKEEPALIVE      (1 << 7)          //  Make SETKEEPALIVE bit high in DM_CONTROL register
`define HARTSELHI         (10'h << 8)       //  Higher 10 bits of HARTSEL in DM_CONTROL register
`define HARTSELLO         (10'h << 18)      //  Lower 10 bits of HARTSEL in DM_CONTROL register
`define HASEL             (1 << 28)         //  Make HASEL bit high in DM_CONTROL register
`define ACKUNAVAIL        (1 << 29)         //  Make ACKUNAVAIL bit high in DM_CONTROL register
`define ACKHAVERESET      (1 << 30)         //  Make ACKHAVERESET bit high in DM_CONTROL register
`define HARTRESET         (1 << 31)         //  Make HARTRESET bit high in DM_CONTROL register
`define RESUMEREQ         (1 << 32)         //  Make RESUMEREQ bit high in DM_CONTROL register
`define HALTREQ           (1 << 33)         //  Make HALTREQ bit high in DM_CONTROL register
`define WRITE_R_A         (0 << 18)         //  When transfer is set, copy data from Reg into ARG0 in ABSTRACT_COMMAND_REGISTER
`define WRITE_A_R         (1 << 18)         //  When transfer is set, copy data from ARG0 into Reg in ABSTRACT_COMMAND_REGISTER
`define TRANSFER_REG      (1 << 19)         //  Do the specified operation by write in ABSTRACT_COMMAND_REGISTER
`define POSTEXEC          (1 << 20)         //  Execute the program in the Program Buffer exactly once after performing the transfer(if any) in ABSTRACT_COMMAND_REGISTER
`define AARPOSTINCREMENT  (1 << 21)         //  in ABSTRACT_COMMAND_REGISTER
`define AARSIZE_32        (3'h2 << 22)      //  Access the lowest 32 bits of register in ABSTRACT_COMMAND_REGISTER
`define AARSIZE_64        (3'h3 << 22)      //  Access the lowest 64 bits of register in ABSTRACT_COMMAND_REGISTER
`define AARSIZE_128       (3'h4 << 22)      //  Access the lowest 128 bits of register in ABSTRACT_COMMAND_REGISTER
`define CMDTYPE_ARC       (8'h0 << 26)      //  ABSTRACTS command type = acces register command
`define CMDTYPE_QA        (8'h1 << 26)      //  ABSTRACTS command type = Quick Access
`define CMDTYPE_AMC       (8'h2 << 26)      //  ABSTRACTS command type = Acess Memory Command
`define AAMSIZE_8         (3'h0 << 22)      //  Access the lowest 8 bits of the memory location.
`define AAMSIZE_16        (3'h1 << 22)      //  Access the lowest 16 bits of the memory location.
`define AAMSIZE_32        (3'h2 << 22)      //  Access the lowest 32 bits of the memory location.
`define AAMSIZE_64        (3'h3 << 22)      //  Access the lowest 64 bits of the memory location.
`define AAMSIZE_128       (3'h4 << 22)      //  Access the lowest 128 bits of the memory location.
`define AAMPOSTINCREMENT  (1 << 21) 
`define REG_NO(reg_no)    ((16'h1000 + reg_no) << 2)   // Addres for GPR base register
`define RELAXEDPRIV       (1 << 13)         //  Relaxed permissions applicable in ABSTRACT_CONTROL_AND_STATUS register
`define RANDOM_DATA       ($urandom() << 2 )
`define CSR_REG(csr_reg)  ((16'h0000 + csr_reg) << 2 )
`define GEN_PRINT         (1)
`define REG_PRINT         (2)
`define INPUT_DATA_PRINT  (3)
`define DMI_HARDRESET     (1 << 17 )
`define DMI_RESET         (1 << 16 )
`define DM                (10)
`define JTAG              (11)
`define CMDERR_CLR        ($urandom_range(1,7) << 10 )
`define WR                ($urandom_range(0,1) << 18)
`define DATA_MEM_BASE_ADDR      (32'h48120)
`define DATA_MEM_END_ADDR       (32'h87ff8)
`define INSTR_MEM_BASE_ADDR     (32'h8000)
`define INSTR_MEM_END_ADDR      (32'h47ff8)

typedef enum bit [0:4] {
                        IDCODE = 'h1, DTM_CSR = 'h10, DMI_ACCESS = 'h11,
                        ABSTRACT_COMMAND = 'h17, BYPASS = 'h1F} jtag_instr_registers;

typedef enum {X, RESET, IDLE, 
              SELECT_DR, SELECT_IR, 
              CAPTURE_DR, CAPTURE_IR, 
              SHIFT_DR, SHIFT_IR, 
              EXIT_DR, EXIT_IR, 
              EXIT2_DR, EXIT2_IR, 
              PAUSE_DR, PAUSE_IR, 
              UPDATE_DR, UPDATE_IR} tap_state;

`endif


