`timescale 1ns/1ps

module d_flipflop (
    input clk,
    input rst_n,
    input d,
    output reg q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 0;
        else
            q <= d;
    end

endmodule