defmodule ExampleModule do
  require CompilerInfoMacro

  # 使用第一个宏
  CompilerInfoMacro.print_and_save_compile_info("这是示例编译信息")

  # 使用第二个宏（更详细的版本）
  CompilerInfoMacro.print_and_save_detailed_compile_info("示例模块编译")

  def example_function do
    # 在函数内部使用宏
    CompilerInfoMacro.print_and_save_compile_info("函数内部的编译信息")
    :ok
  end

  def another_function do
    # 在另一个函数中使用详细版本
    CompilerInfoMacro.print_and_save_detailed_compile_info("另一个函数编译")
    :another_result
  end
end

# 在模块外部使用宏
CompilerInfoMacro.print_and_save_compile_info("模块外部信息")