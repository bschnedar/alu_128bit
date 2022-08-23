`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2016 11:14:26 AM
// Design Name: 
// Module Name: logical_1bit
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


module logical_1bit(
    input logic op1, op2, mode, cin, [2:0] opsel,
    output logic result, cout
    );
    
    assign result = (mode == 1'b1 && opsel == 3'b000) ? op1 && op2 :  // Bit wise AND
                    (mode == 1'b1 && opsel == 3'b001) ? op1 || op2 :  // Bit wise OR
                    (mode == 1'b1 && opsel == 3'b010) ? op1 ^ op2 :   // Bit wise XOR
                    (mode == 1'b1 && opsel == 3'b011) ? ~op1 :        // Compliment
                    (mode == 1'b1 && opsel == 3'b101) ? cin :         // Shift left
                    1'bZ;
    assign cout = (mode == 1'b1 && opsel == 3'b000) ? 0 :     // Bit wise AND
                  (mode == 1'b1 && opsel == 3'b001) ? 0 :     // bit wise OR
                  (mode == 1'b1 && opsel == 3'b010) ? 0 :     // bit wise XOR
                  (mode == 1'b1 && opsel == 3'b011) ? 0 :     // Compliment 
                  (mode == 1'b1 && opsel == 3'b101) ? op1 :    // 1-bit shift left 
                  1'bZ;
endmodule
