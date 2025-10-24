// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with 4 states:
// 1. Green light for main road (30 cycles)
// 2. Yellow light for main road (5 cycles) 
// 3. Red light for main road, Green for side road (25 cycles)
// 4. Red light for main road, Yellow for side road (5 cycles)

module traffic_light_fsm (
    input wire clk,
    input wire reset,
    output reg [2:0] main_light,    // 3-bit: Red(2), Yellow(1), Green(0)
    output reg [2:0] side_light     // 3-bit: Red(2), Yellow(1), Green(0)
);

    // Define states
    parameter IDLE = 3'b000;
    parameter MAIN_GREEN = 3'b001;
    parameter MAIN_YELLOW = 3'b010;
    parameter SIDE_GREEN = 3'b011;
    parameter SIDE_YELLOW = 3'b100;
    
    // Internal signals
    reg [2:0] current_state, next_state;
    reg [5:0] counter;  // Counter for timing (max 31 cycles)
    
    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    // Counter for timing each state
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 6'b000000;
        else if (current_state == next_state)  // Stay in same state
            counter <= counter + 1'b1;
        else
            counter <= 6'b000000;  // Reset counter when changing states
    end
    
    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: 
                if (counter >= 6'd5)  // Brief initial delay
                    next_state = MAIN_GREEN;
                else
                    next_state = IDLE;
                    
            MAIN_GREEN:
                if (counter >= 6'd29)  // 30 cycles (0-29)
                    next_state = MAIN_YELLOW;
                else
                    next_state = MAIN_GREEN;
                    
            MAIN_YELLOW:
                if (counter >= 6'd4)   // 5 cycles (0-4)
                    next_state = SIDE_GREEN;
                else
                    next_state = MAIN_YELLOW;
                    
            SIDE_GREEN:
                if (counter >= 6'd24)  // 25 cycles (0-24)
                    next_state = SIDE_YELLOW;
                else
                    next_state = SIDE_GREEN;
                    
            SIDE_YELLOW:
                if (counter >= 6'd4)   // 5 cycles (0-4)
                    next_state = MAIN_GREEN;  // Cycle back to main green
                else
                    next_state = SIDE_YELLOW;
                    
            default:
                next_state = IDLE;
        endcase
    end
    
    // Output logic - set light values based on current state
    always @(*) begin
        case (current_state)
            IDLE: begin
                main_light = 3'b001;  // Green for main (initial state)
                side_light = 3'b100;  // Red for side
            end
            MAIN_GREEN: begin
                main_light = 3'b001;  // Green for main
                side_light = 3'b100;  // Red for side
            end
            MAIN_YELLOW: begin
                main_light = 3'b010;  // Yellow for main
                side_light = 3'b100;  // Red for side
            end
            SIDE_GREEN: begin
                main_light = 3'b100;  // Red for main
                side_light = 3'b001;  // Green for side
            end
            SIDE_YELLOW: begin
                main_light = 3'b100;  // Red for main
                side_light = 3'b010;  // Yellow for side
            end
            default: begin
                main_light = 3'b100;  // Red for main
                side_light = 3'b100;  // Red for side
            end
        endcase
    end
    
endmodule

// Testbench for the traffic light controller
module traffic_light_tb;
    reg clk;
    reg reset;
    wire [2:0] main_light;
    wire [2:0] side_light;
    
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .main_light(main_light),
        .side_light(side_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time unit period
    end
    
    // Test sequence
    initial begin
        $display("Time, Main Light (R Y G), Side Light (R Y G)");
        reset = 1;
        #20;
        reset = 0;
        
        // Run simulation for several cycles
        #500;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("%0t ns: Main=%b (R=%d,Y=%d,G=%d), Side=%b (R=%d,Y=%d,G=%d)", 
                 $time, 
                 main_light, main_light[2], main_light[1], main_light[0],
                 side_light, side_light[2], side_light[1], side_light[0]);
    end
    
endmodule