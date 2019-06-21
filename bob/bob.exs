defmodule Bob do
  def hey(input) do
    cond do
      # Address Bob without saying anything
      String.trim(input) == "" ->
        "Fine. Be that way!"

      # Yell a question at Bob
      is_question?(input) && is_yelling?(input) &&
          !is_only_numbers?(String.slice(input, 0, String.length(input) - 1)) ->
        "Calm down, I know what I'm doing!"

      # Ask Bob a question
      is_question?(input) ->
        "Sure."

      # Yell at Bob
      is_yelling?(input) && !is_only_numbers?(input) ->
        "Whoa, chill out!"

      # Say anything else to Bob
      true ->
        "Whatever."
    end
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_yelling?(input) do
    input =~ ~r(^[^a-z]*$)
  end

  defp is_only_numbers?(input) do
    input =~ ~r(^[0-9 ,]*$)
  end
end
