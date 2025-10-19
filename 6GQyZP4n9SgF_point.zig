const std = @import("std");

/// Структура для хранения информации о точке
pub const Point = struct {
    x: f32 = 0.0,
    y: f32 = 0.0,
    
    /// Создает новую точку с заданными координатами
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }
    
    /// Вычисляет расстояние до другой точки
    pub fn distanceTo(self: Point, other: Point) f32 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return @sqrt(dx * dx + dy * dy);
    }
    
    /// Возвращает строковое представление точки
    pub fn toString(self: Point) [64]u8 {
        var buffer: [64]u8 = undefined;
        _ = std.fmt.bufPrint(&buffer, "Point({d}, {d})", .{ self.x, self.y }) catch "Point(?, ?)";
        return buffer;
    }
};

// Пример использования
pub fn main() void {
    const p1 = Point.init(3.5, 7.2);
    const p2 = Point.init(0.0, 0.0);
    
    std.debug.print("Point 1: {s}\\n", .{p1.toString()});
    std.debug.print("Point 2: {s}\\n", .{p2.toString()});
    std.debug.print("Distance between points: {d}\\n", .{p1.distanceTo(p2)});
}
