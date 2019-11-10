defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_length = String.length(base)
    downcase_base = String.downcase(base)
    sorted_base = sorted_string(base)

    candidates
    |> Enum.filter(&(String.length(&1) == base_length))
    |> Enum.reject(&(String.downcase(&1) == downcase_base))
    |> Enum.filter(&(sorted_string(&1) == sorted_base))
  end

  defp sorted_string(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
