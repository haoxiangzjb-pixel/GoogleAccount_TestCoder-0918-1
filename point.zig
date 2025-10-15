const std = @import("std");
const print = std.debug.print;
const File = std.fs.File;

// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
};

pub fn main() !void {
    // Создаем экземпляр точки
    const point = Point{ .x = 3.14, .y = 2.71 };
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    var file_name_buffer: [16]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    
    for (file_name_buffer) |*byte| {
        byte.* = alphabet[rand.uintAtMost(usize, alphabet.len - 1)];
    }
    
    const file_name = try std.fmt.bufPrint(&file_name_buffer, "{s}.dat", .{&file_name_buffer});
    
    // Открываем файл для записи
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    const file = try std.fs.cwd().createFile(file_name, .{});
    defer file.close();
    
    // Записываем точку в файл (в бинарном формате)
    try file.writeStruct(point);
    
    print("Точка сохранена в файл: {s}\n", .{file_name});
    print("Координаты точки: x = {}, y = {}\n", .{ point.x, point.y });
}