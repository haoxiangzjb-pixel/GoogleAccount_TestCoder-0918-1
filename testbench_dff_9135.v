// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module dff_testbench();
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop (assuming module name is dff)
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        d = 0;
        #10;
        rst = 0; // Release reset

        // Apply test vectors
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 0;

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t, D=%b, Q=%b", $time, d, q);
    end

endmodule