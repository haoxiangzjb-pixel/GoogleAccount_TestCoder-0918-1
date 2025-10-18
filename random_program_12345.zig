const std = @import("std");

// A simple program that can be built with Zig
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello from a randomly named Zig file!\n", .{});
}

// A function that could be used in a build process
pub fn buildExample() void {
    std.debug.print("This is an example of build-related functionality.\n", .{});
}

// Unit test for the main function
test "simple test" {
    try std.testing.expect(1 + 1 == 2);
}