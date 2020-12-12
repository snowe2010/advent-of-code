import AdventOfCodeTest

aoc_test 2020, 6 do
  describe "part1/1" do
    test "test input" do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b",
      ]

      assert 11 = part1(input)
    end

    test "full input" do
      assert 6583 = part1(input_stream())
    end
  end

  describe "part2/1" do
    test "test input" do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b",
      ]

      assert 6 = part2(input)
    end

    test "full input" do
      assert 3290 = part2(input_stream())
    end
  end
end
