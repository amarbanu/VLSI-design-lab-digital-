`timescale 1ns / 1ps
module proj (input wire rst, input clk,input ld, output wire[3:0] y);
wire qa;
wire qan;
wire qb;
wire qbn;
wire qc;
wire qcn;
	d_flip_flop d0 (.rst(rst),.d(qan), .clk(clk), .q(qa), .qn(qan), .ld(ld));
	d_flip_flop d1 (.rst(rst),.d(qcn & (qa ^ qb)), .clk(clk), .q(qb), .qn(qbn), .ld(ld));
	d_flip_flop d2 (.rst(rst),.d(qa & qb | qc & qbn & qan), .clk(clk), .q(qc), .qn(qcn), .ld(ld));
assign y = {(qcn & qa & qb),(qan & (qc ^ qb)), (qa & qbn), (qan & qbn & qcn)};
endmodule
