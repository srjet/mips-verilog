// Code your testbench here
// or browse Examples
module tb_cpu;
    reg clk;
  	wire [31:0] addr;
  	wire[31:0] instruction;
    wire[1:0] cu_regdst;
    wire cu_jump, cu_branch, cu_memread;
    wire [1:0] cu_memtoreg;
    wire[1:0] cu_aluop;
    wire cu_memwrite, cu_aluscr, cu_regwrite;
    wire[4:0] mux1_regwrite;
    wire[31:0] memdata;
    wire[31:0] reg_readdata1, reg_readdata2;
    wire[31:0] signext_out;
    wire[31:0] mux2_out;
    wire[31:0] alu_out;
    wire alu_zero;
    wire[3:0] aluctrl_out;
    wire[31:0] dmem_readdata;
  	wire bBranch;
    wire [31:0] j_addr;
    wire [31:0] next_pc;

    cpu CPU1(clk, addr, instruction, cu_regdst, cu_jump, cu_branch, cu_memread, cu_memtoreg, cu_aluop, cu_memwrite, cu_aluscr, cu_regwrite, mux1_regwrite, memdata, reg_readdata1, reg_readdata2, signext_out, mux2_out, alu_out, alu_zero, aluctrl_out, dmem_readdata, bBranch, j_addr, next_pc);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $monitor("ADDR = %b ",addr);
    clk = 0;
    #100 $finish;
  end

  always #5 clk = !clk;

endmodule
