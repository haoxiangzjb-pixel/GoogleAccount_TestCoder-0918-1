module d_flip_flop (
    input  wire clk,
    input  wire reset_n, // Асинхронный сброс, активный уровень - низкий
    input  wire d,
    output reg  q
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end
    end

endmodule