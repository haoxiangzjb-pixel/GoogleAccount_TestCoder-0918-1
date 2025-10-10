`timescale 1ns / 1ps

module d_ff_testbench;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D flip-flop module
    d_ff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock with 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5ns to get 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test different input values
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        // End simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t, Reset: %b, D: %b, Q: %b", $time, reset, d, q);
    end
endmodule