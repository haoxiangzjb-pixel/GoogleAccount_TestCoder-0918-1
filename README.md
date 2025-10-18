# Elixir Compile-Time Information Macro

This project demonstrates an Elixir macro that captures and saves compile-time information to a randomly named file.

## How it Works

The `CompileInfo.print_and_save_compile_info/0` macro:

1. Captures compile-time information including:
   - Module name
   - File path and line number where the macro is used
   - Timestamp of compilation
   - Node information
   - Elixir version
   - OTP version

2. Generates a random filename in the format `compile_info_{random_number}.ex`

3. Saves the information to the randomly named file in a readable format

4. Prints the information to the console at compile time

## Files

- `compile_info_macro.ex`: Contains the macro definition and example usage
- `compile_info_{random_number}.ex`: Generated file containing the compile-time information (filename will vary)

## Example Output

When you compile the module, you'll see output similar to:
```
Compile-time info for module ExampleModule:
File: /workspace/compile_info_macro.ex:63
Generated at: 2025-10-18 13:10:4
Info saved to: compile_info_350173.ex
```

And a file named something like `compile_info_350173.ex` will be created with the detailed information.