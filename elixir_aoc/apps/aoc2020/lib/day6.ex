import AdventOfCode

aoc 2020, 6 do
  def part1(input) do
    input
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(fn x -> x != [""] end)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(fn x-> String.split(x,"", trim: true) end)
    |> Enum.map(&Enum.sort/1) # only dedups consecutive elems
    |> Enum.map(&Enum.dedup/1)
    |> Enum.map(&Enum.count/1)
    |> Enum.reduce(&(&1 + &2))
  end

  def part2(input) do
  end
end
