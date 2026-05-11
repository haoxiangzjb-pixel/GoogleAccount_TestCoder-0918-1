const std = @import("std");

// Error set definindo os possíveis erros
const MathError = error{
    DivisionByZero,
    NegativeSquareRoot,
    Overflow,
};

// Union enum que pode ser um sucesso (valor) ou um erro
const MathResult = union(enum) {
    success: f64,
    error: MathError,

    // Método para verificar se é um erro
    pub fn isError(self: MathResult) bool {
        return switch (self) {
            .error => true,
            .success => false,
        };
    }

    // Método para obter o valor ou retornar erro
    pub fn getValue(self: MathResult) !f64 {
        return switch (self) {
            .success => |v| v,
            .error => |e| e,
        };
    }
};

// Função que divide dois números com tratamento de erro
fn divide(a: f64, b: f64) MathResult {
    if (b == 0) {
        return MathResult{ .error = MathError.DivisionByZero };
    }
    return MathResult{ .success = a / b };
}

// Função que calcula raiz quadrada com tratamento de erro
fn squareRoot(x: f64) MathResult {
    if (x < 0) {
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

    // Exemplo 1: Divisão bem-sucedida
    const div1 = divide(10.0, 2.0);
    stdout.print("Divisão 10/2: ", .{}) catch unreachable;
    switch (div1) {
        .success => |v| stdout.print("{d}\n", .{v}) catch unreachable,
        .error => |e| stdout.print("Erro: {}\n", .{e}) catch unreachable,
    }

    // Exemplo 2: Divisão por zero
    const div2 = divide(10.0, 0.0);
    stdout.print("Divisão 10/0: ", .{}) catch unreachable;
    if (div2.isError()) {
        stdout.print("Erro detectado: {}\n", .{div2.error}) catch unreachable;
    } else {
        stdout.print("{d}\n", .{div2.success}) catch unreachable;
    }

    // Exemplo 3: Raiz quadrada de número negativo
    const sqrt1 = squareRoot(-4.0);
    stdout.print("Raiz de -4: ", .{}) catch unreachable;
    const value1 = sqrt1.getValue() catch |err| {
        stdout.print("Erro capturado com getValue: {}\n", .{err}) catch unreachable;
        return;
    };
    stdout.print("{d}\n", .{value1}) catch unreachable;

    // Exemplo 4: Raiz quadrada válida
    const sqrt2 = squareRoot(16.0);
    stdout.print("Raiz de 16: ", .{}) catch unreachable;
    switch (sqrt2) {
        .success => |v| stdout.print("{d}\n", .{v}) catch unreachable,
        .error => |e| stdout.print("Erro: {}\n", .{e}) catch unreachable,
    }

    // Exemplo 5: Usando catch com valor padrão
    const div3 = divide(5.0, 0.0);
    const result = div3.getValue() catch 0.0;
    stdout.print("Divisão 5/0 com fallback: {d}\n", .{result}) catch unreachable;

    // Exemplo 6: Multiplicação normal
    const mult1 = multiply(3.0, 4.0);
    stdout.print("Multiplicação 3*4: ", .{}) catch unreachable;
    switch (mult1) {
        .success => |v| stdout.print("{d}\n", .{v}) catch unreachable,
        .error => |e| stdout.print("Erro: {}\n", .{e}) catch unreachable,
    }

    stdout.print("\nTratamento de erros com union enums em Zig demonstrado com sucesso!\n", .{}) catch unreachable;
}
