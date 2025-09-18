// Testbench for D Flip-Flop
module dff_tb;

// Declare inputs and outputs
reg clk;
reg rst;
reg d;
wire q;

// Instantiate the DFF module
dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk;  // 10ns clock period
end

// Test procedure
initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    d = 0;
    
    // Remove reset after 20ns
    #20 rst = 0;
    
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
    $monitor("Time = %0t: clk = %b, rst = %b, d = %b, q = %b", $time, clk, rst, d, q);
end

endmodule