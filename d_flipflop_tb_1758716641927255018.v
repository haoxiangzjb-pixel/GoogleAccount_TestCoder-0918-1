// Testbench for D Flip-Flop
module d_flipflop_tb;
  reg clk;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop module
  // Assuming the D-FF module is named 'd_flipflop' with ports clk, d, q
  // d_flipflop uut (
  //   .clk(clk),
  //   .d(d),
  //   .q(q)
  // );

  initial begin
    // Initialize inputs
    clk = 0;
    d = 0;

    // Apply stimulus
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    // Finish simulation
    $finish;
  end

  // Generate clock
  always #5 clk = ~clk; // Toggle clk every 5 time units

  // Monitor outputs
  initial begin
    $monitor("Time: %0t, CLK: %b, D: %b, Q: %b", $time, clk, d, q);
  end
endmodule