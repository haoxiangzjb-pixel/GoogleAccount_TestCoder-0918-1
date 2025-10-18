// Testbench for D-Flip-Flop
module d_flipflop_tb;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D-Flip-Flop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        
        // Apply reset
        #10;
        reset = 0;
        
        // Test data input
        #10;
        d = 1;
        
        #20;
        d = 0;
        
        #20;
        d = 1;
        
        #20;
        reset = 1;
        
        #10;
        reset = 0;
        
        #20;
        d = 0;
        
        #20;
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule