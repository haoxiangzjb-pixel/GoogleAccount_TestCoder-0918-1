defmodule CompileTimeInfo do
  defmacro print_and_save_compile_info do
    # 获取当前时间戳作为随机标识符的一部分
    timestamp = System.system_time(:second)
    random_suffix = :rand.uniform(10000)
    filename = "compile_info_#{timestamp}_#{random_suffix}.ex"
    
    # 收集编译时信息
    compile_info = %{
      module: __CALLER__.module,
      file: __CALLER__.file,
      line: __CALLER__.line,
      function: __CALLER__.function,
      timestamp: timestamp,
      random_suffix: random_suffix
    }
    
    # 打印编译时信息到控制台
    IO.puts("编译时信息:")
    IO.puts("  模块: #{inspect(compile_info.module)}")
    IO.puts("  文件: #{compile_info.file}")
    IO.puts("  行号: #{compile_info.line}")
    IO.puts("  函数: #{inspect(compile_info.function)}")
    IO.puts("  时间戳: #{compile_info.timestamp}")
    IO.puts("  随机后缀: #{compile_info.random_suffix}")
    
    # 将信息保存到随机命名的.ex文件中
    content = """
    # 编译时信息
    # 生成时间: #{DateTime.to_string(DateTime.from_unix!(compile_info.timestamp))}
    
    %{
      module: #{inspect(compile_info.module)},
      file: "#{compile_info.file}",
      line: #{compile_info.line},
      function: #{inspect(compile_info.function)},
      timestamp: #{compile_info.timestamp},
      random_suffix: #{compile_info.random_suffix}
    }
    """
    
    File.write(filename, content)
    IO.puts("编译时信息已保存到: #{filename}")
    
    # 返回一个简单的值，因为宏必须返回有效的Elixir语法
    quote do
      unquote("编译时信息已处理并保存到 #{filename}")
    end
  end
end

# 使用宏的示例
defmodule ExampleModule do
  require CompileTimeInfo
  
  def example_function do
    CompileTimeInfo.print_and_save_compile_info()
  end
end

# 直接在模块级别使用宏
defmodule AnotherExample do
  require CompileTimeInfo
  CompileTimeInfo.print_and_save_compile_info()
  
  def test do
    :ok
  end
end