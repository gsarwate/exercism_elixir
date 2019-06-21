defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @base 97..122 |> Enum.reduce(%{}, fn n, acc -> Map.put(acc, n, 1) end)

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase()
    |> to_charlist()
    |> do_check(@base)
  end

  def do_check([], remaining), do: map_size(remaining) == 0
  def do_check([h | t], remaining), do: do_check(t, Map.delete(remaining, h))
end
