/// Devuelve el máximo de dos números enteros.
pub fn max(a: i32, b: i32) i32 {
    return if (a > b) a else b;
}

// Ejemplo de uso (descomentar para probar):
// const std = @import("std");
// pub fn main() void {
//     std.debug.print("Max of 5 and 10 is {}\n", .{max(5, 10)});
// }
