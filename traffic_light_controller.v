// Traffic Light Controller using Finite State Machine
module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] ns_light,  // North-South lights: [2] Red, [1] Yellow, [0] Green
    output reg [2:0] ew_light   // East-West lights: [2] Red, [1] Yellow, [0] Green
);

// Define states for the traffic light FSM
parameter IDLE = 3'b000,
          NS_GREEN = 3'b001,    // North-South Green, East-West Red
          NS_YELLOW = 3'b010,   // North-South Yellow, East-West Red
          EW_GREEN = 3'b011,    // North-South Red, East-West Green
          EW_YELLOW = 3'b100;   // North-South Red, East-West Yellow

reg [2:0] current_state, next_state;

// Counter for timing control
reg [23:0] counter;  // 24-bit counter for longer timing periods
parameter NS_GREEN_TIME = 24'd5000000,  // Time for NS Green (adjust as needed)
          NS_YELLOW_TIME = 24'd1000000, // Time for NS Yellow
          EW_GREEN_TIME = 24'd5000000,  // Time for EW Green
          EW_YELLOW_TIME = 24'd1000000; // Time for EW Yellow

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
        counter <= 24'b0;
    end
    else begin
        current_state <= next_state;
        if (next_state == current_state) begin
            counter <= counter + 1'b1;
        end
        else begin
            counter <= 24'b0;
        end
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: next_state = NS_GREEN;
        NS_GREEN: 
            if (counter >= NS_GREEN_TIME - 1) 
                next_state = NS_YELLOW;
            else 
                next_state = NS_GREEN;
        NS_YELLOW:
            if (counter >= NS_YELLOW_TIME - 1)
                next_state = EW_GREEN;
            else
                next_state = NS_YELLOW;
        EW_GREEN:
            if (counter >= EW_GREEN_TIME - 1)
                next_state = EW_YELLOW;
            else
                next_state = EW_GREEN;
        EW_YELLOW:
            if (counter >= EW_YELLOW_TIME - 1)
                next_state = NS_GREEN;
            else
                next_state = EW_YELLOW;
        default: next_state = IDLE;
    endcase
end

// Output logic - determine light states based on current state
always @(*) begin
    case (current_state)
        NS_GREEN: begin
            ns_light = 3'b001;  // NS Green
            ew_light = 3'b100;  // EW Red
        end
        NS_YELLOW: begin
            ns_light = 3'b010;  // NS Yellow
            ew_light = 3'b100;  // EW Red
        end
        EW_GREEN: begin
            ns_light = 3'b100;  // NS Red
            ew_light = 3'b001;  // EW Green
        end
        EW_YELLOW: begin
            ns_light = 3'b100;  // NS Red
            ew_light = 3'b010;  // EW Yellow
        end
        default: begin  // IDLE state
            ns_light = 3'b100;  // NS Red
            ew_light = 3'b100;  // EW Red
        end
    endcase
end

endmodule

// Testbench for traffic light controller
module tb_traffic_light;
    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
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
        $display("Time, NS_Light, EW_Light");
        $monitor("%0t, NS=%b, EW=%b", $time, ns_light, ew_light);
        
        reset = 1;
        #20;
        reset = 0;
        
        // Run simulation for sufficient time to see all states
        #100000;
        
        $finish;
    end
endmodule