`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2016 12:08:59 AM
// Design Name: 
// Module Name: b_gen
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


module b_gen(
    input logic op2, mode, [2:0] opsel,
    output logic out);

    assign out = (mode == 1'b0 && opsel == 3'b000) ? op2 :  // Add a + b
                 (mode == 1'b0 && opsel == 3'b001) ? ~op2 : // Sub with borrowed carry a + ~b
                 (mode == 1'b0 && opsel == 3'b010) ? 0 :    // Move a
                 (mode == 1'b0 && opsel == 3'b011) ? ~op2 : // Sub a + ~b + 1
                 (mode == 1'b0 && opsel == 3'b100) ? 0 :    // Increment a + 1
                 (mode == 1'b0 && opsel == 3'b101) ? 1 :    // Decrement a - 1
                 (mode == 1'b0 && opsel == 3'b110) ? op2 :  // Add & increment a + b + 1
                 1'bZ;  // 
endmodule
