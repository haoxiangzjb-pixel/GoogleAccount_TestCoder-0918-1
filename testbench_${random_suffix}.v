// Verilog Testbench for D Flip-Flop
// Filename: testbench_${random_suffix}.v

`timescale 1ns / 1ps

module test_d_flip_flop;
    // Inputs
    reg clk;
    reg reset;
    reg d;

    // Outputs
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test data input changes
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
    end

endmodule