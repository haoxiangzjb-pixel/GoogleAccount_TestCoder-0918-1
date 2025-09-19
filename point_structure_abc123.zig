// Point structure in Zig
const std = @import("std");

// Structure to represent a point in 2D space
pub const Point = struct {
    x: f32,
    y: f32,
    
    // Method to initialize a point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }
    
    // Method to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }
    
    // Method to print point information
    pub fn print(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() void {
    var p = Point.init(3.0, 4.0);
    p.print();
    std.debug.print("Distance from origin: {d}\n", .{p.distanceFromOrigin()});
}