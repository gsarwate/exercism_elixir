defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.reduce(MapSet.new(), &do_sum(&1, &1, &2, limit))
    |> Enum.sum()
  end

  def do_sum(_factor, multiple, multiple_set, limit) when multiple >= limit, do: multiple_set

  def do_sum(factor, multiple, multiple_set, limit) do
    multiple_set = MapSet.put(multiple_set, multiple)
    multiple = multiple + factor
    do_sum(factor, multiple, multiple_set, limit)
  end
end
