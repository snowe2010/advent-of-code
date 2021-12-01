fun main() {
    day01()
}

fun day01() {
    execute("01", "1") { lines ->
        lines.map { it.toInt() }.windowed(2).count { (a, b) -> b > a }
    }
    execute("01", "2") { lines ->
        lines.map { it.toInt() }
            .windowed(3)
            .map { (a, b, c) -> a + b + c }
            .windowed(2)
            .count { (a, b) -> b > a }
    }
}