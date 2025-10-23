# Elixir Compile-Time Information Macro

This project demonstrates an Elixir macro that captures and prints compile-time information, then saves it to a randomly named `.ex` file.

## Files

- `compile_info_macro.ex`: Contains the `CompileInfoMacro` module with the `print_and_save_compile_info/0` macro
- `test_macro.exs`: A test file that demonstrates the macro usage
- `c10f26352d53183629ce.ex` (or similar): A randomly named file containing the captured compile-time information

## How it works

The macro `print_and_save_compile_info` does the following:

1. Captures compile-time information using `__CALLER__`:
   - File name where the macro is called
   - Line number where the macro is called
   - Module where the macro is called
   - Function where the macro is called
   - Current timestamp
   - Node name

2. Prints the compile-time information to the console

3. Generates a random filename using `:crypto.strong_rand_bytes/1` and saves the information to that file

4. Returns `nil` at runtime (the actual work happens at compile time)

## Example Output

When the macro is used in a module and the code is executed, it prints information like:

```
Compile-time information:
File: "/workspace/test_macro.exs"
Line: 8
Module: TestModule
Function: {:test_function, 0}
Timestamp: ~U[2025-10-23 12:43:24.769778Z]
Node: :nonode@nohost
Compile-time information saved to: c10f26352d53183629ce.ex
```

And creates a file with the same information.