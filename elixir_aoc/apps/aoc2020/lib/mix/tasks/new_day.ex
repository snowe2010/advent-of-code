defmodule Mix.Tasks.NewDay do
  use Mix.Task
  @moduledoc false


  @new_day_file """
                import AdventOfCode
              
                aoc 2020, <day> do
                  def part1(input) do
                  end
              
                  def part2(input) do
                  end
                end
                """
  
  @new_day_test_file """
  import AdventOfCodeTest

  aoc_test 2020, <day> do
    describe "part1/1" do
      test "test input" do
        input = [
        ]

        assert 0 = part1(input)
      end

      test "full input" do
        assert 0 = part1(input_stream())
      end
    end

    describe "part2/1" do
      test "test input" do
        input = [
        ]

        assert 0 = part2(input)
      end

      test "full input" do
        assert 0 = part2(input_stream())
      end
    end
  end
  """  
  
  @shortdoc "Simply calls the Hello.say/0 function."
  def run(args) do
    max_day = Path.wildcard("lib/day*.ex")
    |> Enum.sort
    |> Enum.max
    |> String.replace_prefix("lib/day", "")
    |> String.replace_suffix(".ex", "")
    |> String.to_integer
    
    new_day = max_day + 1
    
    day = String.replace(@new_day_file, "<day>", Integer.to_string(new_day))
    day_test = String.replace(@new_day_test_file, "<day>", Integer.to_string(new_day))
    File.write!("lib/day" <> Integer.to_string(new_day) <> ".ex", day)
    File.write!("test/day" <> Integer.to_string(new_day) <> "_test.exs", day_test)
    File.write!("input/day" <> Integer.to_string(new_day) <> ".txt", "")
  end
end
