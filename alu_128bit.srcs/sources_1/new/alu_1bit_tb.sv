`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2016 09:19:44 PM
// Design Name: 
// Module Name: alu_1bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_1bit_tb;

logic op1, op2, cin, mode;
logic [2:0] opsel;
wire result, cout;

alu_1bit alu(
    .op1(op1),
    .op2(op2),
    .cin(cin),
    .opsel(opsel),
    .mode(mode),
    .result(result),
    .cout(cout));

initial begin
// add
#10
cin = 1'b0;
mode = 1'b0;
opsel = 3'b000;
op1 = 1'b1;
op2 = 1'b1;

#10;
op2 = 1'b0;

// sub with borrowed carry
#10;
opsel = 3'b001;
op1 = 1'b0;
op2 = 1'b1;

#10
op2 = 1'b1;

// move
#10
op1 = 1'b0;
opsel = 3'b010;

// sub
#10
opsel = 3'b011;
op1 = 1'b1;
op2 = 1'b0;

// increment
#10
opsel = 3'b100;

// decrement
#10
opsel = 3'b101;

end

endmodule
