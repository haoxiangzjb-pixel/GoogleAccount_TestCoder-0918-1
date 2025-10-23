# Elixir 编译时信息宏

这个项目定义了一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 宏定义

在 `compiler_info_macro.ex` 文件中定义了两个宏：

1. `print_and_save_compile_info(info)` - 保存基本编译信息
2. `print_and_save_detailed_compile_info(description \\ "")` - 保存详细的编译上下文信息

## 使用方法

```elixir
defmodule ExampleModule do
  require CompilerInfoMacro

  # 使用基本版本
  CompilerInfoMacro.print_and_save_compile_info("这是示例编译信息")

  # 使用详细版本
  CompilerInfoMacro.print_and_save_detailed_compile_info("示例模块编译")

  def example_function do
    # 在函数内部使用宏
    CompilerInfoMacro.print_and_save_compile_info("函数内部的编译信息")
    :ok
  end
end
```

## 功能特点

- 在编译时执行，输出信息到控制台
- 生成随机命名的.ex文件保存编译信息
- 文件名包含时间戳和随机数，确保唯一性
- 保存包括模块、文件、行号、函数等上下文信息
- 保存编译环境信息（Elixir版本、操作系统等）

## 生成的文件示例

运行后会生成类似以下命名的文件：
- `compile_info_1761222805_911231.ex`
- `detailed_compile_info_1761222805_190727.ex`

这些文件包含编译时的详细信息，可用于调试或记录编译过程。