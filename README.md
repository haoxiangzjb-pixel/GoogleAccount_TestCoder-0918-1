# Elixir Macro to Print Compile-Time Information

This project demonstrates an Elixir macro that:

1. Captures compile-time information (module name, file path, line number, timestamp)
2. Prints the information to the console during compilation
3. Saves the information to a randomly named `.ex` file

## How it works

The `print_compile_info` macro uses Elixir's `__CALLER__` macro to capture compile-time context information:

- `__CALLER__.module`: The module in which the macro is called
- `__CALLER__.file`: The file where the macro is called
- `__CALLER__.line`: The line number where the macro is called

The macro then:

1. Generates a random filename using `:crypto.strong_rand_bytes/1` and `Base.encode16/2`
2. Creates an Elixir module with the captured information
3. Saves this module to the randomly named file
4. Prints the captured information to the console

## Files

- `macro_info.ex`: Contains the `MacroInfo` module with the `print_compile_info` macro
- Randomly named `.ex` files: Generated during compilation with compile-time information

## Example Output

When you run the code, you'll see output like:
```
Compile-time information:
Module: ExampleModule
File: /workspace/macro_info.ex
Line: 60
Timestamp: 2025-10-18 13:21:18.023537Z
Generated file: 58ff1191d678d68e1e9a.ex
Compile-time information saved to 58ff1191d678d68e1e9a.ex
```

The randomly named file will contain an Elixir module with the compile-time information that can be used in other Elixir programs.