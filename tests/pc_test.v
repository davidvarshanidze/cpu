`timescale 1ns / 1ps

module pc_tb;
    reg clk;
    reg reset;
    reg [31:0] pc_next;
    wire [31:0] pc_out;

    pc uut (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next),
        .pc_out(pc_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        pc_next = 32'd0;
        #10 reset = 0;
        pc_next = 32'd4;  // Next PC value (PC + 4)
        #10 pc_next = 32'd8;  // Next PC value (PC + 4)
        #10 pc_next = 32'd12; // Next PC value (PC + 4)
        #10 $stop;
    end
    always #5 clk = ~clk;  // Clock period is 10 time units

endmodule
