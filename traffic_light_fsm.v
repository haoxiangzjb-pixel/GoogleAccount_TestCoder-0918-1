// Traffic Light Controller using Finite State Machine
module traffic_light_fsm (
    input wire clk,
    input wire reset,
    output reg [2:0] ns_light,  // North-South lights: [2] Red, [1] Yellow, [0] Green
    output reg [2:0] ew_light   // East-West lights: [2] Red, [1] Yellow, [0] Green
);

// Define states
parameter IDLE = 3'b000;
parameter NS_GREEN = 3'b001;    // North-South Green, East-West Red
parameter NS_YELLOW = 3'b010;   // North-South Yellow, East-West Red
parameter EW_GREEN = 3'b011;    // North-South Red, East-West Green
parameter EW_YELLOW = 3'b100;   // North-South Red, East-West Yellow

// Internal state register
reg [2:0] current_state, next_state;

// Counter for timing control
reg [23:0] timer;  // 24-bit counter for longer timing
parameter NS_GREEN_TIME = 24'd5000000;   // Time for NS Green (adjust as needed)
parameter YELLOW_TIME = 24'd1000000;    // Time for Yellow (adjust as needed)
parameter EW_GREEN_TIME = 24'd5000000;   // Time for EW Green (adjust as needed)

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
        timer <= 24'd0;
    end else begin
        current_state <= next_state;
        if (current_state != next_state) begin
            timer <= 24'd0;  // Reset timer when state changes
        end else begin
            timer <= timer + 24'd1;  // Increment timer
        end
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: begin
            if (!reset) next_state = NS_GREEN;
            else next_state = IDLE;
        end
        NS_GREEN: begin
            if (timer >= NS_GREEN_TIME) next_state = NS_YELLOW;
            else next_state = NS_GREEN;
        end
        NS_YELLOW: begin
            if (timer >= YELLOW_TIME) next_state = EW_GREEN;
            else next_state = NS_YELLOW;
        end
        EW_GREEN: begin
            if (timer >= EW_GREEN_TIME) next_state = EW_YELLOW;
            else next_state = EW_GREEN;
        end
        EW_YELLOW: begin
            if (timer >= YELLOW_TIME) next_state = NS_GREEN;
            else next_state = EW_YELLOW;
        end
        default: next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    case (current_state)
        NS_GREEN: begin
            ns_light = 3'b001;  // NS Green ON
            ew_light = 3'b100;  // EW Red ON
        end
        NS_YELLOW: begin
            ns_light = 3'b010;  // NS Yellow ON
            ew_light = 3'b100;  // EW Red ON
        end
        EW_GREEN: begin
            ns_light = 3'b100;  // NS Red ON
            ew_light = 3'b001;  // EW Green ON
        end
        EW_YELLOW: begin
            ns_light = 3'b100;  // NS Red ON
            ew_light = 3'b010;  // EW Yellow ON
        end
        default: begin  // IDLE state
            ns_light = 3'b100;  // NS Red ON
            ew_light = 3'b100;  // EW Red ON
        end
    endcase
end

endmodule

// Testbench for Traffic Light Controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light controller
    traffic_light_fsm uut (
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
        
        // Run simulation for a while to see state transitions
        #15000000;  // Run for a long enough time to see all states
        
        $finish;
    end
    
endmodule