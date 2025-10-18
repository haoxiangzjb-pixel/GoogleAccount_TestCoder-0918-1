defmodule MacroInfo do
  @moduledoc """
  Module containing a macro that prints compile-time information
  and saves it to a randomly named .ex file.
  """

  defmacro print_compile_info do
    # Get compile-time information
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    
    # Generate random filename
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16(case: :lower)
    filename = "#{random_name}.ex"
    
    # Compile-time info to save
    compile_info = %{
      module: module,
      file: file,
      line: line,
      timestamp: DateTime.utc_now() |> DateTime.to_string()
    }
    
    # Convert info to Elixir code string
    content = """
    # Compile-time information saved at #{compile_info.timestamp}
    # Generated from #{compile_info.file}:#{compile_info.line}
    
    defmodule #{inspect(compile_info.module)}_CompileInfo do
      def get_info do
        #{inspect(compile_info)}
      end
    end
    """
    
    # Print compile-time information
    IO.puts("Compile-time information:")
    IO.puts("Module: #{inspect(compile_info.module)}")
    IO.puts("File: #{compile_info.file}")
    IO.puts("Line: #{compile_info.line}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Generated file: #{filename}")
    
    # Write the information to the randomly named file
    File.write!(filename, content)
    IO.puts("Compile-time information saved to #{filename}")
    
    # Return nil as the macro's runtime value
    quote do
      nil
    end
  end
end

# Example usage
defmodule ExampleModule do
  require MacroInfo
  
  MacroInfo.print_compile_info()
  
  def example_function do
    :ok
  end
end