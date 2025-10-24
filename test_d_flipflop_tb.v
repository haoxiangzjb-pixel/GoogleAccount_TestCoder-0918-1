// Testbench for D Flip-Flop
module test_d_flipflop_tb;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the D Flip-Flop module
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
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        d = 0;
        
        // Apply reset
        #10;
        $display("Time: %0t, Reset=1, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Release reset and test various inputs
        reset = 0;
        #10;
        $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Test D=1
        d = 1;
        #15;
        $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Test D=0
        d = 0;
        #15;
        $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Test D=1 again
        d = 1;
        #15;
        $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Test reset again
        reset = 1;
        #10;
        $display("Time: %0t, Reset=1, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Release reset with D=0
        reset = 0;
        d = 0;
        #15;
        $display("Time: %0t, Reset=0, D=%b, Q=%b, Q_bar=%b", $time, d, q, q_bar);
        
        // Finish simulation
        #20;
        $finish;
    end

    // Monitor all signals
    initial begin
        $monitor("Time: %0t | CLK=%b RESET=%b D=%b | Q=%b Q_BAR=%b", $time, clk, reset, d, q, q_bar);
    end

endmodule