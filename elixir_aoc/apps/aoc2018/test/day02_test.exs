defmodule Aoc2018.Day02Test do
  use Aoc2018.FancyCase

  import Aoc2018.Day02

  describe "part1/1" do
    test "abcdef, bababc, abbcde, abcccd, aabcdd, abcdee, ababab results in 12" do
      input = "abcdef, bababc, abbcde, abcccd, aabcdd, abcdee, ababab"
      assert 12 = input |> part1()
    end

    test "aa, aaa, bb, bbb results in 4" do
      input = "aa, aaa, bb, bbb"
      assert 4 = input |> part1()
    end

    test "uqyoeiznvmzrstpkgnsacjxwld, uqloeizfvmbrstpkgndacjxwyd, dqgoeizfbmbrstpkgnhacjxwld results in 4" do
      input = "uqyoeiznvmzrstpkgnsacjxwld, uqloeizfvmbrstpkgndacjxwyd, dqgoeizfbmbrstpkgnhacjxwld"
      assert 0 = input |> part1()
    end

    test_with_puzzle_input do
      assert 5681 = puzzle_input() |> part1()
    end
  end

  describe "part2/1" do
    test "abcde, fghij, klmno, pqrst, fguij, axcye, wvxyz" do
      input = "abcde, fghij, klmno, pqrst, fguij, axcye, wvxyz"
      assert "fgij" = input |> part2()
    end

    test_with_puzzle_input do
      assert "uqyoeizfvmbistpkgnocjtwld" = puzzle_input() |> part2()
    end
  end
end
