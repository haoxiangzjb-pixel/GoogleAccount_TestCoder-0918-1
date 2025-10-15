// 交通灯控制器 Verilog 状态机实现
// 控制红、黄、绿三种颜色的交通灯

module traffic_light_fsm (
    input wire clk,        // 时钟信号
    input wire reset,      // 复位信号
    output reg [2:0] lights // 3位输出，[2]红灯, [1]黄灯, [0]绿灯
);

    // 定义状态
    parameter RED_STATE    = 3'b001;
    parameter GREEN_STATE  = 3'b010;
    parameter YELLOW_STATE = 3'b100;

    // 计数器用于控制灯的持续时间
    reg [23:0] counter; // 24位计数器，用于计时
    
    // 当前状态和下一个状态
    reg [2:0] current_state, next_state;

    // 状态寄存器
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED_STATE;
            counter <= 24'd0;
        end
        else begin
            current_state <= next_state;
            if (counter < 24'hFFFFFF) begin
                counter <= counter + 1;
            end
            else begin
                counter <= 24'd0;
            end
        end
    end

    // 组合逻辑确定下一个状态
    always @(*) begin
        case (current_state)
            RED_STATE: begin
                if (counter >= 24'd5000000) // 红灯持续时间 (假设时钟频率为50MHz，则约100秒)
                    next_state = GREEN_STATE;
                else
                    next_state = RED_STATE;
            end
            GREEN_STATE: begin
                if (counter >= 24'd3000000) // 绿灯持续时间 (假设时钟频率为50MHz，则约60秒)
                    next_state = YELLOW_STATE;
                else
                    next_state = GREEN_STATE;
            end
            YELLOW_STATE: begin
                if (counter >= 24'd1000000) // 黄灯持续时间 (假设时钟频率为50MHz，则约20秒)
                    next_state = RED_STATE;
                else
                    next_state = YELLOW_STATE;
            end
            default: next_state = RED_STATE;
        endcase
    end

    // 输出逻辑 - 控制灯光
    always @(*) begin
        case (current_state)
            RED_STATE: lights = 3'b100;    // 红灯亮
            GREEN_STATE: lights = 3'b010;  // 绿灯亮
            YELLOW_STATE: lights = 3'b001; // 黄灯亮
            default: lights = 3'b100;      // 默认红灯亮
        endcase
    end

endmodule

// 测试模块
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] lights;
    
    // 实例化被测试的模块
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .lights(lights)
    );
    
    // 生成时钟
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50MHz时钟周期为20ns，所以半周期10ns
    end
    
    // 初始化测试
    initial begin
        reset = 1;
        #100;
        reset = 0;
        
        // 运行几个周期观察状态变化
        #100000000; // 运行足够长的时间观察状态变化
        $finish;
    end
    
    // 监控输出
    initial begin
        $monitor("Time: %0t ns, State: %b, Lights(RGY): %b", $time, uut.current_state, lights);
    end
    
endmodule