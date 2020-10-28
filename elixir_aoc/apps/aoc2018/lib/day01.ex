defmodule Aoc2018.Day01 do
  use Aoc2018

  def part1(input) do
    input
      |> parse
      |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse
    |> Stream.cycle()
    |> r
  end

  defp parse(input) do
    input
    |> String.split(~r/\n|, /)
    |> Enum.map(&String.to_integer/1)
  end

  defp r(stream) do
    Enum.reduce_while(stream, {0, MapSet.new()}, fn stream, {last, visited} ->
      resulting_frequency = last + stream
      if MapSet.member?(visited, resulting_frequency) do
        {:halt, resulting_frequency}
      else
        {:cont, {resulting_frequency, MapSet.put(visited, resulting_frequency)}}
      end
    end)
  end
end
