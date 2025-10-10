// Testbench for D Flip-Flop
module tb_d_flip_flop;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10 time units
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

        // Apply test vectors
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
    end
endmodule