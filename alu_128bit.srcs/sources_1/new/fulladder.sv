`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2016 08:28:10 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input logic op1, op2, cin,
    output logic result, cout);
    
    assign result = op1 ^ op2 ^ cin;
    assign cout = (op1 & op2) | (cin & (op1 ^ op2));
    
endmodule
