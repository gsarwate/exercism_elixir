defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    do_work(s, size, String.length(s), 0, [])
  end

  defp do_work(_s, size, _s_length, _begin, _result) when size < 1, do: []

  defp do_work(s, size, s_length, begin, result) when begin <= s_length - size do
    r = String.slice(s, begin, size)
    result = [r | result]
    do_work(s, size, s_length, begin + 1, result)
  end

  defp do_work(_s, _size, _s_length, _begin, result), do: Enum.reverse(result)
end
