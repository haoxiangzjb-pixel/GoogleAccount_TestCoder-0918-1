// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_dff();
    reg clk;
    reg rst_n; // Active-low reset
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop (assuming module name is dff)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        d = 0;
        rst_n = 0; // Assert reset

        // Wait for a bit and release reset
        #15;
        rst_n = 1; // Deassert reset

        // Apply test vectors
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 0;

        // Finish simulation
        #30 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RST_N: %b, D: %b, Q: %b, Q_BAR: %b", $time, clk, rst_n, d, q, q_bar);
    end

endmodule