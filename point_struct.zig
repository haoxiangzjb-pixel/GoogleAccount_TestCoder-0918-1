// Определение структуры точки в Zig
const Point = struct {
    x: f32,
    y: f32,
};

// Пример экземпляра структуры
const example_point = Point{ .x = 3.5, .y = 7.2 };

// Функция для вывода информации о точке
pub fn printPoint(p: Point) void {
    std.debug.print("Point(x: {d}, y: {d})\n", .{ p.x, p.y });
}

const std = @import("std");

// Основная функция для демонстрации
pub fn main() void {
    printPoint(example_point);
}