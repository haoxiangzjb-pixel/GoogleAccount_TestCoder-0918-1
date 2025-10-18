defmodule GreetingModule do
  @doc "Greets a person by name"
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc "Simple greeting without a name"
  def greet do
    "Hello! Welcome to Elixir!"
  end
end