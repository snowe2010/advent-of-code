package com.tyler.year2022

import com.tyler.day

fun main() {
    day02()
}

private fun day02() {
    day(2022, 2) {
        execute(1) { day02p1(it) }
        execute(2) { day02p2(it) }
    }
}

enum class RPS(val points: Int) { rock(1), paper(2), scissors(3); }
enum class Outcome(val score: Int) { draw(3), win(6), loss(0); }


private fun rps(them: RPS, me: RPS) = when (them) {
    RPS.rock -> when (me) {
        RPS.rock -> Outcome.draw
        RPS.paper -> Outcome.win
        RPS.scissors -> Outcome.loss
    }

    RPS.paper -> when (me) {
        RPS.rock -> Outcome.loss
        RPS.paper -> Outcome.draw
        RPS.scissors -> Outcome.win
    }

    RPS.scissors -> when (me) {
        RPS.rock -> Outcome.win
        RPS.paper -> Outcome.loss
        RPS.scissors -> Outcome.draw
    }
}

private fun day02p1(lines: List<String>): Int {
    val pointValues = mapOf(
        "A" to RPS.rock,
        "B" to RPS.paper,
        "C" to RPS.scissors,
        "X" to RPS.rock,
        "Y" to RPS.paper,
        "Z" to RPS.scissors,
    )
    return lines.sumOf {
        val enums = it.split(" ")
            .mapNotNull { pointValues[it] }

        val outcome = rps(enums[0], enums[1])
        enums[1].points + outcome.score
    }
}

sealed interface Hand {
    val win: RPS
    val loss: RPS
    val draw: RPS

    data class Rock(
        override val win: RPS = RPS.paper,
        override val loss: RPS = RPS.scissors,
        override val draw: RPS = RPS.rock,
    ) : Hand

    data class Paper(
        override val win: RPS = RPS.scissors,
        override val loss: RPS = RPS.rock,
        override val draw: RPS = RPS.paper,
    ) : Hand

    data class Scissors(
        override val win: RPS = RPS.rock,
        override val loss: RPS = RPS.paper,
        override val draw: RPS = RPS.scissors,
    ) : Hand
}

private fun day02p2(lines: List<String>): Int {

    val mapping = mapOf(
        "A" to Hand.Rock(),
        "B" to Hand.Paper(),
        "C" to Hand.Scissors(),
        "X" to Outcome.loss,
        "Y" to Outcome.draw,
        "Z" to Outcome.win,
    )
    return lines.sumOf {
        val enums = it.split(" ")
            .mapNotNull { mapping[it] }
        val opponentsHand = enums[0] as Hand
        val desiredOutcome = enums[1] as Outcome
        val myHand: RPS = when (desiredOutcome) {
            Outcome.loss -> opponentsHand.loss
            Outcome.draw -> opponentsHand.draw
            Outcome.win -> opponentsHand.win
        }
        myHand.points + desiredOutcome.score
    }
}
