# Import the macro module
Code.require_file("compile_info_macro.ex")

defmodule TestModule do
  import CompileInfoMacro
  
  def test_function do
    print_and_save_compile_info
    IO.puts("This is the test function executing")
  end
end

# Call the function to trigger the macro
TestModule.test_function