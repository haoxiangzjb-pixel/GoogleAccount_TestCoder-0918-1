defmodule CompileTimeInfo do
  defmacro print_and_save_compile_info do
    # 获取编译时信息
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    
    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16(case: :lower)
    filename = "#{random_name}.ex"
    
    # 收集编译时信息
    compile_info = %{
      module: module,
      file: file,
      line: line,
      timestamp: DateTime.utc_now(),
      random_filename: filename
    }
    
    # 打印信息到控制台
    IO.puts("=== 编译时信息 ===")
    IO.puts("模块: #{inspect(compile_info.module)}")
    IO.puts("文件: #{compile_info.file}")
    IO.puts("行号: #{compile_info.line}")
    IO.puts("时间戳: #{compile_info.timestamp}")
    IO.puts("随机文件名: #{compile_info.random_filename}")
    IO.puts("==================")
    
    # 将信息保存到随机命名的.ex文件中
    content = """
    # 编译时信息 - 生成于 #{compile_info.timestamp}
    # 模块: #{inspect(compile_info.module)}
    # 文件: #{compile_info.file}
    # 行号: #{compile_info.line}

    defmodule CompileInfo_#{random_name} do
      def get_info do
        %{
          module: #{inspect(compile_info.module)},
          file: #{inspect(compile_info.file)},
          line: #{compile_info.line},
          timestamp: #{inspect(compile_info.timestamp)},
          random_filename: "#{compile_info.random_filename}"
        }
      end
    end
    """
    
    File.write!(filename, content)
    IO.puts("编译时信息已保存到文件: #{filename}")
    
    # 返回一个简单的值，因为宏需要返回有效的Elixir代码
    quote do
      unquote("Compiled at #{DateTime.utc_now()} to #{filename}")
    end
  end
end

# 使用宏的示例
defmodule TestModule do
  require CompileTimeInfo
  
  # 调用宏
  result = CompileTimeInfo.print_and_save_compile_info()
  
  def get_result, do: unquote(result)
end