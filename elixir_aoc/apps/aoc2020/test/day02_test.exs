import AdventOfCodeTest

aoc_test 2020, 2 do

  describe "part1/1" do
    test "test input has 2 valid passwords" do
      input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
      ]

      assert 2 = input |> part1s()
    end

    test "full input has ? valid passwords" do
      assert 483 = part1()
    end
  end

  # describe "part2/1" do
  #   test "test input results in 241861950" do
  #     input = """
  #     1-3 a: abcde
  #     1-3 b: cdefg
  #     2-9 c: ccccccccc
  #     """

  #     assert {2020, 241_861_950} = input |> part2s()
  #   end
  # end
end
