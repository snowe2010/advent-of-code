fun main() {
    day01()
}

fun day01() {
    day(2021, 1) {
        execute(1) { lines ->
            lines.map { it.toInt() }.windowed(2).count { (a, b) -> b > a }
        }

        execute(2) { lines ->
            // turns out that b + c + d  > a + b + c is the same as d > a since b and c cancel out
            lines.map { it.toInt() }
                .windowed(4)
                .count { (a, _, _, d) -> d > a }
        }
    }
}
