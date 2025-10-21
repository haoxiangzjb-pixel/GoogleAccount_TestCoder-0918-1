const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;
const fs = std.fs;

pub const Point = struct {
    x: f64,
    y: f64,
    
    pub fn init(x_val: f64, y_val: f64) Point {
        return Point{ .x = x_val, .y = y_val };
    }
    
    pub fn toString(self: Point) [64]u8 {
        var buffer: [64]u8 = undefined;
        _ = std.fmt.bufPrint(&buffer, "Point({d}, {d})", .{ self.x, self.y }) catch {
            @memcpy(buffer[0..22], "Point formatting error");
            buffer[22] = 0;
        };
        return buffer;
    }
};

pub fn main() !void {
    // Создаем точку
    const point = Point.init(3.14, 2.71);
    
    // Выводим информацию о точке
    print("Created {s}\n", .{point.toString()});
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    const rand = prng.random();
    
    var filename: [64]u8 = undefined;
    const n = try std.fmt.bufPrint(&filename, "/tmp/point_data_{}.txt", .{rand.int(u32)});
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(n, .{});
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writeAll("Point coordinates:\n");
    try file.writeAll("X: ");
    try file.writer().print("{d}\n", .{point.x});
    try file.writeAll("Y: ");
    try file.writer().print("{d}\n", .{point.y});
    
    print("Point data saved to {s}\n", .{filename});
}