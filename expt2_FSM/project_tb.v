`timescale 1ns / 1ps
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module project_tb;
  reg clk;
  reg rst;
  reg ld;
  wire [3:0] y;
  proj_direct_op uut (.rst(rst), .clk(clk), .y(y), .ld(ld));
  
  initial begin
    clk = 0;
  end
  always #5 clk = ~clk; //10ns clock period
  initial begin
    ld = 0;
    #2
    rst = 1;
    #10
    rst=0;
    #20
    #100
    $finish;
  end
endmodule