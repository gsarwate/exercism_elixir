defmodule ResistorColor do
  @moduledoc false

  @mnemonics [
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  ]

  @spec colors() :: list(String.t())
  def colors do
    Keyword.keys(@mnemonics)
    |> Enum.map(&Atom.to_string(&1))
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Keyword.get(@mnemonics, String.to_atom(color))
  end
end
