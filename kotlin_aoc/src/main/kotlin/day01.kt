fun main() {
    day01()
}

fun day01() {
    execute("01", "1") { lines ->
        val ints = lines.map { it.toInt() }
        val mutableListOf = mutableListOf(0).apply { addAll(ints) }
        val message = mutableListOf.zip(ints).drop(1)
        message.count { (a, b) -> b > a }
    }
    execute("01", "2") { lines ->
        val ints = lines.map { it.toInt() }
        val list1 = mutableListOf(0).apply { addAll(ints) }
        val list2 = mutableListOf(0, 0).apply { addAll(ints) }
        val message = list2.zip(list1)
            .zip(ints) { a, b -> Triple(a.first, a.second, b) }
            .drop(2)
            .map { (a, b, c) -> a + b + c }
        val list3 = mutableListOf(0).apply { addAll(message) }
        list3.zip(message)
            .drop(1)
            .count { (a, b) -> b > a }
    }
}