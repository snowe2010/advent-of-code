package com.tyler.year2022

import com.tyler.day

fun main() {
    day01()
}

private fun day01() {
    day(2022, 1) {
        execute(1) { day01p1(it) }
        execute(2) { day01p2(it) }
    }
}

private fun day01p1(lines: List<String>): Int {
    val indexes = listOf(-1) + lines.indexesOf("") + listOf(lines.size)
    return indexes
        .windowed(2)
        .maxOf { (a, b) -> lines.subList(a + 1, b).sumOf { it.toInt() } }
}

private fun day01p2(lines: List<String>): Int {
    val indexes = listOf(-1) + lines.indexesOf("") + listOf(lines.size)
    return indexes
        .windowed(2)
        .map { (a, b) -> lines.subList(a + 1, b).sumOf { it.toInt() } }
        .sortedDescending()
        .subList(0, 3)
        .sum()
}

private fun <E> Iterable<E>.indexesOf(e: E) = mapIndexedNotNull { index, elem -> index.takeIf { elem == e } }