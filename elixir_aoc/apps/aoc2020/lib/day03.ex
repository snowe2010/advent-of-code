import AdventOfCode

aoc 2020, 3 do
  def part1(input) do
    input
    |> Enum.with_index()
    |> Enum.count(fn {current_row, index} ->
      # IO.inspect("Text: " <> current_row <> " Index: " <> Integer.to_string(index) <> " mult: " <> Integer.to_string(index * 3))
      char_at_point = String.at(String.duplicate(current_row, index), index * 3)
      char_at_point == "#"
    end)
  end

  def part2(input) do
    mps = [
      {1, 1, input},
      {3, 1, input},
      {5, 1, input},
      {7, 1, input},
      {1, 2, input},
    ]

    mps
    |> Enum.map(&find_trees_with_slope/1)
    |> multiply_trees_from_all_slopes()
  end

  defp find_trees_with_slope({run, fall, input}) do
    input
    |> Enum.take_every(fall)
    |> Enum.with_index()
    |> Enum.count(fn {current_row, index} ->
      char_at_point = String.at(String.duplicate(current_row, index), index * run)
      char_at_point == "#"
    end)
  end

  defp multiply_trees_from_all_slopes(input) do
    input
    |> Enum.reduce(&(&1 * &2))
  end

  defp stream(), do: input_stream()
  # |> Stream.map(&String.to_integer/1)
  # |> Enum.sort()
end
