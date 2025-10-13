defmodule ListReverser do
  @doc """
  Reverses a list using recursion and an accumulator.
  """
  def reverse_list(list) do
    reverse_list(list, [])
  end

  defp reverse_list([], acc), do: acc
  defp reverse_list([head | tail], acc) do
    reverse_list(tail, [head | acc])
  end
end

# Example usage:
# IO.inspect ListReverser.reverse_list([1, 2, 3, 4, 5]) # Output: [5, 4, 3, 2, 1]