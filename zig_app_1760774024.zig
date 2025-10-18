const std = @import("std");

// A simple program that demonstrates basic Zig functionality
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello from a randomly named Zig file: zig_app_1760774024.zig!\n", .{});
    
    // Demonstrate a simple calculation
    const result = add(5, 7);
    try stdout.print("5 + 7 = {d}\n", .{result});
}

// A simple function to demonstrate functionality
fn add(a: i32, b: i32) i32 {
    return a + b;
}

// Unit tests for the program
test "add function test" {
    try std.testing.expect(add(2, 3) == 5);
    try std.testing.expect(add(-1, 1) == 0);
    try std.testing.expect(add(10, 20) == 30);
}

test "main function test" {
    // This test just ensures the main function can be called without error
    try main();
}