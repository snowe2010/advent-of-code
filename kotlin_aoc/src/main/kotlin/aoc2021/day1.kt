fun main() {
    day01()
}

fun day01() {
    day(2021, 1) {
        execute(1) { day01p1(it) }
        execute(2) { day01p2(it) }
    }
}

fun day01p1(lines: List<String>) = lines.map { it.toInt() }.windowed(2).count { (a, b) -> b > a }

// turns out that b + c + d  > a + b + c is the same as d > a since b and c cancel out
fun day01p2(lines: List<String>) = lines.map { it.toInt() }
    .windowed(4)
    .count { (a, _, _, d) -> d > a }
