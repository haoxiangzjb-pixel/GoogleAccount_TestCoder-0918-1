const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const point = Point{ .x = 3.14, .y = 2.71 };
    
    // Генерируем случайное имя файла
    var seed: u64 = @truncate(@as(u64, @intFromPtr(&point)));
    var random = std.rand.DefaultPrng.init(seed);
    const rand = random.random();
    
    var file_name: [16]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (&file_name) |*byte| {
        byte.* = alphabet[rand.uintAtMost(usize, alphabet.len - 1)];
    }
    
    const file = try std.fs.cwd().createFile(&file_name ++ ".dat", .{});
    defer file.close();
    
    // Сохраняем точку в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    std.debug.print("Точка сохранена в файл: {s}.dat\n", .{file_name});
}