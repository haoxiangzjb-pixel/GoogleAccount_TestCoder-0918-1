// Traffic Light Controller using Finite State Machine
// Designed with Verilog

module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // Reset signal
    output reg [2:0] NS_light, // North-South traffic light (R=3'b100, Y=3'b010, G=3'b001)
    output reg [2:0] EW_light  // East-West traffic light (R=3'b100, Y=3'b010, G=3'b001)
);

    // Define states for the traffic light FSM
    parameter IDLE = 3'b000,
              NS_GREEN = 3'b001,    // North-South Green, East-West Red
              NS_YELLOW = 3'b010,   // North-South Yellow, East-West Red
              EW_GREEN = 3'b011,    // North-South Red, East-West Green
              EW_YELLOW = 3'b100;   // North-South Red, East-West Yellow

    reg [2:0] current_state, next_state;

    // Counter for timing control
    reg [19:0] counter;
    parameter NS_GREEN_TIME = 20'd5000000,  // Time for NS green (adjust for actual timing)
              YELLOW_TIME = 20'd1000000,    // Time for yellow (adjust for actual timing)
              EW_GREEN_TIME = 20'd5000000;  // Time for EW green (adjust for actual timing)

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Counter for timing - increments every clock cycle
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 20'b0;
        else if (current_state == NS_GREEN && counter < NS_GREEN_TIME)
            counter <= counter + 1'b1;
        else if (current_state == NS_YELLOW && counter < YELLOW_TIME)
            counter <= counter + 1'b1;
        else if (current_state == EW_GREEN && counter < EW_GREEN_TIME)
            counter <= counter + 1'b1;
        else if (current_state == EW_YELLOW && counter < YELLOW_TIME)
            counter <= counter + 1'b1;
        else
            counter <= 20'b0;  // Reset counter when state changes
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: 
                if (!reset)
                    next_state = NS_GREEN;
                else
                    next_state = IDLE;
                    
            NS_GREEN:
                if (counter >= NS_GREEN_TIME)
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
                    
            NS_YELLOW:
                if (counter >= YELLOW_TIME)
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
                    
            EW_GREEN:
                if (counter >= EW_GREEN_TIME)
                    next_state = EW_YELLOW;
                else
                    next_state = EW_GREEN;
                    
            EW_YELLOW:
                if (counter >= YELLOW_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = EW_YELLOW;
                    
            default:
                next_state = IDLE;
        endcase
    end

    // Output logic - set traffic light colors based on current state
    always @(*) begin
        case (current_state)
            NS_GREEN: begin
                NS_light = 3'b001;  // Green
                EW_light = 3'b100;  // Red
            end
            NS_YELLOW: begin
                NS_light = 3'b010;  // Yellow
                EW_light = 3'b100;  // Red
            end
            EW_GREEN: begin
                NS_light = 3'b100;  // Red
                EW_light = 3'b001;  // Green
            end
            EW_YELLOW: begin
                NS_light = 3'b100;  // Red
                EW_light = 3'b010;  // Yellow
            end
            default: begin  // IDLE state
                NS_light = 3'b100;  // Red
                EW_light = 3'b100;  // Red
            end
        endcase
    end

endmodule

// Testbench for traffic light controller
module tb_traffic_light_fsm;
    reg clk, reset;
    wire [2:0] NS_light, EW_light;

    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Test sequence
    initial begin
        $display("Time, NS_light, EW_light, State");
        $monitor("%0t, NS: %b, EW: %b", $time, NS_light, EW_light);
        
        reset = 1;
        #20;
        reset = 0;
        
        #15000000;  // Run for a while to see state transitions
        
        $finish;
    end

endmodule