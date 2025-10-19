const std = @import("std");
const print = std.debug.print;

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    // Создание экземпляра структуры точки
    const my_point = Point{ .x = 3.5, .y = 7.2 };
    
    // Вывод информации о точке
    print("Point coordinates: x = {}, y = {}\n", .{ my_point.x, my_point.y });
    
    // Сохранение в файл
    const file = try std.fs.cwd().createFile("random_point_data.zig", .{});
    defer file.close();
    
    try file.writeAll("const Point = struct {\n    x: f32,\n    y: f32,\n};\n\nconst point_data = Point{ .x = ");
    try file.writeAll(try std.fmt.allocPrint(std.heap.page_allocator, "{d}", .{my_point.x}));
    try file.writeAll(", .y = ");
    try file.writeAll(try std.fmt.allocPrint(std.heap.page_allocator, "{d}", .{my_point.y}));
    try file.writeAll(" };\n");
    
    print("Point data saved to random_point_data.zig\n", .{});
}