defmodule CompilerInfoMacro do
  @moduledoc """
  定义一个宏用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(info) do
    # 获取当前时间戳作为文件名的一部分
    timestamp = System.system_time(:second)
    # 生成随机数以确保文件名唯一
    random_suffix = :rand.uniform(1000000)
    filename = "compile_info_#{timestamp}_#{random_suffix}.ex"

    # 编译时输出信息
    IO.puts("编译时信息: #{inspect(info)}")
    IO.puts("信息已保存到文件: #{filename}")

    # 准备要写入文件的内容
    file_content = """
    # 编译时生成的信息文件
    # 生成时间: #{DateTime.to_string(DateTime.utc_now())}
    
    # 编译信息:
    #{inspect(info)}
    
    # 当前模块: #{inspect(__CALLER__.module)}
    # 文件: #{inspect(__CALLER__.file)}
    # 行号: #{inspect(__CALLER__.line)}
    """

    # 将信息写入随机命名的文件
    File.write(filename, file_content)

    # 返回要插入到代码中的表达式
    quote do
      unquote(info)
    end
  end

  # 另一个版本，包含更多编译时上下文信息
  defmacro print_and_save_detailed_compile_info(description \\ "") do
    timestamp = System.system_time(:second)
    random_suffix = :rand.uniform(1000000)
    filename = "detailed_compile_info_#{timestamp}_#{random_suffix}.ex"

    # 获取编译时上下文信息
    context_info = %{
      module: __CALLER__.module,
      file: __CALLER__.file,
      line: __CALLER__.line,
      function: __CALLER__.function,
      compilation_time: DateTime.utc_now()
    }

    # 编译时输出信息
    IO.puts("编译时详细信息 [#{description}]")
    IO.puts("模块: #{inspect(context_info.module)}")
    IO.puts("文件: #{inspect(context_info.file)}")
    IO.puts("行号: #{inspect(context_info.line)}")
    IO.puts("函数: #{inspect(context_info.function)}")
    IO.puts("编译时间: #{context_info.compilation_time}")
    IO.puts("信息已保存到文件: #{filename}")

    # 准备文件内容
    file_content = """
    # 详细编译时信息文件
    # 描述: #{description}
    # 生成时间: #{DateTime.to_string(DateTime.utc_now())}
    
    ## 编译上下文信息
    - 模块: #{inspect(context_info.module)}
    - 文件: #{inspect(context_info.file)}
    - 行号: #{inspect(context_info.line)}
    - 函数: #{inspect(context_info.function)}
    
    ## 编译环境信息
    - Elixir版本: #{System.version()}
    - OTP版本: #{System.otp_release()}
    - 操作系统: #{inspect(:os.type())}
    - 节点名称: #{inspect(Node.self())}
    
    ## 当前时间
    - UTC时间: #{DateTime.to_string(DateTime.utc_now())}
    - 本地时间: #{DateTime.to_string(DateTime.now!("Etc/UTC"))}
    """

    # 写入文件
    File.write(filename, file_content)

    # 返回一个简单的值，表示宏已执行
    quote do
      {:compile_info_saved, unquote(filename)}
    end
  end
end