defmodule ListReverser do
  @moduledoc """
  A module containing functions to reverse lists in Elixir.
  """

  @doc """
  Reverses a list.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse(list) do
    Enum.reverse(list)
  end
  
  @doc """
  Manually reverses a list without using Enum.reverse/1.
  
  ## Examples
  
      iex> ListReverser.manual_reverse([1, 2, 3])
      [3, 2, 1]
      
      iex> ListReverser.manual_reverse([])
      []
  """
  def manual_reverse(list) do
    manual_reverse(list, [])
  end
  
  defp manual_reverse([], acc), do: acc
  defp manual_reverse([head | tail], acc) do
    manual_reverse(tail, [head | acc])
  end
end