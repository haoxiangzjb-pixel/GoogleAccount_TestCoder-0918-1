// Testbench for D-Flip-Flop
module d_flipflop_tb;

// Inputs
reg clk;
reg rst;
reg d;

// Outputs
wire q;
wire q_bar;

// Instantiate the D-Flip-Flop module
d_flipflop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 time units period
end

// Test sequence
initial begin
    // Initialize
    rst = 1;
    d = 0;
    #10;
    
    // Release reset
    rst = 0;
    #10;
    
    // Test different input values
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    
    // Test reset functionality
    rst = 1; #10;
    rst = 0; #10;
    
    // More input changes after reset
    d = 1; #10;
    d = 0; #10;
    
    $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t, clk=%b, rst=%b, d=%b, q=%b, q_bar=%b", $time, clk, rst, d, q, q_bar);
end

endmodule