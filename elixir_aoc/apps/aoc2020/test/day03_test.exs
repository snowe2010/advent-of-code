import AdventOfCodeTest

aoc_test 2020, 3 do

  describe "part1/1" do
    test "test input has 2 valid passwords" do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#",
      ]

      assert 2 = input |> part1()
    end

    test "full input has ? valid passwords" do
      assert 483 = part1(input_stream())
    end
  end


  describe "part2/1" do
    test "test input has 1 valid passwords" do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#",
      ]

      assert 1 = input |> part2()
    end

    # test "full input has ? valid passwords" do
    #   assert 483 = part2()
    # end
  end
end
