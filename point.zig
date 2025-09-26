const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Создаем экземпляр структуры Point
    const my_point = Point{ .x = 3.14, .y = 2.71 };

    // Генерируем случайное имя файла
    const seed: u64 = @truncate(@as(u64, @bitCast(std.time.microTimestamp())));
    var prng = std.rand.DefaultPrng.init(seed);
    var random_name_buffer: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (&random_name_buffer) |*b| {
        b.* = charset[prng.random().intRangeAtMost(usize, 0, charset.len - 1)];
    }
    const random_file_name = try std.fmt.allocPrint(allocator, "/tmp/{s}.bin", .{random_name_buffer[0..]});
    std.debug.print("Случайное имя файла: {s}\n", .{random_file_name});

    // Открываем файл для записи
    var file = try std.fs.cwd().createFile(random_file_name, .{});

    // Сериализуем структуру в байты и записываем в файл
    try file.writeAll(std.mem.asBytes(&my_point));

    // Закрываем файл
    file.close();

    try stdout.print("Структура Point записана в файл {s}\n", .{random_file_name});
}