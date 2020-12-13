import AdventOfCodeTest

aoc_test 2020, 7 do
  describe "part1/1" do
    @tag :skip
    test "test input" do
      input = [
        "light red bags contain 1 bright white bag, 2 muted yellow bags.",
        "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
        "bright white bags contain 1 shiny gold bag.",
        "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
        "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
        "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
        "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
        "faded blue bags contain no other bags.",
        "dotted black bags contain no other bags.",
      ]

      assert 0 = part1(input)
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
