import AdventOfCode

aoc 2020, 5 do
  def part1(input) do
    
    input
    |> Enum.map(fn x -> binary_partition_fb(x, 0..127) end)
    |> Enum.map(&calculate_seat_id/1)
    |> Enum.max
  end
  
  defp binary_partition_fb(current_seat_identifier, range) do
    {current_partition_code, rest} = String.next_grapheme(current_seat_identifier)
    
    range_tuple = calculate_ranges(range)

    case current_partition_code do
      "F" -> binary_partition_fb(rest, calculate_lower_range(range_tuple))
      "B" -> binary_partition_fb(rest, calculate_upper_range(range_tuple))
      _ -> binary_partition_lr(current_seat_identifier, 0..7, Enum.at(range, 0))
    end
    
  end
  
  defp binary_partition_lr(current_seat_identifier, range, row_number) do
    range_tuple = calculate_ranges(range)
    
    case String.next_grapheme(current_seat_identifier) do
      {current_partition_code, rest} -> case current_partition_code do
        "L" -> binary_partition_lr(rest, calculate_lower_range(range_tuple), row_number)
        "R" -> binary_partition_lr(rest, calculate_upper_range(range_tuple), row_number)
        _ -> {row_number, Enum.at(range, 0)}
      end 
      _ -> {row_number, Enum.at(range, 0)}
    end
  end
  
  defp calculate_ranges(range) do
    max = Enum.max(range)
    min = Enum.min(range)
    half = (max-min)/2
    {max, min, half}
  end
  
  defp calculate_lower_range({max, min, half}), do: min..floor(max-half)
  
  defp calculate_upper_range({max, min, half}), do: ceil(min+half)..max

  defp calculate_seat_id({row, column}), do: row * 8 + column

  def part2(input) do
  end
end
