defmodule Greeter do
  @doc """
  Возвращает приветствие для заданного имени.
  """
  def hello(name) do
    "Hello, #{name}!"
  end
end

# Пример использования
IO.puts(Greeter.hello("World"))