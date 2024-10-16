module pc (
    input clk,
    input reset,
    input [31:0] pc_next,
    output reg [31:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc_out <= 32'd0;  // Reset PC to 0
        end else begin
            pc_out <= pc_next;  // Update PC with next value
        end
    end

endmodule
