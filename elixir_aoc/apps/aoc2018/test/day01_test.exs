defmodule Aoc2018.Day01Test do
  # use ExUnit.Case
  use Aoc2018.FancyCase

  import Aoc2018.Day01

  describe "part1/1" do
    test "+1, +1, +1 results in 3" do
      input = "+1, +1, +1"
      assert 3 = input |> part1()
    end

    test "+1, +1, -2" do
      input = "+1, +1, -2"
      assert 0 = input |> part1()
    end

    test "-1, -2, -3" do
      input = "-1, -2, -3"
      assert -6 = input |> part1()
    end

    test_with_puzzle_input do
      assert 531 = puzzle_input() |> part1()
    end
  end

  describe "part2/1" do
    test "+1, -1 first reaches 0 twice." do
      input = "+1, -1"
      assert 1 = input |> part2()
    end

    test "+3, +3, +4, -2, -4 first reaches 10 twice." do
      input = "+3, +3, +4, -2, -4"
      assert 10 = input |> part2()
    end

    test "-6, +3, +8, +5, -6 first reaches 5 twice." do
      input = "-6, +3, +8, +5, -6"
      assert 5 = input |> part2()
    end

    test "+7, +7, -2, -7, -4 first reaches 14 twice." do
      input = "+7, +7, -2, -7, -4"
      assert 14 = input |> part2()
    end

    test_with_puzzle_input do
      assert 76787 = puzzle_input() |> part2()
    end
  end
end
