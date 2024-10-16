module alu(
           input [31:0] A,
           input [31:0] B,
           input [2:0] alu_op,
           output reg [31:0] result,
           output reg zero    
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(alu_op)
        3'b0000: // Addition
           ALU_Result = A + B ; 
        3'b0001: // Subtraction
           ALU_Result = A - B ;
        3'b0010: // Multiplication
           ALU_Result = A * B;
        3'b0011: // Division
           ALU_Result = A/B;
        3'b0100: // Logical shift left
           ALU_Result = A<<1;
         3'b0101: // Logical shift right
           ALU_Result = A>>1;
         3'b0110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         3'b0111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          3'b1000: //  Logical and 
           ALU_Result = A & B;
          3'b1001: //  Logical or
           ALU_Result = A | B;
          3'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          3'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          3'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          3'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          3'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          3'b1111: // Equal comparison   
            ALU_Result = (A==B)?8'd1:8'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule