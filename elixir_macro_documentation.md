# Elixir宏：打印编译时信息并保存到随机命名的.ex文件

## 宏的定义

以下是在 `/workspace/macro_example.ex` 文件中定义的宏：

```elixir
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
```

## 宏的工作原理

1. **时间戳和随机后缀**：宏使用 `System.system_time(:second)` 获取当前时间戳，并使用 `:rand.uniform(10000)` 生成一个随机数，以确保文件名的唯一性。

2. **收集编译时信息**：
   - `__CALLER__.module`: 调用宏的模块名
   - `__CALLER__.file`: 调用宏的文件路径
   - `__CALLER__.line`: 调用宏的行号
   - `__CALLER__.function`: 调用宏的函数名

3. **输出信息**：宏将收集到的信息打印到控制台，并保存到一个随机命名的.ex文件中。

4. **返回值**：宏返回一个字符串，因为Elixir宏必须返回有效的AST（抽象语法树）。

## 使用方法

1. 首先需要编译定义了宏的模块：
   ```bash
   elixir macro_example.ex
   ```

2. 宏将在编译时执行，并生成包含编译时信息的随机命名文件。

## 预期输出

当编译使用了宏的代码时，控制台将显示类似以下信息：
```
编译时信息:
  模块: ExampleModule
  文件: macro_example.ex
  行号: 23
  函数: {:example_function, 0}
  时间戳: 1697354892
  随机后缀: 8765
编译时信息已保存到: compile_info_1697354892_8765.ex
```

同时，将在当前目录下创建一个随机命名的.ex文件，内容类似于：
```elixir
# 编译时信息
# 生成时间: 2023-10-14T10:34:52Z

%{
  module: ExampleModule,
  file: "macro_example.ex",
  line: 23,
  function: {:example_function, 0},
  timestamp: 1697354892,
  random_suffix: 8765
}
```

## 注意事项

1. 宏在编译时执行，因此信息是在代码编译期间收集的，而不是在运行时。
2. 每次编译时都会生成一个新的随机命名文件。
3. 文件名确保唯一性，避免覆盖之前生成的文件。
4. 生成的.ex文件是有效的Elixir代码，可以被其他模块引用。