// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования структуры
pub fn main() void {
    const point = Point{ .x = 3.5, .y = 7.2 };
    std.debug.print("Point coordinates: x = {}, y = {}\n", .{ point.x, point.y });
}

const std = @import("std");