defmodule GreetingModule do
  @doc """
  Возвращает приветствие для заданного имени.
  """
  def greet(name) do
    "Hello, #{name}!"
  end
end