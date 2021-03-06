import AdventOfCodeTest

aoc_test 2020, 5 do
  describe "part1/1" do
    test "test input" do
      input = [
        "FBFBBFFRLR"
      ]

      assert 357 = part1(input)
    end

    test "test input 2" do
      input = [
        "BFFFBBFRRR"
      ]

      assert 567 = part1(input)
    end

    test "test input 3" do
      input = [
        "FFFBBBFRRR"
      ]

      assert 119 = part1(input)
    end

    test "test input 4" do
      input = [
        "BBFFBBFRLL"
      ]

      assert 820 = part1(input)
    end

    test "test input multiple finds correct high id" do
      input = [
        "FBFBBFFRLR",
        "BFFFBBFRRR",
        "FFFBBBFRRR",
        "BBFFBBFRLL",
      ]

      assert 820 = part1(input)
    end

    test "full input" do
      assert 911 = part1(input_stream())
    end
  end

  describe "part2/1" do
    test "find missing seat 6" do
      input = [
        "FFFFFFFLLL",
        "FFFFFFFLLR",
        "FFFFFFFLRL",
        "FFFFFFFLRR",
        "FFFFFFFRLL",
        "FFFFFFFRLR",
#        "FFFFFFFRRL",
        "FFFFFFFRRR",
      ]

      assert 6 = part2(input)
    end
    
    test "full input" do
      assert 629 = part2(input_stream())
    end
  end
end
