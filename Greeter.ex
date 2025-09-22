defmodule Greeter do
  @moduledoc """
  A simple greeter module with a greeting function.
  """

  @doc """
  Returns a greeting for the given name.
  
  ## Examples
  
      iex> Greeter.greet("World")
      "Hello, World!"
      
      iex> Greeter.greet("Alice")
      "Hello, Alice!"
  """
  def greet(name) do
    "Hello, #{name}!"
  end
end