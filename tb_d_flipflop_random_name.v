`timescale 1ns / 1ps

module tb_d_flipflop;

    // Inputs
    reg clk;
    reg rst_n;
    reg d;

    // Output
    wire q;

    // Instantiate the D flip-flop
    d_flipflop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize
        rst_n = 0;
        d = 0;
        #10;

        // Release reset
        rst_n = 1;
        #10;

        // Test data changes
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Test reset
        rst_n = 0; #10;
        rst_n = 1; #10;

        // More data changes
        d = 1; #10;
        d = 0; #10;

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, clk: %b, rst_n: %b, d: %b, q: %b", $time, clk, rst_n, d, q);
    end

endmodule