// Zig structure for storing point information
const std = @import("std");

// Point structure with x and y coordinates
pub const Point = struct {
    x: f64,
    y: f64,

    // Function to create a new point
    pub fn init(x: f64, y: f64) Point {
        return Point{ .x = x, .y = y };
    }

    // Function to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f64 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }

    // Function to display point information
    pub fn display(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() void {
    var point = Point.init(3.0, 4.0);
    point.display();
    std.debug.print("Distance from origin: {d}\n", .{point.distanceFromOrigin()});
}