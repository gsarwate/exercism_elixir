defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    Enum.join(texts)
    |> clean_input
    |> do_work(workers)
  end

  defp clean_input(texts) do
    Regex.scan(~r/\p{L}/u, texts)
    |> Enum.join()
    |> String.downcase()
    |> String.graphemes()
  end

  defp do_work(input, _) when length(input) == 0, do: %{}

  defp do_work(input, workers) when workers == 1, do: freq(input)

  defp do_work(input, workers) do
    input
    |> Enum.chunk_every(ceil(length(input) / workers))
    |> Task.async_stream(&freq/1)
    |> process_task_results()
  end

  defp freq(characters) do
    characters
    |> Enum.reduce(%{}, fn character, acc -> Map.update(acc, character, 1, &(&1 + 1)) end)
  end

  defp process_task_results(result) do
    Enum.reduce(result, %{}, fn {:ok, r}, acc ->
      Map.merge(acc, r, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end
end
