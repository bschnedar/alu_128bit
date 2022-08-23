`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2016 08:14:40 PM
// Design Name: 
// Module Name: arith_1bit
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


module arith_1bit(
    input logic op1, op2, cin, mode, [2:0] opsel,
    output logic result, cout);
    

    fulladder fa(
        .op1(op1),
        .op2(w1),
        .cin(w2),
        .result(result),
        .cout(cout)
        );
endmodule
