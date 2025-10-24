// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with Red, Yellow, and Green lights
// States: RED -> GREEN -> YELLOW -> RED (cycling)

module traffic_light_controller (
    input wire clk,           // System clock
    input wire reset,         // Reset signal (active high)
    output reg [2:0] lights   // 3-bit output: [2] Red, [1] Yellow, [0] Green
);

    // Define states for the traffic light FSM
    typedef enum reg [1:0] {
        RED_STATE   = 2'b00,  // Red light (stop)
        GREEN_STATE = 2'b01,  // Green light (go)
        YELLOW_STATE = 2'b10  // Yellow light (caution)
    } state_t;
    
    state_t current_state, next_state;
    
    // Timing parameters (in clock cycles)
    parameter RED_TIME = 20;      // Red light duration
    parameter GREEN_TIME = 15;    // Green light duration
    parameter YELLOW_TIME = 5;    // Yellow light duration
    
    parameter MAX_TIME = RED_TIME > GREEN_TIME ? (RED_TIME > YELLOW_TIME ? RED_TIME : YELLOW_TIME) : (GREEN_TIME > YELLOW_TIME ? GREEN_TIME : YELLOW_TIME);
    reg [$clog2(MAX_TIME):0] counter;
    
    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED_STATE;
            counter <= 0;
        end else begin
            current_state <= next_state;
            case (current_state)
                RED_STATE: begin
                    if (counter < RED_TIME - 1)
                        counter <= counter + 1;
                    else
                        counter <= 0;
                end
                GREEN_STATE: begin
                    if (counter < GREEN_TIME - 1)
                        counter <= counter + 1;
                    else
                        counter <= 0;
                end
                YELLOW_STATE: begin
                    if (counter < YELLOW_TIME - 1)
                        counter <= counter + 1;
                    else
                        counter <= 0;
                end
                default: counter <= 0;
            endcase
        end
    end
    
    // Next state logic
    always @(*) begin
        case (current_state)
            RED_STATE: begin
                if (counter == RED_TIME - 1)
                    next_state = GREEN_STATE;
                else
                    next_state = RED_STATE;
            end
            GREEN_STATE: begin
                if (counter == GREEN_TIME - 1)
                    next_state = YELLOW_STATE;
                else
                    next_state = GREEN_STATE;
            end
            YELLOW_STATE: begin
                if (counter == YELLOW_TIME - 1)
                    next_state = RED_STATE;
                else
                    next_state = YELLOW_STATE;
            end
            default: next_state = RED_STATE;
        endcase
    end
    
    // Output logic - set the lights based on current state
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lights <= 3'b100;  // Initially red light on
        end else begin
            case (current_state)
                RED_STATE:     lights <= 3'b100;  // Red only
                GREEN_STATE:   lights <= 3'b001;  // Green only
                YELLOW_STATE:  lights <= 3'b010;  // Yellow only
                default:       lights <= 3'b100;  // Default to red
            endcase
        end
    end

endmodule

// Testbench for traffic light controller
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
        forever #5 clk = ~clk;  // 10 time unit period
    end
    
    // Test sequence
    initial begin
        $display("Time, Red, Yellow, Green");
        $monitor("%0t, %b, %b, %b", $time, lights[2], lights[1], lights[0]);
        
        // Initialize
        reset = 1;
        #10;
        reset = 0;
        
        // Run for a few cycles to see state transitions
        #300;
        
        $finish;
    end

endmodule