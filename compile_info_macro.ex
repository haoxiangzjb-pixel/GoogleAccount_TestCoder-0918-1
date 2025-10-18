defmodule CompileInfo do
  defmacro print_and_save_compile_info do
    # Get compile-time information
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    
    # Generate random filename
    random_suffix = :rand.uniform(1000000) |> Integer.to_string()
    filename = "compile_info_#{random_suffix}.ex"
    
    # Compile-time information to save
    compile_info = %{
      module: module,
      file: file,
      line: line,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      node: Node.self()
    }
    
    # Print compile-time information
    IO.puts("Compile-time information:")
    IO.puts("Module: #{inspect(compile_info.module)}")
    IO.puts("File: #{compile_info.file}")
    IO.puts("Line: #{compile_info.line}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Node: #{inspect(compile_info.node)}")
    
    # Save information to randomly named file
    content = 
      """
      # Compile-time information saved at #{compile_info.timestamp}
      %{
        module: #{inspect(compile_info.module)},
        file: #{inspect(compile_info.file)},
        line: #{compile_info.line},
        timestamp: #{inspect(compile_info.timestamp)},
        node: #{inspect(compile_info.node)}
      }
      """
    
    File.write!(filename, content)
    IO.puts("Compile-time information saved to #{filename}")
    
    # Return nil as this macro is for side effects only
    quote do
      nil
    end
  end
end