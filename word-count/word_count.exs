defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/\p{Z}|\p{Pc}|\p{Po}|\p{S}/u, trim: true)
    |> Enum.reduce(%{}, fn el, acc ->
      el = Regex.scan(~r/\p{L}|\p{N}|\p{Pd}/u, el) |> Enum.join()
      Map.update(acc, el, 1, &(&1 + 1))
    end)
  end
end
