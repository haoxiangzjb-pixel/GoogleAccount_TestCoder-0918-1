// Traffic Light Controller using Finite State Machine
module traffic_light_controller (
    input wire clk,           // System clock
    input wire reset,         // Reset signal
    output reg [2:0] ns_light, // North-South traffic light (Red=3'b100, Yellow=3'b010, Green=3'b001)
    output reg [2:0] ew_light  // East-West traffic light (Red=3'b100, Yellow=3'b010, Green=3'b001)
);

    // Define states for the traffic light FSM
    typedef enum logic [2:0] {
        NS_GREEN    = 3'b000,  // North-South Green, East-West Red
        NS_YELLOW   = 3'b001,  // North-South Yellow, East-West Red
        EW_GREEN    = 3'b010,  // North-South Red, East-West Green
        EW_YELLOW   = 3'b011,  // North-South Red, East-West Yellow
        ALL_RED     = 3'b100   // All Red (safety state)
    } state_t;

    state_t current_state, next_state;

    // Timer parameters (in clock cycles)
    parameter NS_GREEN_TIME = 25;   // North-South Green time
    parameter NS_YELLOW_TIME = 5;   // North-South Yellow time
    parameter EW_GREEN_TIME = 25;   // East-West Green time
    parameter EW_YELLOW_TIME = 5;   // East-West Yellow time
    parameter ALL_RED_TIME = 2;     // All Red time

    reg [5:0] counter;              // Counter for timing
    parameter MAX_COUNT = 32'd31;   // Maximum counter value

    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= NS_GREEN;
            counter <= 6'd0;
        end else begin
            current_state <= next_state;
            if (next_state != current_state) begin
                // Reset counter when changing states
                counter <= 6'd0;
            end else begin
                // Increment counter when staying in same state
                if (counter < MAX_COUNT) begin
                    counter <= counter + 1;
                end
            end
        end
    end

    // Next state logic
    always_comb begin
        case (current_state)
            NS_GREEN: begin
                if (counter >= NS_GREEN_TIME - 1) 
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
            end
            NS_YELLOW: begin
                if (counter >= NS_YELLOW_TIME - 1) 
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
            end
            EW_GREEN: begin
                if (counter >= EW_GREEN_TIME - 1) 
                    next_state = EW_YELLOW;
                else
                    next_state = EW_GREEN;
            end
            EW_YELLOW: begin
                if (counter >= EW_YELLOW_TIME - 1) 
                    next_state = NS_GREEN;
                else
                    next_state = EW_YELLOW;
            end
            ALL_RED: begin
                if (counter >= ALL_RED_TIME - 1) 
                    next_state = NS_GREEN;
                else
                    next_state = ALL_RED;
            end
            default: next_state = NS_GREEN;
        endcase
    end

    // Output logic - set traffic light colors based on current state
    always_comb begin
        case (current_state)
            NS_GREEN: begin
                ns_light = 3'b001;  // Green
                ew_light = 3'b100;  // Red
            end
            NS_YELLOW: begin
                ns_light = 3'b010;  // Yellow
                ew_light = 3'b100;  // Red
            end
            EW_GREEN: begin
                ns_light = 3'b100;  // Red
                ew_light = 3'b001;  // Green
            end
            EW_YELLOW: begin
                ns_light = 3'b100;  // Red
                ew_light = 3'b010;  // Yellow
            end
            ALL_RED: begin
                ns_light = 3'b100;  // Red
                ew_light = 3'b100;  // Red
            end
            default: begin
                ns_light = 3'b100;  // Red (safe state)
                ew_light = 3'b100;  // Red (safe state)
            end
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_controller;
    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;

    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #20;
        reset = 0;
        
        // Run for multiple cycles to observe state transitions
        #500;
        
        $display("Simulation completed");
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, State: %b, NS Light: %b (%s), EW Light: %b (%s)", 
                 $time, 
                 uut.current_state,
                 ns_light, 
                 (ns_light == 3'b100) ? "RED" : (ns_light == 3'b010) ? "YELLOW" : "GREEN",
                 ew_light,
                 (ew_light == 3'b100) ? "RED" : (ew_light == 3'b010) ? "YELLOW" : "GREEN");
    end

endmodule