`timescale 1ns / 1ps

module dff_testbench;
    reg clk;
    reg d;
    wire q;

    // Instantiate the D flip-flop module
    // Предположим, что модуль D-триггера называется dff и имеет порты clk, d, q
    dff uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        d = 0;
        #10;

        // Apply test vectors
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Finish simulation
        #10 $finish;
    end

    // Optional: Monitor signals
    initial begin
        $monitor("Time: %0t, D: %b, Q: %b", $time, d, q);
    end

endmodule