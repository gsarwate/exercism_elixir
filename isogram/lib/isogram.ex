defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    {_, is_isogram?} =
      sentence
      |> String.replace(~r/[\s-]+/, "")
      |> String.to_charlist()
      |> Enum.reduce_while({%{}, false}, fn c, {acc, _is_isogram} ->
        if Map.has_key?(acc, c) do
          {:halt, {acc, false}}
        else
          {:cont, {Map.update(acc, c, 1, &(&1 + 1)), true}}
        end
      end)

    is_isogram?
  end
end
