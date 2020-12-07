defmodule AdventOfCode.Y2020.Day1Test do
  use AdventOfCode.FancyCase

  import AdventOfCode.Y2020.D1

  describe "part1/1" do
    test "test input results in 514579" do
      input = """
      1721
      979
      366
      299
      675
      1456
      """

      assert 514_579 = input |> part1()
    end

    # test_with_puzzle_input do
    # assert 445 = puzzle_input() |> part1()
    # end
  end

  describe "part2/1" do
    test "test input results in 241861950" do
      input = """
      1721
      979
      366
      299
      675
      1456
      """

      assert {2020, 241_861_950} = input |> part2()
    end
  end
end
