// Point structure for storing 2D coordinates
const std = @import("std");

pub const Point = struct {
    x: f32,
    y: f32,
    
    // Method to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }
    
    // Method to calculate distance to another point
    pub fn distanceTo(self: Point, other: Point) f32 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return std.math.sqrt(dx * dx + dy * dy);
    }
    
    // Method to create a new point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }
};

// Example usage
pub fn main() void {
    const point1 = Point.init(3.0, 4.0);
    const point2 = Point.init(0.0, 0.0);
    
    std.debug.print("Point 1: ({d}, {d})\n", .{ point1.x, point1.y });
    std.debug.print("Distance from origin: {d}\n", .{point1.distanceFromOrigin()});
    std.debug.print("Distance to point 2: {d}\n", .{point1.distanceTo(point2)});
}