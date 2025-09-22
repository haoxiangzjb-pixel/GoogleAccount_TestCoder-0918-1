// Testbench for D Flip-Flop
// File name: tb_dff_random_name.v

`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg rst_n;
    reg d;

    // Outputs
    wire q;
    wire qn;

    // Instantiate the Unit Under Test (UUT)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns period clock

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        d = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Release reset
        rst_n = 1;
        #10;
        
        // Apply test vectors
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        
        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | clk = %b | rst_n = %b | d = %b | q = %b | qn = %b", $time, clk, rst_n, d, q, qn);
    end

endmodule