`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2016 08:08:12 PM
// Design Name: 
// Module Name: alu_1bit
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


module alu_1bit(
    input logic op1, op2, mode, cin,
    input logic [2:0] opsel,
    output logic result, cout);

wire w1, w2, w3, w4, w5, w6;

b_gen bg(
    .opsel(opsel),
    .mode(mode),
    .op2(op2),
    .out(w1)        // to full adder and logical
    );

carry_gen cg(
    .cin(cin),
    .mode(mode),
    .opsel(opsel),
    .cout(w2)       // to full adder and logical
    );

fulladder fa(
    .op1(op1),
    .op2(w1),       // from b gen
    .cin(w2),       // from carry gen
    .result(w3),        // to result mux
    .cout(w5)           // to carry mux
    );
    
logical_1bit logical(
    .op1(op1),
    .op2(op2),         
    .cin(cin),           // carry from previous 1 bit alu
    .mode(mode),
    .opsel(opsel),
    .result(w4),            // to result mux
    .cout(w6)               // to carry mux
    );
    
mux2to1 result_mux(
    .a(w3),         // from arith result out (mode 0)
    .b(w4),         // from logical result out (mode 1)
    .sel(mode),
    .out(result)    // to 1-bit alu result
    );
    
mux2to1 cout_mux(
    .a(w5),         // from arith carry out (mode 0)
    .b(w6),         // from logical carry out (mode 1)
    .sel(mode),
    .out(cout)      // to 1-bit alu carry out
    );
    
endmodule
