`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2016 08:05:29 PM
// Design Name: 
// Module Name: alu_128bit
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


module alu_128bit ( op1 , op2 , opsel , mode , result , c_flag , z_flag , o_flag , s_flag );
    parameter DWIDTH = 128;
    input logic [DWIDTH-1:0] op1;       // 128 bits
    input logic [DWIDTH-1:0] op2;       // 128 bits
    input logic [2:0] opsel;            // 3 bits
    input logic mode;                   // 1 bit
    output logic [DWIDTH-1:0] result;   // 128 bits
    output logic c_flag;                // carry out flag
    output logic z_flag;                // zero flag
    output logic o_flag;                // overflow flag
    output logic s_flag;                // sign flag
    
    logic [DWIDTH:0] carry;             // 129 carry wires
    
    first_carry_gen fcg(
        .mode(mode),
        .opsel(opsel),
        .cout(carry[0])               // to first 1-bit alu
    );
    
    genvar i;
    generate
        for(i = 0; i < DWIDTH; i++)
        begin: g
            alu_1bit alu1bit(
                .op1(op1[i]),
                .op2(op2[i]),
                .cin(carry[i]),     // starts with first carry gen
                .mode(mode),
                .opsel(opsel),
                .cout(carry[i+1]),    // cout to cin of next 1 bit alu
                .result(result[i])
            );
            
        end
    endgenerate
    
    // flag generator
    assign c_flag = carry[DWIDTH];
    assign o_flag = c_flag;
    assign z_flag = !result;
    assign s_flag = result[DWIDTH-1];
    
endmodule
