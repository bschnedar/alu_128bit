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


module first_carry_gen(
    input logic mode, [2:0] opsel,
    output logic cout);
    
    assign cout = (mode == 1'b0 && opsel == 3'b000) ? 0 :  // Add a + b
                  (mode == 1'b0 && opsel == 3'b001) ? 1 :  // Sub with borrowed carry a + ~b
                  (mode == 1'b0 && opsel == 3'b010) ? 0 :  // Move a
                  (mode == 1'b0 && opsel == 3'b011) ? 1 :  // Sub a + ~b + 1
                  (mode == 1'b0 && opsel == 3'b100) ? 1 :  // Increment a + 1
                  (mode == 1'b0 && opsel == 3'b101) ? 0 :  // Decrement a - 1
                  (mode == 1'b0 && opsel == 3'b110) ? 1 :  // Add & increment a + b + 1
                  (mode == 1'b1 && opsel == 3'b001) ? 0 :  // Bit wise AND
                  (mode == 1'b1 && opsel == 3'b010) ? 0 :  // bit wise OR
                  (mode == 1'b1 && opsel == 3'b011) ? 0 :  // bit wise XOR
                  (mode == 1'b1 && opsel == 3'b100) ? 0 :  // Compliment 
                  (mode == 1'b1 && opsel == 3'b101) ? 0 :  // 1-bit shift left 
                  1'bZ;
endmodule
