// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_dff;

    // Declare signals
    reg clk;
    reg d;
    wire q;
    wire qn; // Optional inverted output

    // Instantiate the D Flip-Flop
    // Assuming the DFF module is named 'dff'
    dff uut (
        .clk(clk),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns period clock
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        d = 0;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, d = %b, q = %b, qn = %b", $time, clk, d, q, qn);
    end

endmodule