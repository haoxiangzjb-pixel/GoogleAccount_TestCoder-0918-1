const std = @import("std");

// Build file for the randomly named Zig application
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to run the build.
    const optimize = b.standardOptimizeOption(.{});

    // Find the random zig file (assuming it follows the pattern)
    const exe = b.addExecutable(.{
        .name = "random_app",
        .root_source_file = .{ .path = "zig_app_1760774024.zig" },
        .target = target,
        .optimize = optimize,
    });

    // Install the executable
    b.installArtifact(exe);

    // Create a run step
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    // Add the run step to the default step
    const run_step = b.step("run", "Run the random app");
    run_step.dependOn(&run_cmd.step);
    
    // Create a test step for the random app
    const tests = b.addTest(.{
        .root_source_file = .{ .path = "zig_app_1760774024.zig" },
        .target = target,
        .optimize = optimize,
    });
    
    const test_step = b.step("test", "Run tests for the random app");
    test_step.dependOn(&tests.step);
}