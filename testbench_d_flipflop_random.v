// Testbench for D Flip-Flop
module test_d_flipflop();
  
  // Declare signals
  reg clk, reset, d;
  wire q, q_bar;
  
  // Instantiate the D Flip-Flop module
  // Note: You'll need to have the actual D Flip-Flop module defined elsewhere
  // For now, we'll assume it's called 'd_flipflop'
  d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #10;
    reset = 0;  // Release reset
    
    // Apply test vectors
    #10 d = 1;
    #20 d = 0;
    #20 d = 1;
    #20 d = 0;
    
    // End simulation
    #20 $finish;
  end
  
  // Monitor outputs
  initial begin
    $monitor("Time=%0t, CLK=%b, RESET=%b, D=%b, Q=%b, Q_BAR=%b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule