`timescale 1ns / 1ps

module reg_file_tb;
    reg clk;
    reg reg_write;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [31:0] write_data;

    wire [31:0] reg_data1;
    wire [31:0] reg_data2;

    reg_file uut (
        .clk(clk),
        .reg_write(reg_write),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    initial begin
        clk = 0;
        reg_write = 0;
        rs = 5'd0;
        rt = 5'd0;
        rd = 5'd0;
        write_data = 32'd0;
        #10 rd = 5'd1; write_data = 32'd100; reg_write = 1;
        #10 reg_write = 0;  // Disable writing
        #10 rs = 5'd1;
        #10 rt = 5'd1;
        #10 rd = 5'd2; write_data = 32'd200; reg_write = 1;
        #10 reg_write = 0;
        #10 rs = 5'd2;
        #10 rt = 5'd2;
        #10 $stop;
    end

    always #5 clk = ~clk;

endmodule
