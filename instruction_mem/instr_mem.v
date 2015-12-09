module instr_mem (	input [31:0] address,
					output [31:0] instruction );

 	reg [31:0] memory [249:0];
 	integer i;

	initial
		begin
			for (i=0; i<250; i=i+1) memory[i] = 32'b0;
			// Insert MIPS's assembly here start at memory[10] = ...
			//memory[10] = 32'b001000_00000_01000_0000000000000010; 	//addi $t0, $0, 2
			//memory[11] = 32'b101011_01000_01001_0000000000000000;     //110100 sw
            //memory[12] = 32'b100011_01000_01100_0000000000000000; 	// 111000 lw
			memory[10]    = 32'b001000_00000_01000_0000000000000010; //addi $t0, $0, 2
			memory[11]    = 32'b001000_00000_01001_0000000000000010; //addi $t1, $0, 2
			memory[12]    = 32'b001000_00000_01011_0000000000000010; //addi $t1, $0, 2
			memory[13]	  = 32'b000010_00000000000000000000001000;
			/*memory[13]    = 32'b000100_01000_01001_0000000000000010; //branch
			memory[14]    = 32'b001000_00000_01010_0000000000000010; //addi $t2, $0, 2
			memory[15]    = 32'b001000_00000_01100_0000000000000001; //addi $t3, $0, 1
			memory[16]    = 32'b001000_00000_01101_0000000000000011; //addi $t4, $0, 3
			memory[17]    = 32'b001000_00000_01000_0000000000000010; //addi $t0, $0, 2
			memory[18]    = 32'b101011_01100_01000_0000011111010000; //sw $t4(rs),$t0(rt)
			memory[19]    = 32'b100011_01000_01100_0000011111010000; //lw $t0(rs) ,$t4(rt)*/
		end

	assign instruction = memory[address >> 2];

endmodule
