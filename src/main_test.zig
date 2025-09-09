const std = @import("std");
const testing = std.testing;

test "always succeds" {
    try testing.expect(true);
}