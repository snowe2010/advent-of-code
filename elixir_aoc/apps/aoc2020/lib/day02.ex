import AdventOfCode

aoc 2020, 2 do
  def part1() do
    stream()
    |> part1s
  end

  def part1s(input) do
    input
    |> count_incorrect_passwords
  end

  defp count_incorrect_passwords(parts) do
    parts
    |> Enum.count(&is_pw_correct?/1)
  end

  defp is_pw_correct?(pw) do
    # [requirements_full, pw] = pw |> String.split(": ")
    # [requirements, letter] = requirements_full |> String.split()
    # [min, max] = String.split(requirements, "-")
    # IO.inspect(pw <> letter <> min <> max)
    # IO.puts "Password is " <> pw
    captures = Regex.named_captures(~r/^(?<min>\d+)-(?<max>\d+) (?<letter>[[:alpha:]]): (?<pw>[[:alpha:]]+)$/, pw)

    # IO.inspect captures
    captures["pw"]
    |> String.codepoints()
    |> Enum.count(fn current_letter -> current_letter == captures["letter"] end)
    |> is_number_in_range?(captures["min"], captures["max"])
  end

  defp is_number_in_range?(num, min, max) do
    Enum.member?(String.to_integer(min)..String.to_integer(max), num)
  end

  def part2() do
    stream()
    |> part2s
  end

  def part2s(input) do
    input
  end

  defp parse(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp stream(), do: input_stream()
  # |> IO.inspect()
    # |> Stream.map(&String.to_integer/1)
    # |> IO.inspect()
    # |> Enum.sort()
    # |> IO.inspect()
end
