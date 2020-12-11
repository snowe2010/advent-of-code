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

  describe "part2/1" do
    test "test input has 1 valid passwords" do
      input = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"
      ]

      assert 1 = input |> part2s()
    end

    test "test input has ? valid passwords" do
      input = [
        "3-4 j: tjjj", # x
        "7-10 h: nhhhhhgghphhh", # x
        "7-13 j: tpscbbstbdjsjbtcpj", # v
        "4-13 l: ckllmqzlvcsxpplqg", # v
        "3-11 n: nnrhnnnnnnnwsdnnnm", # v
        "5-6 d: ddddddb", # x
        "7-10 z: szfwzrbzzz", # v
        "1-10 w: wwwwwcwwwrpnwzwxww", # v
      ]

      assert 5 = input |> part2s()
    end

    test "full input has ? valid passwords" do
      assert 482 = part2()
    end
  end
end
