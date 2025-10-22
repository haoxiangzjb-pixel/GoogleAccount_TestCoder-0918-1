// Testbench for D Flip-Flop
`timescale 1ns/1ps

module tb_d_flipflop;

// Testbench signals
reg clk;
reg reset;
reg d;
wire q;
wire q_bar;

// Instantiate the D flip-flop
d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation - 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5ns (10ns period)
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Apply reset
    #10;
    $display("Time: %0t, Reset=1, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Release reset
    reset = 0;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Test with D=0
    d = 0;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Test with D=1
    d = 1;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Test with D=0 again
    d = 0;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Test with D=1 again
    d = 1;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Apply reset again
    reset = 1;
    #10;
    $display("Time: %0t, Reset=1, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Release reset and test again
    reset = 0;
    d = 1;
    #10;
    $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
    
    // Finish simulation
    #20;
    $finish;
end

endmodule