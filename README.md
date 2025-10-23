# Elixir 宏：编译时信息收集器

此项目包含一个Elixir宏，用于在编译时收集和保存信息。

## 宏功能

`CompileTimeInfo.print_and_save_compile_info/0` 宏会：

1. 收集编译时信息（模块名、文件路径、行号、时间戳）
2. 生成一个随机命名的 `.ex` 文件
3. 将编译时信息保存到该文件中
4. 在编译时打印信息到控制台

## 文件说明

- `macro_example.ex` - 包含宏定义和使用示例的Elixir代码

## 使用方法

要运行此代码，您需要安装Elixir（版本 1.12 或更高）：

```bash
# 如果您已安装Elixir
elixir macro_example.ex
```

或者在IEx（Elixir交互式shell）中：

```elixir
iex> c "macro_example.ex"
```

## 宏的工作原理

宏使用以下编译时特性：

- `__CALLER__` - 获取调用方的上下文信息
- `quote` 和 `unquote` - 用于代码生成
- 运行时文件操作来保存信息

## 生成的文件

每次编译时，宏会生成一个随机名称的 `.ex` 文件，其中包含：

- 模块信息
- 文件路径
- 时间戳
- 其他编译时上下文

## 代码结构

```elixir
defmodule CompileTimeInfo do
  defmacro print_and_save_compile_info do
    # 宏实现
  end
end
```

这个宏展示了Elixir元编程的强大功能，允许在编译期间执行代码并生成新的代码。