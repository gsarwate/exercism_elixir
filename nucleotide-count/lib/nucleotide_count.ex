defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @histogram Enum.reduce(@nucleotides, %{}, &Map.update(&2, &1, 0, fn v -> v + 1 end))

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand
    |> Enum.reduce(_count = 0, &count_matching_nucleotides(nucleotide, &1, &2))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand
    |> Enum.reduce(@histogram, &Map.update(&2, &1, 0, fn v -> v + 1 end))
  end

  defp count_matching_nucleotides(nucleotide, char, count) when char == nucleotide, do: count + 1
  defp count_matching_nucleotides(_nucleotide, _char, count), do: count
end
