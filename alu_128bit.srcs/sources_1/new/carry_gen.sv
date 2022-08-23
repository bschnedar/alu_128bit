`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2016 08:16:57 PM
// Design Name: 
// Module Name: carry_gen
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


module carry_gen(
    input logic cin, mode, [2:0] opsel,
    output logic cout);
    
    assign cout = (mode == 1'b0 && opsel == 3'b000) ? cin :   // Add a + b
                  (mode == 1'b0 && opsel == 3'b001) ? cin :   // Sub with borrowed carry a + ~b
                  (mode == 1'b0 && opsel == 3'b010) ? 0 :     // Move a
                  (mode == 1'b0 && opsel == 3'b011) ? cin :     // Sub a + ~b + 1
                  (mode == 1'b0 && opsel == 3'b100) ? cin :     // Increment a + 1
                  (mode == 1'b0 && opsel == 3'b101) ? cin :     // Decrement a - 1
                  (mode == 1'b0 && opsel == 3'b110) ? cin :     // Add & increment a + b + 1
                  1'bZ;
endmodule
