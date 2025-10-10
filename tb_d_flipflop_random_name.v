`timescale 1ns / 1ps

// Простой D-триггер для тестирования
module d_flipflop (
    input clk,
    input rst_n, // Асинхронный сброс, активный низкий уровень
    input d,
    output reg q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 1'b0;
        end else begin
            q <= d;
        end
    end

endmodule

// Тестовая плата для D-триггера
module tb_d_flipflop;

    // Объявление сигналов
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Инстанс D-триггера
    d_flipflop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Инициализация сигналов и симуляции
    initial begin
        // Открытие VCD-файла для визуализации
        $dumpfile("tb_d_flipflop.vcd");
        $dumpvars(0, tb_d_flipflop);

        // Инициализация сигналов
        clk = 0;
        rst_n = 0; // Установка в состояние сброса
        d = 0;

        // Ждем немного и снимаем сброс
        #10;
        rst_n = 1; // Сброс снят
        $display("Time: %0t ns - Reset released, rst_n = %b", $time, rst_n);

        // Пример изменения входа D и ожидания реакции на фронте тактового сигнала
        #5;
        d = 1;
        $display("Time: %0t ns - Input D set to %b", $time, d);
        #10; // Ждем один период тактового сигнала (5+10=15, следующий фронт на 20)
        $display("Time: %0t ns - Output Q is %b", $time, q);

        #10;
        d = 0;
        $display("Time: %0t ns - Input D set to %b", $time, d);
        #10; // Ждем один период тактового сигнала
        $display("Time: %0t ns - Output Q is %b", $time, q);

        #10;
        d = 1;
        $display("Time: %0t ns - Input D set to %b", $time, d);
        #10; // Ждем один период тактового сигнала
        $display("Time: %0t ns - Output Q is %b", $time, q);

        // Завершение симуляции
        #20;
        $finish;
    end

    // Генерация тактового сигнала (период 10 нс)
    always #5 clk = ~clk;

endmodule