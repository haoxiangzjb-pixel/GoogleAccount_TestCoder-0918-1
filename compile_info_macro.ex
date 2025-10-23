defmodule CompileInfoMacro do
  @moduledoc """
  A module that defines a macro to print compile-time information
  and save it to a randomly named .ex file.
  """

  defmacro print_and_save_compile_info do
    # Get compile-time information
    file = __CALLER__.file
    line = __CALLER__.line
    module = __CALLER__.module
    function = __CALLER__.function
    
    # Generate a random filename
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16() |> String.downcase()
    filename = "#{random_name}.ex"
    
    # Compile-time information to save
    compile_info = %{
      file: file,
      line: line,
      module: module,
      function: function,
      timestamp: DateTime.utc_now(),
      node: Node.self()
    }
    
    # Print compile-time information
    IO.puts("Compile-time information:")
    IO.puts("File: #{inspect(file)}")
    IO.puts("Line: #{inspect(line)}")
    IO.puts("Module: #{inspect(module)}")
    IO.puts("Function: #{inspect(function)}")
    IO.puts("Timestamp: #{inspect(compile_info.timestamp)}")
    IO.puts("Node: #{inspect(compile_info.node)}")
    
    # Convert the compile info to a string representation
    content = 
      "Compile-time information:\n" <>
      "File: #{inspect(file)}\n" <>
      "Line: #{inspect(line)}\n" <>
      "Module: #{inspect(module)}\n" <>
      "Function: #{inspect(function)}\n" <>
      "Timestamp: #{inspect(compile_info.timestamp)}\n" <>
      "Node: #{inspect(compile_info.node)}\n"
    
    # Write to the randomly named file
    File.write!(filename, content)
    IO.puts("Compile-time information saved to: #{filename}")
    
    # Return nil as the macro's runtime result
    quote do
      nil
    end
  end
end