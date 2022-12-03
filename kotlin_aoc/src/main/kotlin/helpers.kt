package com.tyler

import java.io.File

class AocDay(private val year: Int, private val day: Int) {
    private val realLines = File("src/main/resources/aoc$year", "day$day.real.txt").readLines()
    private val testLines = File("src/main/resources/aoc$year", "day$day.test.txt").readLines()

    fun execute(part: Int, block: (List<String>) -> Any) {
        println("=======================")
        println("Year $year Day $day Part $part")
        println("=======================")
        println()
        print("Test: ")
        test(block)
        print("Real: ")
        real(block)
        println()
    }

    fun test(block: (List<String>) -> Any) {
        println(block.invoke(testLines))
    }

    fun real(block: (List<String>) -> Any) {
        println(block.invoke(realLines))
    }
}

fun day(year: Int, day: Int, block: AocDay.() -> Any) {
    block.invoke(AocDay(year, day))
}

/**
 * Provide a means to fluently tap into a chain of method calls so as not to need to declare unnecessary variables
 * */
public fun <T : Any, R> T.tap(tap: (T) -> R): T {
    tap(this)
    return this
}