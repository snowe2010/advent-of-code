import AdventOfCode

aoc 2020, 6 do
  def part1(input) do
    input
    |> map_to_groups
    |> Enum.map(&Enum.join/1)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    |> Enum.map(&Enum.sort/1) # only dedups consecutive elems
    |> Enum.map(&Enum.dedup/1)
    |> Enum.map(&Enum.count/1)
    |> Enum.sum
  end

  def part2(input) do
    input
    |> map_to_groups
    |> Enum.map(fn x -> {Enum.join(x), Enum.count(x)} end)
    |> Enum.map(fn {combined, count} -> {String.split(combined, "", trim: true), count} end)
    |> Enum.map(fn {split_arr, count} -> {Enum.frequencies(split_arr), count} end)
    |> Enum.map(&count_frequencies/1)
    |> Enum.sum
  end

  defp map_to_groups(input) do
    input
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(fn x -> x != [""] end)
  end

  defp count_frequencies({frequencies, count}) do
    Enum.count(frequencies, fn {k, v} -> v == count end)
  end
end
