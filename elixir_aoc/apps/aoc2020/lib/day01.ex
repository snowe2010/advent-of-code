import AdventOfCode

aoc 2020, 1 do
  defp multiply_by_complement(x), do: x * (2020 - x)

  def part1(input) do
    ints = input |> parse

    ints
    |> Enum.find(fn int ->
      complement = 2020 - int
      ints |> Enum.find(false, fn x -> x == complement end)
    end)
    |> multiply_by_complement
  end

  def part2(input) do
    ints = input |> parse

    tuples =
      for i <- ints, j <- ints, k <- ints do
        {i + j + k, i * j * k}
      end

    tuples |> Enum.find(fn {add, _} -> add == 2020 end)
  end

  defp parse(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end
end
