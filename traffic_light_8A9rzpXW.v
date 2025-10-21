// Traffic Light Controller using Finite State Machine
// Designed for a simple traffic light system with two directions

module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // Active high reset
    input wire pedestrian,    // Pedestrian button input
    output reg [2:0] ns_light, // North-South light (000=off, 001=red, 010=yellow, 100=green)
    output reg [2:0] ew_light  // East-West light (000=off, 001=red, 010=yellow, 100=green)
);

// Define states
parameter IDLE = 3'b000;
parameter NS_GREEN = 3'b001;      // North-South green, East-West red
parameter NS_YELLOW = 3'b010;     // North-South yellow, East-West red
parameter EW_GREEN = 3'b011;      // East-West green, North-South red
parameter EW_YELLOW = 3'b100;     // East-West yellow, North-South red
parameter PED_WAIT = 3'b101;      // Pedestrian crossing time

// Internal signals
reg [2:0] current_state, next_state;
reg [23:0] counter;  // 24-bit counter for timing (can count up to ~16M cycles)
parameter NS_GREEN_TIME = 24'd5000000;  // 5 seconds at 1MHz (adjust as needed)
parameter YELLOW_TIME = 24'd1000000;    // 1 second at 1MHz
parameter EW_GREEN_TIME = 24'd3000000;  // 3 seconds at 1MHz
parameter PED_TIME = 24'd4000000;       // 4 seconds for pedestrian crossing

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
        counter <= 24'd0;
    end else begin
        if (counter < NS_GREEN_TIME) begin
            counter <= counter + 1;
        end else begin
            counter <= 24'd0;  // Reset counter when reaching max
        end
        current_state <= next_state;
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: 
            if (!reset) next_state = NS_GREEN;
            else next_state = IDLE;
            
        NS_GREEN:
            if ((counter >= NS_GREEN_TIME) || pedestrian) 
                next_state = NS_YELLOW;
            else 
                next_state = NS_GREEN;
                
        NS_YELLOW:
            if (counter >= YELLOW_TIME) 
                next_state = EW_GREEN;
            else 
                next_state = NS_YELLOW;
                
        EW_GREEN:
            if ((counter >= EW_GREEN_TIME) || pedestrian) 
                next_state = EW_YELLOW;
            else 
                next_state = EW_GREEN;
                
        EW_YELLOW:
            if (counter >= YELLOW_TIME) 
                next_state = NS_GREEN;  // Return to NS green
            else 
                next_state = EW_YELLOW;
                
        default: next_state = IDLE;
    endcase
end

// Output logic - light control
always @(posedge clk or posedge reset) begin
    if (reset) begin
        ns_light <= 3'b001;  // Red light initially
        ew_light <= 3'b001;  // Red light initially
    end else begin
        case (next_state)
            NS_GREEN: begin
                ns_light <= 3'b100;  // Green
                ew_light <= 3'b001;  // Red
            end
            NS_YELLOW: begin
                ns_light <= 3'b010;  // Yellow
                ew_light <= 3'b001;  // Red
            end
            EW_GREEN: begin
                ns_light <= 3'b001;  // Red
                ew_light <= 3'b100;  // Green
            end
            EW_YELLOW: begin
                ns_light <= 3'b001;  // Red
                ew_light <= 3'b010;  // Yellow
            end
            default: begin
                ns_light <= 3'b001;  // Red
                ew_light <= 3'b001;  // Red
            end
        endcase
    end
end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    reg pedestrian;
    
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light controller
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .pedestrian(pedestrian),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // Clock generation (1MHz = 1us period)
    initial begin
        clk = 0;
        forever #500 clk = ~clk;  // 1us period = 1MHz
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        pedestrian = 0;
        
        #1000;  // Wait for reset
        reset = 0;
        
        $display("Time, NS_Light, EW_Light, State");
        $monitor("%0t, NS=%b, EW=%b", $time, ns_light, ew_light);
        
        // Run simulation for a while
        #100000000;  // Run for 100ms
        
        // Test pedestrian button
        #5000000;
        pedestrian = 1;
        #1000000;  // Hold for 1ms
        pedestrian = 0;
        
        #50000000;  // Run for more time
        
        $finish;
    end
    
endmodule