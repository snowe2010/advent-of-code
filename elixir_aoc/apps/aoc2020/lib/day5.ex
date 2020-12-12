import AdventOfCode

aoc 2020, 5 do
  def part1(input) do
    input
    |> Enum.map(&split_into_row_column/1)
    |> Enum.map(&replace_with_binary_representation/1)
    |> Enum.map(&parse_as_binary/1)
    |> Enum.map(&calculate_seat_id/1)
    |> Enum.max
  end

  defp split_into_row_column(seat_identifier), do: String.split_at(seat_identifier, 7)

  defp replace_with_binary_representation({row, col}) do
    new_row = String.replace(row, "F", "0")
              |> String.replace("B", "1")
    new_col = String.replace(col, "L", "0")
              |> String.replace("R", "1")
    {new_row, new_col}
  end

  defp parse_as_binary({row, col}) do
    {elem(Integer.parse(row, 2),0), elem(Integer.parse(col, 2),0)}
  end

  defp calculate_seat_id({row, column}), do: row * 8 + column

  def part2(input) do
#    input
#    |> Enum.map(&calculate_seat_coords/1)
#    |> IO.inspect(charlists: :as_lists)
#    |> Enum.sort
#    |> IO.inspect(charlists: :as_lists)
  end
end
