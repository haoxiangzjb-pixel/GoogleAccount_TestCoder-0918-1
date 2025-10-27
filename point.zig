const std = @import("std");

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    name: []const u8 = "unnamed",
};

pub fn main() !void {
    // Создаем экземпляр точки
    const point = Point{ .x = 3.14, .y = 2.71, .name = "origin" };
    
    // Генерируем случайное имя файла, используя время
    var seed: u64 = @bitCast(std.time.milliTimestamp());
    var prng = std.rand.DefaultPrng.init(seed);
    var random = prng.random();
    
    var file_name_buffer: [64]u8 = undefined;
    const file_name = try std.fmt.bufPrint(&file_name_buffer, "point_{}.dat", .{random.int(u32)});
    
    // Открываем файл для записи
    var file = try std.fs.cwd().createFile(file_name, .{ .read = true });
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writer().print("Point: x={}, y={}, name={s}\n", .{ point.x, point.y, point.name });
    
    std.debug.print("Точка сохранена в файл: {s}\n", .{file_name});
    std.debug.print("Координаты точки: x = {}, y = {}, name = {s}\n", .{ point.x, point.y, point.name });
}