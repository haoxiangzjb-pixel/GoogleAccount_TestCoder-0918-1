defmodule TestModule do
  require CompilerInfoMacro

  # 使用第一个宏
  CompilerInfoMacro.print_and_save_compile_info("这是测试编译信息")

  # 使用第二个宏（更详细的版本）
  CompilerInfoMacro.print_and_save_detailed_compile_info("测试模块编译")

  def test_function do
    # 在函数内部使用宏
    result = CompilerInfoMacro.print_and_save_compile_info("函数内部的编译信息")
    IO.puts("函数内部宏返回值: #{inspect(result)}")
    :ok
  end

  def another_test_function do
    # 在另一个函数中使用详细版本
    result = CompilerInfoMacro.print_and_save_detailed_compile_info("另一个函数编译")
    IO.puts("另一个函数宏返回值: #{inspect(result)}")
    :another_result
  end
end

# 编译后运行测试
TestModule.test_function()
TestModule.another_test_function()

IO.puts("测试完成，检查生成的随机命名文件。")