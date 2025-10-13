// Тестовая плата для D-триггера
`timescale 1ns / 1ps

module d_ff_test;
    reg clk;
    reg reset;
    reg d;
    wire q, q_bar;

    // Подключение тестируемого модуля (предполагается, что он называется d_flipflop)
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Инициализация сигналов
    initial begin
        clk = 0;
        reset = 0;
        d = 0;
    end

    // Тактовый генератор
    always #5 clk = ~clk; // Переключение каждые 5 нс

    // Тестирование
    initial begin
        $display("Time, D, Q, Q_bar");
        $monitor("%0t, %b, %b, %b", $time, d, q, q_bar);

        // Сброс
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Тестирование входа D
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        // Завершение симуляции
        #20 $finish;
    end

endmodule