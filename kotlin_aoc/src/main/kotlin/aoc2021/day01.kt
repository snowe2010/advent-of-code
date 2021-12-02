fun main() {
    day01()
}

fun day01() {
    execute("2021", "01", "1") { lines ->
        lines.map { it.toInt() }.windowed(2).count { (a, b) -> b > a }
    }
    execute("2021", "01", "2") { lines ->
        lines.map { it.toInt() }
            .windowed(3)
            .map { it.sum() }
            .windowed(2)
            .count { (a, b) -> b > a }
    }
}
