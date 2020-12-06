defmodule Aoc2020.Day01 do
  use Aoc2020

  def part1(input) do
    input
      |> parse
  end

  def part2(input) do
    input
    |> parse
  end

  defp parse(input) do
    input
    |> String.split(~r/\n|, /)
    |> Enum.map(&String.to_integer/1)
  end
end
