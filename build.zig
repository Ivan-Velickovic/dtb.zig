const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("dtb", .{
        .root_source_file = b.path("src/dtb.zig"),
    });

    const main_tests = b.addTest(.{
        .root_source_file = b.path("src/dtb.zig"),
    });

    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_main_tests.step);
}
