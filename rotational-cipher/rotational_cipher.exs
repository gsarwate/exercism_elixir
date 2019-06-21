defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(&rotate_char(&1, shift))
    |> to_string()
  end

  defp rotate_char(char, shift) when char in ?A..?Z, do: adjust(char, shift, ?A)
  defp rotate_char(char, shift) when char in ?a..?z, do: adjust(char, shift, ?a)
  defp rotate_char(char, _shift), do: char

  defp adjust(char, shift, offset), do: rem(char - offset + shift, 26) + offset
end
