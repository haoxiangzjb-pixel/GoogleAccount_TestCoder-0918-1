`timescale 1ns/1ps

module d_ff_testbench;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    d_flipflop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    initial begin
        $dumpfile("d_ff_testbench.vcd");
        $dumpvars(0, d_ff_testbench);
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        d = 0;
        #10;
        rst_n = 1;
        #10;
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;
        $finish;
    end

endmodule