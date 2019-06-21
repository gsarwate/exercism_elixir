defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
          :monday
          | :tuesday
          | :wednesday
          | :thursday
          | :friday
          | :saturday
          | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekday_map %{
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  @day_range_map %{
    first: 1..7,
    second: 8..14,
    third: 15..21,
    fourth: 22..28,
    teenth: 13..19
  }

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date()
  def meetup(year, month, weekday, schedule) do
    find_day_range(year, month, schedule)
    |> find_date(year, month, weekday)
  end

  defp find_day_range(year, month, schedule) do
    case schedule do
      :last ->
        last_day_of_the_month = :calendar.last_day_of_the_month(year, month)
        (last_day_of_the_month - 6)..last_day_of_the_month

      _ ->
        @day_range_map[schedule]
    end
  end

  defp find_date(range, year, month, weekday) do
    range
    |> Enum.reduce(%{}, fn day, acc ->
      Map.put(acc, :calendar.day_of_the_week(year, month, day), {year, month, day})
    end)
    |> Map.fetch!(@weekday_map[weekday])
  end
end
