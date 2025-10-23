// Testbench for D-Flip-Flop
`timescale 1ns / 1ps

module dff_testbench;
  
  // DUT (Device Under Test) inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Instantiate the D-Flip-Flop module
  d_flip_flop dut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns period
  end
  
  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #20;
    
    // Release reset
    reset = 0;
    
    // Apply test vectors
    #10 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    #20 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    #20 d = 1;    // Set D to 1
    
    // More tests with reset
    #20 reset = 1;  // Assert reset
    #10 reset = 0;  // Deassert reset
    #10 d = 1;
    #20 d = 0;
    
    // End simulation
    #50 $finish;
  end
  
  // Monitor signals
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule

// Example D-Flip-Flop module implementation (for reference/testing)
module d_flip_flop (
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule