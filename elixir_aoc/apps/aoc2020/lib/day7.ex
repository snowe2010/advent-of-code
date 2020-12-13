import AdventOfCode

aoc 2020, 7 do
  def part1(input) do
    input
    |> Enum.map(&parse_rule/1)
    |> IO.inspect
    |> Enum.map(&parse_rule_into_map/1)
    |> IO.inspect
    |> List.flatten
    |> IO.inspect
#    |>  
  end

  defp parse_rule(rule) do
    Regex.split(~r{( bags contain | bag, | bags, | bag.| bags.)}, rule)
    |> Enum.slice(0..-2)
  end

  defp parse_rule_into_flat_map([outer | inner]) do
    inner_map = inner
                |> Enum.map(fn code ->
                       case code do
                         "no other" -> :nil
                         c ->
                           [[_, number, color]] = Regex.scan(~r{^(\d+) (\w.*)$}, c)
                           color
                       end
                     end)
    {outer, inner_map}
  end

  defp parse_rule_into_map([outer | inner]) do
    inner_map = inner
    |> Enum.map(
         fn code ->
           case code do
             "no other" -> :nil
             c -> 
               [[_, number, color]] = Regex.scan(~r{^(\d+) (\w.*)$}, c)
               %{color => outer}
           end
         end
       )
       |> IO.inspect
#    {outer, inner_map}
  end

#  defp find_elem_in_values(input, elem) do
#    input
#    |> Enum.into([], fn key, arr ->
#      
#    end)
#  end
  def part2(input) do
  end
end
