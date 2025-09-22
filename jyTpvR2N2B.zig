// Point structure in Zig
const std = @import("std");

// Structure to represent a point in 2D space
pub const Point = struct {
    x: f64,
    y: f64,
    
    // Method to create a new point
    pub fn init(x: f64, y: f64) Point {
        return Point{ .x = x, .y = y };
    }
    
    // Method to calculate distance from another point
    pub fn distance(self: Point, other: Point) f64 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return @sqrt(dx * dx + dy * dy);
    }
    
    // Method to print point information
    pub fn print(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() void {
    const p1 = Point.init(3.0, 4.0);
    const p2 = Point.init(0.0, 0.0);
    
    p1.print();
    p2.print();
    
    const dist = p1.distance(p2);
    std.debug.print("Distance between points: {d}\n", .{dist});
}