const std = @import("std");
const random = std.crypto.random;

const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    // Создаем экземпляр структуры Point
    const my_point = Point{ .x = 12.5, .y = -7.8 };

    // Генерируем случайное имя файла
    var file_name_buffer: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (&file_name_buffer) |*byte| {
        byte.* = charset[random.intRangeAtMost(usize, 0, charset.len - 1)];
    }
    const file_name = try std.fmt.allocPrint(allocator, "point_data_{s}.bin", .{file_name_buffer[0..]});

    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(file_name, .{});

    // Записываем данные структуры в файл
    // Для простоты, будем использовать простую сериализацию в бинарном виде
    try file.writeAll(std.mem.asBytes(&my_point));
    file.close();

    std.debug.print("Данные точки сохранены в файл: {s}\n", .{file_name});
}