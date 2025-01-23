`timescale 1ns / 1ps
module proj_direct_op (input wire rst, input clk,input ld, output wire[3:0] y);
wire qa;
wire qan;
wire qb;
wire qbn;
wire qc;
wire qcn;
wire qd;
wire qdn;
wire qe;
wire qen;
	d_flip_flop d0 (.rst(rst), .d(qe & qb), .clk(clk), .q(qa), .qn(qan), .ld(~ld));
	d_flip_flop d1 (.rst(rst), .d(qa | (qe & qc)), .clk(clk), .q(qb), .qn(qbn), .ld(ld));
	d_flip_flop d2 (.rst(rst), .d(qd | (qen & qb)), .clk(clk), .q(qc), .qn(qcn), .ld(ld));
	d_flip_flop d3 (.rst(rst), .d(qc & qen), .clk(clk), .q(qd), .qn(qdn), .ld(ld));
	d_flip_flop d4 (.rst(rst), .d(qa ^ qd ^ qe), .clk(clk), .q(qe), .qn(qen), .ld(~ld));
assign y = {qd, qc, qb, qa};
endmodule
