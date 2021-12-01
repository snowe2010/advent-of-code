import java.io.File
import java.nio.file.Paths

fun execute(day: String, part: String, block: (List<String>) -> Any) {
    println("======")
    println("Day $day Part $part")
    println("======")
    println()
    print("Test: ")
    test(day, block)
    print("Real: ")
    real(day, block)
    println()
}

fun test(day: String, block: (List<String>) -> Any) {
    val readLines: List<String> = getInput("day$day.example.txt").readLines()
    val message = block.invoke(readLines)
    println(message)
}

fun real(day: String, block: (List<String>) -> Any) {
    val readLines: List<String> = getInput("day$day.real.txt").readLines()
    val message = block.invoke(readLines)
    println(message)
}

fun getInput(filename: String): File {
    val projectFolder = Paths.get("").toAbsolutePath().toString()
    return File("$projectFolder/src/main/resources/$filename")
}