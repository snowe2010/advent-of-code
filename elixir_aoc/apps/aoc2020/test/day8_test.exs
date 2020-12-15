import AdventOfCodeTest

aoc_test 2020, 8 do
  describe "part1/1" do
    test "test input" do
      input = [
        "nop +0",
        "acc +1",
        "jmp +4",
        "acc +3",
        "jmp -3",
        "acc -99",
        "acc +1",
        "jmp -4",
        "acc +6",
      ]

      assert 5 = part1(input)
    end

    @tag :skip
    test "full input" do
      assert 0 = part1(input_stream())
    end
  end

  describe "part2/1" do
    @tag :skip
    test "test input" do
      input = [
      ]

      assert 0 = part2(input)
    end

    @tag :skip
    test "full input" do
      assert 0 = part2(input_stream())
    end
  end
end
