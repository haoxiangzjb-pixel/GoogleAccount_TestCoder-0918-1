defmodule MacroLogger do
  @moduledoc """
  模块包含一个宏，用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro log_compile_time_info(message) do
    # 获取当前时间戳用于生成唯一文件名
    timestamp = System.system_time(:second)
    random_suffix = :rand.uniform(10000)
    filename = "compile_info_#{timestamp}_#{random_suffix}.ex"

    # 编译时信息
    compile_info = %{
      message: message,
      timestamp: timestamp,
      file: __CALLER__.file,
      line: __CALLER__.line,
      module: __CALLER__.module
    }

    # 打印编译时信息
    IO.puts("编译时信息: #{inspect(compile_info)}")

    # 将信息保存到随机命名的.ex文件中
    file_content = """
    # 编译时生成的信息文件
    # 生成时间: #{DateTime.from_unix!(timestamp)}
    
    %{
      message: #{inspect(message)},
      timestamp: #{timestamp},
      file: #{inspect(__CALLER__.file)},
      line: #{__CALLER__.line},
      module: #{inspect(__CALLER__.module)}
    }
    """

    File.write(filename, file_content)
    IO.puts("编译时信息已保存到文件: #{filename}")

    # 宏返回一个简单的值，不影响使用它的代码
    quote do
      unquote(message)
    end
  end
end