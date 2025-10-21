// Testbench for D Flip-Flop
`timescale 1ns/1ps

module test_d_flipflop;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Output
    wire q;

    // Instantiate the D Flip-Flop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        d = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;
        
        // Test different input values
        d = 1; #20;
        d = 0; #20;
        d = 1; #20;
        d = 0; #20;
        
        // Test reset
        reset = 1; #10;
        reset = 0; #10;
        
        // More tests
        d = 1; #20;
        d = 0; #20;
        
        $display("Test completed.");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule