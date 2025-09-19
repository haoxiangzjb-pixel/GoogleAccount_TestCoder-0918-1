// Zig structure for point data
const std = @import("std");

// Point structure with integer coordinates
pub const Point = struct {
    x: i32,
    y: i32,
    
    // Initialize a new point
    pub fn new(x: i32, y: i32) Point {
        return Point{ .x = x, .y = y };
    }
    
    // Calculate Manhattan distance from origin
    pub fn manhattanDistance(self: Point) i32 {
        return @abs(self.x) + @abs(self.y);
    }
    
    // Display point information
    pub fn display(self: Point) void {
        std.debug.print("Point: ({}, {})\n", .{ self.x, self.y });
    }
};

pub fn main() void {
    const p = Point.new(-5, 10);
    p.display();
    std.debug.print("Manhattan Distance: {}\n", .{p.manhattanDistance()});
}