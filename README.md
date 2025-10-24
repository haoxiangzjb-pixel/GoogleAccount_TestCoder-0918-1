# Elixir 宏 - 编译时信息打印和保存

## 项目概述

本项目包含一个自定义的Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 文件说明

- `macro_example.ex` - 包含定义的宏和使用示例
- `README.md` - 本说明文档

## 宏功能说明

`CompileTimeInfo` 模块定义了一个名为 `print_and_save_compile_info/1` 的宏，具有以下功能：

1. 在编译时获取当前上下文信息（文件、行号、模块、函数等）
2. 打印编译时信息到控制台
3. 将编译时信息保存到随机命名的.ex文件中
4. 文件名包含时间戳和随机数以确保唯一性

## 使用方法

要运行此代码，您需要先安装Elixir环境：

```bash
# 使用ASDF安装Elixir (推荐)
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install erlang 26.0.2
asdf install elixir 1.15.4
```

或者通过其他方式安装Elixir（如包管理器、预编译包等）。

## 运行代码

安装Elixir后，使用以下命令运行代码：

```bash
elixir macro_example.ex
```

这将触发宏的编译过程，并生成包含编译时信息的随机命名文件。

## 代码结构

```elixir
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
```

## 输出示例

当宏运行时，将在控制台输出类似以下内容：

```
编译时信息:
文件: "/workspace/macro_example.ex"
行号: 45
模块: TestModule
函数: {:test_function, 0}
时间戳: ~U[2023-08-24 12:34:56.789123Z]
自定义消息: "这是一个测试消息"
编译时信息已保存到文件: compile_info_1692876896_123456.ex
```

同时，将在工作目录中创建一个类似 `compile_info_1692876896_123456.ex` 的文件，包含完整的编译时信息。

## 注意事项

1. 宏在编译时执行，因此信息是在编译阶段收集的
2. 生成的文件使用时间戳和随机数确保名称唯一
3. 该宏可以用于调试和分析Elixir代码的编译过程