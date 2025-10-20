// Testbench for D-FlipFlop module
`timescale 1ns/1ps

module test_d_flipflop;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the D-FlipFlop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns to create 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0;
        reset = 1;
        
        // Reset the flip-flop
        #10;
        $display("Time: %0t ns, Reset=1: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // Release reset
        reset = 0;
        #10;
        $display("Time: %0t ns, D=0, Reset=0: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // Test with D=1
        d = 1;
        #10;
        $display("Time: %0t ns, D=1, Reset=0: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // Test with D=0
        d = 0;
        #10;
        $display("Time: %0t ns, D=0, Reset=0: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // Test with D=1 again
        d = 1;
        #10;
        $display("Time: %0t ns, D=1, Reset=0: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // Test reset again
        reset = 1;
        #10;
        $display("Time: %0t ns, Reset=1: Q=%b, Q_bar=%b", $time, q, q_bar);
        
        // End simulation
        #20;
        $finish;
    end

    // Monitor all signals
    initial begin
        $monitor("Time: %0t ns, CLK=%b, RESET=%b, D=%b, Q=%b, Q_bar=%b", 
                 $time, clk, reset, d, q, q_bar);
    end

endmodule