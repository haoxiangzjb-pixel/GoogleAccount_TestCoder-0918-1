const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
    
    // Метод для вывода информации о точке
    pub fn display(self: Point) void {
        print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр точки
    var point = Point{ .x = 3.14, .y = 2.71 };
    
    // Выводим информацию о точке
    point.display();
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    var filename = try std.ArrayList(u8).initCapacity(allocator, 16);
    defer filename.deinit();
    
    // Добавляем префикс "point_data_"
    try filename.appendSlice("point_data_");
    
    // Добавляем случайные символы
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (0..8) |_| {
        try filename.append(chars[rand.uintAtMost(usize, chars.len - 1)]);
    }
    
    // Добавляем расширение
    try filename.appendSlice(".bin");
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(filename.items, .{});
    defer file.close();
    
    // Записываем данные точки в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    print("Point data saved to file: {s}\n", .{filename.items});
}