defmodule ListReverser do
  @doc """
  Reverses a list using recursion.
  """
  def reverse_list([]), do: []

  def reverse_list([head | tail]) do
    reverse_list(tail) ++ [head]
  end

  # Alternative implementation using an accumulator for better performance
  def reverse_list_optimized(list), do: reverse_list_optimized(list, [])

  defp reverse_list_optimized([], acc), do: acc

  defp reverse_list_optimized([head | tail], acc) do
    reverse_list_optimized(tail, [head | acc])
  end
end