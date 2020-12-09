defmodule AdventOfCode do
  @moduledoc """
  Base module for day solutions. By `use`ing this module a `puzzle_input/0`
  function will be provided that reads puzzle input to a string. Will probably
  only be used during tests
  """

  defmacro __using__(options) do
    quote do
      import Aoc2020

      def puzzle_input do
        read_puzzle_input_for(__MODULE__, unquote(options))
      end
    end
  end

  @doc false
  def read_puzzle_input_for(module, options) do
    case File.read(Path.join(["input", input_filename(module) <> ".txt"])) do
      {:ok, data} -> trim(data, Keyword.get(options, :trim))
      {:error, _} -> nil
    end
  end

  defp input_filename(module) do
    module
    |> to_string()
    |> String.split(".")
    |> Enum.at(2)
    |> Macro.underscore()
  end

  defp trim(text, false), do: String.trim_trailing(text, "\n")
  defp trim(text, _), do: String.trim(text)

  @doc """
  Cool macro from
  https://www.reddit.com/r/elixir/comments/e4rdo0/my_try_at_advent_of_code_day_1_with_elixir_as_a/f9gwauh
  with some added goodies.
  """
  defmacro aoc(year, day, do: body) do
    quote do
      defmodule unquote(module_name(year, day)) do
        @path "input/day#{unquote(day)}.txt"

        @behaviour AdventOfCode

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

  def module_name(year, day) do
    mod_year = "Y#{year}" |> String.to_atom()
    mod_day = "D#{day}" |> String.to_atom()
    Module.concat(:AdventOfCode, Module.concat(mod_year, mod_day))
  end

  # Helpers to make the iex experience a bit smoother
  def part1(), do: part1(get_date().day, get_date().year)
  def part2(), do: part2(get_date().day, get_date().year)
  def part1(day), do: part1(day, get_date().year)
  def part2(day), do: part2(day, get_date().year)
  def part1(day, year), do: module_name(year, day).part1()
  def part2(day, year), do: module_name(year, day).part2()

  defp get_date() do
    case DateTime.now("America/Denver") do
      {:ok, d} -> d
      _ -> Date.utc_today()
    end
  end

  @callback part1() :: any()
  @callback part2() :: any()
end
