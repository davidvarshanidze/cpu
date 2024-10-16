`timescale 1ns / 1ps

module mips_cpu_tb;
    reg clk;
    reg reset;
    mips_cpu uut (
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Let the CPU run for some cycles
        #1000 $stop;  // End simulation after 1000 time units
    end
    always #5 clk = ~clk;

endmodule
