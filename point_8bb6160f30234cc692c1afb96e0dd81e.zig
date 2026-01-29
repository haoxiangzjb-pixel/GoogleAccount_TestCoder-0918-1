const std = @import("std");

const Point = struct {
    x: f64,
    y: f64,
    z: f64 = 0.0,

    fn init(x: f64, y: f64, z: f64) Point {
        return Point{ .x = x, .y = y, .z = z };
    }

    fn distanceFromOrigin(self: Point) f64 {
        return std.math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }

    fn print(self: Point, allocator: std.mem.Allocator) !void {
        const output = try std.fmt.allocPrint(allocator, "Point({d}, {d}, {d})", .{ self.x, self.y, self.z });
        defer allocator.free(output);
        std.debug.print("{s}\n", .{output});
    }
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("Структура Point создана!\n");

    const point = Point.init(3.0, 4.0, 5.0);
    try stdout.print("Координаты точки: ({d}, {d}, {d})\n", .{ point.x, point.y, point.z });
    try stdout.print("Расстояние от начала координат: {d}\n", .{point.distanceFromOrigin()});
}
