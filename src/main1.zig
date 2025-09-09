const std = @import("std");

pub fn main1() !void{
    std.debug.print("hello world!\n", .{});

    const studentAge = 12;
    std.debug.print("Age is: {d}\n", .{studentAge});
    var johnAge: i32 = 23;
    johnAge = 25;
    std.debug.print("john is {d} years old!\n", .{johnAge});

    var luckNumber: u8 = undefined;
    luckNumber = 200;
    std.debug.print("lucky number: {d}\n", .{luckNumber});

    const winningNumber: i32 = 123;
    _ = winningNumber;

    const numbs1 = [3] i8{12,44,90};
    const numb2 =  [_]i32{1,2,54,311};

    _ = numbs1;
    _ = numb2;

    // _ means discard object | destroying the object!

    const matesAges = [_]i32{23,26,29};
    std.debug.print("first age: {d}, second: {d} \n", .{matesAges[0], matesAges[1]});
    const playersAges = [_]i8{23,54};
    std.debug.print("printing first number: {d}\n", .{playersAges[0]});

    const firstNumber: i8 = 34;
    var secondNumber: i8 = 12;
    secondNumber += 1;
    const thirdNumber: i32 = 892;
    std.debug.print("first number: {d}, second number: {d}\n", .{firstNumber, secondNumber});
    _ = thirdNumber;

    const topNumbers = [_]i32{12,43,77,23,16};
    std.debug.print("first number: {d}\n", .{topNumbers[0]});
    //selecting a slice/section of an array using range-selector

    const range1 = topNumbers[1..3];
    std.debug.print("1: {d}, 2: {d}\n", .{range1[0], range1[1]});
    std.debug.print("range1 length, {d}\n", .{range1.len});
    const range1Copy = range1[0..range1.len];
    _ = range1Copy;
    const from2toEnd = range1[1..];
    _ = from2toEnd;

    //array operators in zig, ++, **

    const arr1 = [_]i8{1,2};
    const arr2 = [_]i8{3,4};
    const arr3 = arr1 ++ arr2;
    std.debug.print("{any}\n", .{arr3});
    const arr4 = arr1 ** 3;
    std.debug.print("{any}\n", .{arr4});

    const word1: []const u8 = "hello, world";
    std.debug.print("{s}\n", .{word1});

    const baseNumbers = [_]i8{1,2,3,4,5};
    const sliceFromBase = baseNumbers[1..];
    std.debug.print("base lenght: {d}, fromBase length: {d}\n", .{baseNumbers.len, sliceFromBase.len});

    const message1 = "hello, world";
    const message2: []const u8 = "something soweto!";
    std.debug.print("first message -> {s}\n", .{message1});
    std.debug.print("second message -> {s}\n", .{message2});

    const message3 = "something here!";  // *const [15:0]u8
    _ = message3;

    const arra1: [4]u8 = [_]u8{1,3,4,5};
    const slice1: []const u8 = "oops!";
    std.debug.print("{any}\n", .{arra1});
    std.debug.print("{s}\n",.{slice1});

    //2 types of string values to care about in zig
    //string literal values -> is just a pointer to a null-terminated array of bytes, *const [n:0] u8
    //string object -> basically a slice to an arbitrary sequence of bytes, []u8, []const u8

    try std.fs.File.stdout().writeAll("from within!\n");

    const wordx = "word";
    std.debug.print("printing the bytes: ", .{});
    for(wordx) |word| {
        std.debug.print("{d}, ", .{word});
    }
    std.debug.print("\n", .{});

    //@TypeOf -> to check the object type in zig

    const simple_arra = [_]u32{1,2,3,4};
    const string_obj: []const u8 = "hello, world";
    std.debug.print("type 1: {}\n", .{@TypeOf(simple_arra)});
    std.debug.print("type 2: {}\n", .{@TypeOf("a string literal")});
    std.debug.print("type 3: {}\n", .{@TypeOf(&simple_arra)});
    std.debug.print("type 4: {}\n", .{@TypeOf(string_obj)});

    const numbx = 12;
    if(numbx > 10) {
        std.debug.print("12 is greater than 10!\n", .{});
    }else {
        std.debug.print("12 is less than 10!\n", .{});
    }

    const Role = enum {
        FE, BE, SE, HR, PM, SL
    };
    var area: []const u8 = undefined;
    const role = Role.SE;
    switch (role) {
        .BE, .FE => {
            area = "web guys!";
        },
        .HR, .PM => {
            area = "company front face";
        },
        .SE => {
            area = "company engine";
        },
        .SL => {
            area = "company sellers!";
        }
    }
    std.debug.print("area is more about: {s}\n", .{area});

    const codingLevel: u8 = 3;
    const codingLevelMessage = switch (codingLevel) {
        1, 2 => "the beginner level!",
        3 => "proffessional!",
        else => {
            @panic("other levels are not allowed!");
        }
    };
    std.debug.print("{s}\n", .{codingLevelMessage});

    const debugingLevel: u16 = 34;
    const debugingLevelMessage: []const u8 = switch (debugingLevel) {
        1...25 => "beginner!",
        26...45 => "intermediate!",
        46...70 => "early senior!",
        71...100 => "advanced!",
        else => {
            @panic("Not permited!");
        }
    };
    std.debug.print("debugging level is: {s}\n", .{debugingLevelMessage});

    try doingNothing();

    const hackerName = [_]u8{'t','h','a', 'z', 'a'};
    for(hackerName) |name| {
        std.debug.print("{c} |", .{name});
    }
    std.debug.print("\n", .{});
    for(hackerName[0..3])| name| {
        std.debug.print("{c}, ", .{name});
    }
    std.debug.print("\n", .{});

    const classMatesAges = [_]u8{22,23,25,26,29};
    std.debug.print("class mates number: {d}\n", .{classMatesAges.len});

    for(classMatesAges[0..3], 0..) |age, i| {
        std.debug.print("{d} -> {d}\n", .{i, age});
    }
}

fn doingNothing() !void {
    std.debug.print("a func!\n", .{});
    defer std.debug.print("the function exiting...\n",. {});
    const a: u8 = 22;
    std.debug.print("{d} times 2: {d}\n", .{a, a*2});
}
