// Traffic Light Controller using Finite State Machine
// This module implements a traffic light controller with 4 states:
// - RED_ONLY: Red light for main road
// - RED_AMBER: Red and amber together (transition state)
// - GREEN_ONLY: Green light for main road
// - AMBER_ONLY: Amber light (transition to red)

module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] main_road_light,    // 001=Red, 010=Amber, 100=Green
    output reg [2:0] side_road_light     // 001=Red, 010=Amber, 100=Green
);

// Define states
parameter RED_ONLY = 3'b000;
parameter RED_AMBER = 3'b001;
parameter GREEN_ONLY = 3'b010;
parameter AMBER_ONLY = 3'b011;

// Internal state register
reg [2:0] current_state, next_state;

// Timer for controlling state duration
reg [23:0] timer;  // 24-bit timer for longer delays
parameter RED_TIME = 24'd50000000;      // 1 second at 50MHz clock
parameter RED_AMBER_TIME = 24'd5000000; // 0.1 second at 50MHz clock
parameter GREEN_TIME = 24'd30000000;    // 0.6 second at 50MHz clock
parameter AMBER_TIME = 24'd5000000;     // 0.1 second at 50MHz clock

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= RED_ONLY;
        timer <= 24'd0;
    end else begin
        if (timer < 24'hFFFFFF) begin
            timer <= timer + 1;
        end
        
        current_state <= next_state;
        
        // Reset timer when changing state
        case (next_state)
            RED_ONLY: if (current_state != RED_ONLY) timer <= 24'd0;
            RED_AMBER: if (current_state != RED_AMBER) timer <= 24'd0;
            GREEN_ONLY: if (current_state != GREEN_ONLY) timer <= 24'd0;
            AMBER_ONLY: if (current_state != AMBER_ONLY) timer <= 24'd0;
        endcase
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        RED_ONLY: 
            if (timer >= RED_TIME)
                next_state = GREEN_ONLY;
            else
                next_state = RED_ONLY;
                
        RED_AMBER:
            if (timer >= RED_AMBER_TIME)
                next_state = GREEN_ONLY;
            else
                next_state = RED_AMBER;
                
        GREEN_ONLY:
            if (timer >= GREEN_TIME)
                next_state = AMBER_ONLY;
            else
                next_state = GREEN_ONLY;
                
        AMBER_ONLY:
            if (timer >= AMBER_TIME)
                next_state = RED_ONLY;
            else
                next_state = AMBER_ONLY;
                
        default: next_state = RED_ONLY;
    endcase
end

// Output logic - light assignments
always @(*) begin
    case (current_state)
        RED_ONLY: begin
            main_road_light = 3'b001;    // Red
            side_road_light = 3'b100;    // Green
        end
        RED_AMBER: begin
            main_road_light = 3'b011;    // Red + Amber
            side_road_light = 3'b010;    // Amber
        end
        GREEN_ONLY: begin
            main_road_light = 3'b100;    // Green
            side_road_light = 3'b001;    // Red
        end
        AMBER_ONLY: begin
            main_road_light = 3'b010;    // Amber
            side_road_light = 3'b001;    // Red
        end
        default: begin
            main_road_light = 3'b001;    // Red
            side_road_light = 3'b001;    // Red
        end
    endcase
end

endmodule

// Testbench for the traffic light controller
module traffic_light_tb;
    reg clk;
    reg reset;
    wire [2:0] main_road_light;
    wire [2:0] side_road_light;
    
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .main_road_light(main_road_light),
        .side_road_light(side_road_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // 50MHz clock (20ns period = 10ns high, 10ns low)
    end
    
    // Stimulus
    initial begin
        reset = 1;
        #100;
        reset = 0;
        
        // Run simulation for several cycles
        #100000000;  // Run for 100 million time units
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Main: %b | Side: %b | State: %s", 
                 $time, main_road_light, side_road_light, 
                 (uut.current_state == uut.RED_ONLY) ? "RED_ONLY" :
                 (uut.current_state == uut.RED_AMBER) ? "RED_AMBER" :
                 (uut.current_state == uut.GREEN_ONLY) ? "GREEN_ONLY" : "AMBER_ONLY");
    end
endmodule