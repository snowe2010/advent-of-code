import AdventOfCode

aoc 2020, 2 do
  def part1() do
    stream()
    |> part1s
  end

  def part1s(input) do
    input
    |> count_incorrect_passwords_with_old_policy
  end

  defp count_incorrect_passwords_with_old_policy(parts) do
    parts
    |> Enum.count(&is_pw_correct_with_old_policy?/1)
  end

  defp is_pw_correct_with_old_policy?(pw) do
    captures = parse_password_and_requirements(pw)

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
    input |> count_incorrect_passwords_with_new_policy
  end

  defp count_incorrect_passwords_with_new_policy(parts) do
    parts |> Enum.count(&is_pw_correct_with_new_policy?/1)
  end

  defp is_pw_correct_with_new_policy?(pw) do
    captures = parse_password_and_requirements(pw)

    codepoints = captures["pw"]
                 |> String.codepoints()

    first_matches = Enum.at(codepoints, String.to_integer(captures["min"])-1) == captures["letter"]
    last_matches = Enum.at(codepoints, String.to_integer(captures["max"])-1) == captures["letter"]

    first_matches != last_matches
  end

  defp parse_password_and_requirements(pw) do
    Regex.named_captures(~r/^(?<min>\d+)-(?<max>\d+) (?<letter>[[:alpha:]]): (?<pw>[[:alpha:]]+)$/, pw)
  end

  defp stream(), do: input_stream()
    # |> Stream.map(&String.to_integer/1)
    # |> Enum.sort()

end
