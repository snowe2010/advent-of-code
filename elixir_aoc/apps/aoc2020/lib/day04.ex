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
    input
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(fn x -> x != [""] end)
    |> Enum.map(fn x -> Enum.join(x, " ") |> String.split(" ") end)
    |> Enum.map(&map_passport_to_fields/1)
    |> Enum.map(&map_fields_to_requirements/1)
    |> Enum.count(fn mapping ->
      mapping
      |> Enum.all?(&does_field_match_requirements/1)
    end)
  end
  
  defp map_passport_to_fields(passport) do
    Enum.into(passport, [], fn full_field ->
      split = String.split(full_field, ":")
      {String.to_atom(Enum.at(split, 0)), Enum.at(split, 1)}
    end)
  end

  defp map_fields_to_requirements(passport) do
    requirements = [
      byr: ~r/^19[2-9][0-9]|200[0-2]$/,
      iyr: ~r/^201[0-9]|2020$/,
      eyr: ~r/^202[0-9]|2030$/,
      hgt: ~r/^1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in$/,
      hcl: ~r/^#[0-9a-f]{6}$/,
      ecl: ~r/^(amb|blu|brn|gry|grn|hzl|oth)$/,
      pid: ~r/^[0-9]{9}$/
    ]

    Keyword.merge(passport, requirements, fn k, v1, v2 -> {v1, v2} end)
  end

  defp does_field_match_requirements({key, requirement_tuple}) when is_tuple(requirement_tuple) do
    {value, requirement} = requirement_tuple
    String.match?(value, requirement)
  end

  defp does_field_match_requirements({key, requirement}) when key == :cid, do: true
  defp does_field_match_requirements({key, requirement}), do: false

end
