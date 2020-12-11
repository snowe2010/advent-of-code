import AdventOfCodeTest

aoc_test 2020, 4 do
#  describe "part1/1" do
#    test "test input has 2 valid passwords" do
#      input = [
#        "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd",
#        "byr:1937 iyr:2017 cid:147 hgt:183cm",
#        "",
#        "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884",
#        "hcl:#cfa07d byr:1929",
#        "",
#        "hcl:#ae17e1 iyr:2013",
#        "eyr:2024",
#        "ecl:brn pid:760753108 byr:1931",
#        "hgt:179cm",
#        "",
#        "hcl:#cfa07d eyr:2025 pid:166559648",
#        "iyr:2011 ecl:brn hgt:59in"
#      ]
#
#      assert 2 = input |> part1()
#    end
#
#    test "full input has ? valid passwords" do
#      assert 213 = part1(input_stream())
#    end
#  end

  describe "part2/1" do
#    test "test input has 0 valid passwords" do
#      input = [
#        "eyr:1972 cid:100",
#        "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926",
#        "",
#        "iyr:2019",
#        "hcl:#602927 eyr:1967 hgt:170cm",
#        "ecl:grn pid:012533040 byr:1946",
#        "",
#        "hcl:dab227 iyr:2012",
#        "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277",
#        "",
#        "hgt:59cm ecl:zzz",
#        "eyr:2038 hcl:74454a iyr:2023",
#        "pid:3556412378 byr:2007",
#      ]
#
#      assert 0 = input |> part2()
#    end
#
#    test "test input has 4 valid passwords" do
#      input = [
#        "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980",
#        "hcl:#623a2f",
#        "",
#        "eyr:2029 ecl:blu cid:129 byr:1989",
#        "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm",
#        "",
#        "hcl:#888785",
#        "hgt:164cm byr:2001 iyr:2015 cid:88",
#        "pid:545766238 ecl:hzl",
#        "eyr:2022",
#        "",
#        "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719",
#      ]
#
#      assert 4 = input |> part2()
#    end

    test "completely valid line" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 1 = part2(input)
    end

    test "byr is invalid above 2002" do
      input = [
        "byr:2003 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]
      
      assert 0 = part2(input)
    end
    test "byr is invalid below 1920" do
      input = [
        "byr:1919 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]
      
      assert 0 = part2(input)
    end
    test "byr is valid at 1920" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]
      
      assert 1 = part2(input)
    end

    test "iyr is invalid above 2020" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2021 ecl:amb"
      ]
      
      assert 0 = part2(input)
    end
    test "iyr is invalid below 2010" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2009 ecl:amb"
      ]
      
      assert 0 = part2(input)
    end
    test "iyr is valid at 2010" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]
      
      assert 1 = part2(input)
    end

    test "eyr is invalid above 2030" do
      input = [
        "byr:1920 pid:000000000 eyr:2031 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "eyr is invalid below 2020" do
      input = [
        "byr:1920 pid:000000000 eyr:2019 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "eyr is valid between 2020-2030" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 1 = part2(input)
    end

    test "hgt is invalid below 150cm" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:149cm iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "hgt is invalid below 59in" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:58in iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "hgt is invalid above 193cm" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:194cm iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "hgt is invalid above 76in" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:77in iyr:2010 ecl:amb"
      ]

      assert 0 = part2(input)
    end
    test "hgt is valid between 150cm and 193cm" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 1 = part2(input)
    end
    test "hgt is valid between 59in and 76in" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:59in iyr:2010 ecl:amb"
      ]

      assert 1 = part2(input)
    end

    test "hcl is invalid without # followed by 6 chars" do
      input = [
        "byr:1920 pid:000000000 eyr:2020 hgt:150cm iyr:2010 ecl:amb"
      ]

      assert 1 = part2(input)
    end


    test "full input has ? valid passwords" do
      assert 190 = part2(input_stream())
    end
  end
end
