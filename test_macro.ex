# Import the CompileInfo module to use the macro
defmodule TestCompileInfo do
  require CompileInfo

  # Use the macro to print and save compile-time information
  CompileInfo.print_and_save_compile_info()

  def test_function do
    "This is a test function"
  end
end