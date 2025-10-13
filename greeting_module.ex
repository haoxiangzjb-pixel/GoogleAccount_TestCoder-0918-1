defmodule GreetingModule do
  @doc "Приветствует указанного человека."
  def greet(name) do
    "Привет, #{name}!"
  end
end