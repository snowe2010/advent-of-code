defmodule AdventOfCodeTest do
  def module_name(year, day) do
    mod_year = "Y#{year}" |> String.to_atom()
    mod_day = "D#{day}" |> String.to_atom()
    Module.concat(:AdventOfCode, Module.concat(mod_year, mod_day))
  end

  defp get_date() do
    case DateTime.now("America/Toronto") do
      {:ok, d} -> d
      _ -> Date.utc_today()
    end
  end

  defmacro aoc_test(year, day, do: body) do
    quote do
      defmodule unquote(test_module_name(year, day)) do
        @path "input/day#{unquote(day)}.txt"

        @behaviour AdventOfCode
        use AdventOfCode.FancyCase
        import unquote(module_name(year, day))

        def input_path, do: @path

        def input_stream do
          @path
          |> Path.expand()
          |> File.stream!()
          |> Stream.map(&String.trim/1)
        end

        unquote(body)
      end
    end
  end

  def test_module_name(year, day) do
    mod_year = "Y#{year}" |> String.to_atom()
    mod_day = "D#{day}Test" |> String.to_atom()
    Module.concat(:AdventOfCode, Module.concat(mod_year, mod_day))
  end
end
