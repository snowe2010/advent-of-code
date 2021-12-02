import java.io.File
import java.nio.file.Paths

fun execute(year: String, day: String, part: String, block: (List<String>) -> Any) {
    println("=======================")
    println("Year $year Day $day Part $part")
    println("=======================")
    println()
    print("Test: ")
    test(year, day, block)
    print("Real: ")
    real(year, day, block)
    println()
}

fun test(year: String, day: String, block: (List<String>) -> Any) {
    val readLines: List<String> = getInput(year,"day$day.example.txt").readLines()
    val message = block.invoke(readLines)
    println(message)
}

fun real(year: String, day: String, block: (List<String>) -> Any) {
    val readLines: List<String> = getInput(year, "day$day.real.txt").readLines()
    val message = block.invoke(readLines)
    println(message)
}

fun getInput(year: String, filename: String): File {
    val projectFolder = Paths.get("").toAbsolutePath().toString()
    return File("$projectFolder/src/main/resources/aoc$year/$filename")
}