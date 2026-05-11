// Exemplo de tratamento de erros em Zig usando union enums

const std = @import("std");

// Union enum que representa diferentes tipos de erros
const MathError = error{
    DivisionByZero,
    NegativeSquareRoot,
    Overflow,
};

// Union enum que pode conter um valor de sucesso ou um erro
const MathResult = union(enum) {
    success: f64,
    error: MathError,

    pub fn isError(self: MathResult) bool {
        return switch (self) {
            .error => true,
            .success => false,
        };
    }

    pub fn getValue(self: MathResult) !f64 {
        return switch (self) {
            .success => |v| v,
            .error => |e| switch (e) {
                .DivisionByZero => MathError.DivisionByZero,
                .NegativeSquareRoot => MathError.NegativeSquareRoot,
                .Overflow => MathError.Overflow,
            },
        };
    }
};

// Função que divide dois números com tratamento de erro
fn divide(a: f64, b: f64) MathResult {
    if (b == 0.0) {
        return MathResult{ .error = MathError.DivisionByZero };
    }
    return MathResult{ .success = a / b };
}

// Função que calcula raiz quadrada com tratamento de erro
fn squareRoot(x: f64) MathResult {
    if (x < 0.0) {
        return MathResult{ .error = MathError.NegativeSquareRoot };
    }
    return MathResult{ .success = @sqrt(x) };
}

// Função que multiplica com verificação de overflow
fn multiply(a: f64, b: f64) MathResult {
    const result = a * b;
    if (@isInf(result) or @isNaN(result)) {
        return MathResult{ .error = MathError.Overflow };
    }
    return MathResult{ .success = result };
}

pub fn main() void {
    const stdout = std.io.getStdOut().writer();

    // Testando divisão
    stdout.print("=== Testando Divisão ===\n", .{}) catch unreachable;
    
    var div_result = divide(10.0, 2.0);
    if (div_result.isError()) {
        stdout.print("Erro na divisão: {}\n", .{div_result.error}) catch unreachable;
    } else {
        stdout.print("10.0 / 2.0 = {}\n", .{div_result.success}) catch unreachable;
    }

    div_result = divide(10.0, 0.0);
    if (div_result.isError()) {
        stdout.print("Erro na divisão: {}\n", .{div_result.error}) catch unreachable;
    } else {
        stdout.print("10.0 / 0.0 = {}\n", .{div_result.success}) catch unreachable;
    }

    // Testando raiz quadrada
    stdout.print("\n=== Testando Raiz Quadrada ===\n", .{}) catch unreachable;
    
    var sqrt_result = squareRoot(16.0);
    if (sqrt_result.isError()) {
        stdout.print("Erro na raiz quadrada: {}\n", .{sqrt_result.error}) catch unreachable;
    } else {
        stdout.print("sqrt(16.0) = {}\n", .{sqrt_result.success}) catch unreachable;
    }

    sqrt_result = squareRoot(-4.0);
    if (sqrt_result.isError()) {
        stdout.print("Erro na raiz quadrada: {}\n", .{sqrt_result.error}) catch unreachable;
    } else {
        stdout.print("sqrt(-4.0) = {}\n", .{sqrt_result.success}) catch unreachable;
    }

    // Testando multiplicação
    stdout.print("\n=== Testando Multiplicação ===\n", .{}) catch unreachable;
    
    var mul_result = multiply(1000000.0, 0.0001);
    if (mul_result.isError()) {
        stdout.print("Erro na multiplicação: {}\n", .{mul_result.error}) catch unreachable;
    } else {
        stdout.print("1000000.0 * 0.0001 = {}\n", .{mul_result.success}) catch unreachable;
    }

    // Usando try com o getValue
    stdout.print("\n=== Usando try com getValue ===\n", .{}) catch unreachable;
    
    const test_value = divide(20.0, 4.0).getValue() catch |err| {
        stdout.print("Capturado erro com try: {}\n", .{err}) catch unreachable;
        return;
    };
    stdout.print("Resultado com try: {}\n", .{test_value}) catch unreachable;

    stdout.print("\n=== Demonstração completa de tratamento de erros ===\n", .{}) catch unreachable;
}
