defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], reversed), do: reversed
  defp do_reverse([head | tail], reversed), do: do_reverse(tail, [head | reversed])
end