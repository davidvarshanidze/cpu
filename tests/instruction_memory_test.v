`timescale 1ns / 1ps

module instruction_memory_tb;
    reg [7:0] address;
    wire [31:0] instruction;
    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        address = 8'd0;
        #10;
        address = 8'd0;
        #10;
        address = 8'd1;
        #10;
        address = 8'd2;
        #10;
        address = 8'd3;
        #10;
        address = 8'd4;
        #10;
        $stop;
    end

endmodule
