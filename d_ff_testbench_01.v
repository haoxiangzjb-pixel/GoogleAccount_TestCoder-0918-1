// Testbench for D Flip-Flop
module d_ff_testbench;
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module (assuming module name is d_ff)
    d_ff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Stimulus
    initial begin
        // Initialize signals
        rst = 1;
        d = 0;
        #10; // Wait for some time
        rst = 0; // Release reset

        // Apply test vectors
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Finish simulation
        #20 $finish;
    end

endmodule