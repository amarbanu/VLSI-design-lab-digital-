`timescale 1ns / 1ps
module d_flip_flop (input rst, input d, input clk, input ld,  output reg q, output reg qn);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= ld;
        qn <= ~ld;
    end else begin
        q <= d;
        qn <= ~d;
    end
end
endmodule
