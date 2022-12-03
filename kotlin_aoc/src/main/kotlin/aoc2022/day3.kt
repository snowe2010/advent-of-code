package com.tyler.year2022

import com.tyler.day

fun main() {
    day(2022, 3) {
        execute(1) { p1(it) }
        execute(2) { p2(it) }
    }
}

private fun p1(lines: List<String>): Int {
    return lines.map {
        it.substring(0..it.length / 2) to it.substring(it.length / 2 until it.length)
    }.map { (left, right) ->
        left.toList().intersect(right.toList()).first()
    }.map {
        if (it.isUpperCase()) it - 38 else it - 96
    }.sumOf { it.code }
}

private fun p2(lines: List<String>): Int {
    return lines.windowed(3, 3) { (a, b, c) ->
        a.toList().intersect(b.toList()).intersect(c.toList()).first()
    }.map {
        if (it.isUpperCase()) it - 38 else it - 96
    }.sumOf { it.code }
}
