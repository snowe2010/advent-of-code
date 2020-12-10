import AdventOfCode

aoc 2020, 4 do
  def part1(input) do
    input
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(fn x -> x != [""] end)
    |> Enum.map(fn x -> Enum.join(x, " ") end)
    |> Enum.count(fn passport -> 
      ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
      |> Enum.all?(fn field -> String.contains?(passport, field) end)
    end)
  end

  def part2(input) do
  end

end
