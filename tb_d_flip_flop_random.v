`timescale 1ns / 1ps

module tb_d_flip_flop_random;
    reg clk;
    reg reset;
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop module (assuming the module name is d_flip_flop)
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test sequence
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RESET: %b, D: %b, Q: %b, Q_BAR: %b",
                 $time, clk, reset, d, q, q_bar);
    end
endmodule