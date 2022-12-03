package com.tyler.year2021
import com.tyler.day

@JvmName("2021Day1")
fun main() {
    day01()
}

private fun day01() {
    day(2021, 1) {
        execute(1) { day01p1(it) }
        execute(2) { day01p2(it) }
    }
}

private fun day01p1(lines: List<String>) = lines.map { it.toInt() }.windowed(2).count { (a, b) -> b > a }

// turns out that b + c + d  > a + b + c is the same as d > a since b and c cancel out
private fun day01p2(lines: List<String>) = lines.map { it.toInt() }
    .windowed(4)
    .count { (a, _, _, d) -> d > a }
