// Verilog Testbench for D Flip-Flop
// File name: tb_dff_random123.v

`timescale 1ns / 1ps

module tb_dff;

    // Declare inputs and outputs for the DFF
    reg clk;
    reg d;
    wire q;
    wire qn; // Optional inverted output

    // Instantiate the D Flip-Flop under test
    // Assuming the DFF module is named 'dff'
    dff uut (
        .clk(clk),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        d = 0;

        // Display initial values
        $display("Time\tCLK\tD\tQ\tQN");
        $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        // Apply test vectors
        #10 d = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        #10 d = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        #20 $finish; // End simulation after 100ns
    end

endmodule