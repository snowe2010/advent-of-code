defmodule Aoc2018.Day2 do
  use Aoc2018

  def part1(file) do
    case File.read(file) do
      {:ok, body} -> body
                      |> parse
                      |> Enum.sum
      {:error, reason} -> IO.puts(reason)
    end
  end

  def part2(file) do
    case File.read(file) do
      {:ok, body} -> body
                      |> parse
                      |> Stream.cycle()
                      |> r
      {:error, reason} -> IO.puts(reason)
    end
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp r(stream) do
    Enum.reduce_while(stream, {0, MapSet.new()}, fn stream, {last, visited} ->
      # IO.puts(last)
      # IO.inspect(visited)
      resulting_frequency = last + stream

      # IO.inspect(resulting_frequency)
      if MapSet.member?(visited, resulting_frequency) do
        {:halt, resulting_frequency}
      else
        {:cont, {resulting_frequency, MapSet.put(visited, resulting_frequency)}}
      end
    end)
  end
end

# IO.puts(Day1.part1("day1.txt"))
# IO.inspect(Day1.part2("day1.txt"))
