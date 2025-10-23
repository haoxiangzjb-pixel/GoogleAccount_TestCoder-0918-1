// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with Red, Yellow, and Green lights
// States: RED -> GREEN -> YELLOW -> RED (cycling)

module traffic_light_controller (
    input  clk,
    input  reset,
    output reg [2:0] lights  // [2] = Red, [1] = Yellow, [0] = Green
);

    // Define states for the traffic light FSM
    parameter RED    = 3'b001;
    parameter GREEN  = 3'b010;
    parameter YELLOW = 3'b100;
    
    // Internal state register
    reg [2:0] current_state, next_state;
    
    // Timer for controlling light durations
    reg [19:0] timer;  // 20-bit timer for longer delays
    parameter RED_TIME    = 20'd5000000;   // Time for red light (adjust as needed)
    parameter GREEN_TIME  = 20'd3000000;   // Time for green light (adjust as needed)
    parameter YELLOW_TIME = 20'd1000000;   // Time for yellow light (adjust as needed)
    
    // State register - updates state on clock edge
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED;
            timer <= 20'd0;
        end else begin
            current_state <= next_state;
            if (current_state != next_state) begin
                timer <= 20'd0;  // Reset timer when changing states
            end else begin
                timer <= timer + 20'd1;  // Increment timer
            end
        end
    end
    
    // Next state logic - determines next state based on current state and timer
    always @(*) begin
        case (current_state)
            RED: begin
                if (timer >= RED_TIME)
                    next_state = GREEN;
                else
                    next_state = RED;
            end
            GREEN: begin
                if (timer >= GREEN_TIME)
                    next_state = YELLOW;
                else
                    next_state = GREEN;
            end
            YELLOW: begin
                if (timer >= YELLOW_TIME)
                    next_state = RED;
                else
                    next_state = YELLOW;
            end
            default: next_state = RED;  // Safety default
        endcase
    end
    
    // Output logic - sets the light outputs based on current state
    always @(*) begin
        case (current_state)
            RED:    lights = 3'b100;  // Red light on (bit 2)
            GREEN:  lights = 3'b010;  // Green light on (bit 1) 
            YELLOW: lights = 3'b001;  // Yellow light on (bit 0)
            default: lights = 3'b100; // Default to red for safety
        endcase
    end
    
endmodule

// Testbench for the traffic light controller
module tb_traffic_light_controller;
    reg clk;
    reg reset;
    wire [2:0] lights;
    
    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .lights(lights)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time unit period (5ns high, 5ns low)
    end
    
    // Test sequence
    initial begin
        $display("Time, Lights(RYG), State");
        $monitor("%0t, %b, %s", $time, lights, 
                 (lights == 3'b100) ? "RED" : 
                 (lights == 3'b010) ? "GREEN" : 
                 (lights == 3'b001) ? "YELLOW" : "UNKNOWN");
        
        reset = 1;
        #20;
        reset = 0;
        
        // Run simulation for sufficient time to see multiple cycles
        #100000000;
        
        $finish;
    end
endmodule