defmodule Aoc2018.Day02 do
  use Aoc2018

  def part1(input) do
    # IO.puts("input " <> input)

    # IO.puts "asldkfj"
    # input
    # |> String.split(~r/\n|, /)
    # |> String.graphemes()
    # |> IO.inspect()
    # |> Enum.group_by(& &1)
    # |> IO.inspect()
    # IO.puts "asldkfj"

    counts = input
    |> String.split(~r/\n|, /)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.frequencies/1)

    two_counts = counts
    |> Enum.filter(fn arr -> Enum.any?(arr, fn ({key, value}) -> value == 2 end) end)
    |> Enum.count()

    three_counts = counts
    |> Enum.filter(fn arr -> Enum.any?(arr, fn ({key, value}) -> value == 3 end) end)
    |> Enum.count()

    two_counts*three_counts
  end

  def part2(input) do
    # sort alphabetically
    # compare each consecutive
    # sort backwards alphabetically
    # compare each consecutive

    forwards = input
    |> String.split(~r/\n|, /)
    |> Enum.sort()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.find(fn (arr) ->
      zipped_chars = Enum.zip(String.graphemes(Enum.at(arr, 0)), String.graphemes(Enum.at(arr, 1)))
      count = Enum.count(zipped_chars, fn arr -> elem(arr, 0) != elem(arr, 1) end)

      count == 1
    end)

    if forwards do
      Enum.zip(String.graphemes(Enum.at(forwards, 0)), String.graphemes(Enum.at(forwards, 1)))
      |> Enum.filter(fn tup -> elem(tup, 0) == elem(tup, 1) end)
      |> Enum.unzip()
      |> elem(0)
      |> Enum.join()
    else
      IO.puts("was backwards")
      backwards = input
      |> String.split(~r/\n|, /)
      |> Enum.sort()
      |> Enum.reverse()
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.find(fn (arr) ->
        zipped_chars = Enum.zip(String.graphemes(Enum.at(arr, 0)), String.graphemes(Enum.at(arr, 1)))
        count = Enum.count(zipped_chars, fn arr -> elem(arr, 0) != elem(arr, 1) end)

        count == 1
      end)

      Enum.zip(String.graphemes(Enum.at(backwards, 0)), String.graphemes(Enum.at(backwards, 1)))
      |> Enum.filter(fn tup -> elem(tup, 0) == elem(tup, 1) end)
      |> Enum.unzip()
      |> elem(0)
      |> Enum.join()
    end
  end

end
