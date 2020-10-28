defmodule Aoc2018 do
  @moduledoc """
  Documentation for `Aoc2018`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc2018.hello()
      :world

  """
  def hello do
    :world
  end

  @moduledoc """
  Base module for day solutions. By `use`ing this module a `puzzle_input/0`
  function will be provided that reads puzzle input to a string. Will probably
  only be used during tests
  """

  defmacro __using__(options) do
    quote do
      import Aoc2018

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
    |> String.replace(~r/(\w)(\d)/, "\\1_\\2")
  end

  defp trim(text, false), do: String.trim_trailing(text, "\n")
  defp trim(text, _), do: String.trim(text)
end
