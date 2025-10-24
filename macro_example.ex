defmodule CompileTimeInfo do
  @moduledoc """
  模块定义了一个宏，用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(message) do
    # 获取当前时间戳作为唯一标识
    timestamp = System.system_time(:second)
    # 生成随机数以确保文件名唯一
    random_suffix = :rand.uniform(1000000)
    filename = "compile_info_#{timestamp}_#{random_suffix}.ex"

    # 获取编译时信息
    compile_info = %{
      file: __CALLER__.file,
      line: __CALLER__.line,
      module: __CALLER__.module,
      function: __CALLER__.function,
      message: message,
      timestamp: DateTime.utc_now()
    }

    # 将信息转换为字符串格式
    info_string = """
    # 编译时信息
    # 文件: #{inspect(compile_info.file)}
    # 行号: #{compile_info.line}
    # 模块: #{inspect(compile_info.module)}
    # 函数: #{inspect(compile_info.function)}
    # 时间戳: #{inspect(compile_info.timestamp)}
    # 自定义消息: #{inspect(compile_info.message)}

    #{inspect(compile_info)}
    """

    # 在编译时打印信息
    IO.puts("编译时信息:")
    IO.puts("文件: #{inspect(compile_info.file)}")
    IO.puts("行号: #{compile_info.line}")
    IO.puts("模块: #{inspect(compile_info.module)}")
    IO.puts("函数: #{inspect(compile_info.function)}")
    IO.puts("时间戳: #{inspect(compile_info.timestamp)}")
    IO.puts("自定义消息: #{inspect(compile_info.message)}")

    # 将信息保存到随机命名的文件中
    File.write(filename, info_string)
    IO.puts("编译时信息已保存到文件: #{filename}")

    # 返回一个简单的值，这样宏可以被使用
    quote do
      unquote(message)
    end
  end
end

# 使用示例
defmodule TestModule do
  import CompileTimeInfo

  def test_function do
    print_and_save_compile_info("这是一个测试消息")
    :ok
  end
end