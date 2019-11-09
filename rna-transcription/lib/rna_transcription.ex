defmodule RnaTranscription do
  @doc """
  Transcribes a character dna representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @transcription %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn c -> @transcription[c] end)
  end
end
