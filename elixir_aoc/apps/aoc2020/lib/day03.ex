import AdventOfCode

aoc 2020, 3 do
  def part1(input) do
    input
    |> Enum.with_index()
    |> Enum.count(fn {current_row, index} ->
      # IO.inspect("Text: " <> current_row <> " Index: " <> Integer.to_string(index) <> " mult: " <> Integer.to_string(index * 3))
      char_at_point = String.at(String.duplicate(current_row, index), index*3)
      char_at_point == "#"
    end)
  end

  def part2(input) do
  end

  defp current_x do

  end

  defp stream(), do: input_stream()
    # |> Stream.map(&String.to_integer/1)
    # |> Enum.sort()

end
