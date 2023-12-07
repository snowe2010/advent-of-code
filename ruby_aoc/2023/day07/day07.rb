# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def get_score tally
  vals = tally.values
  case
  when vals.any?(5)
    7
  when vals.any?(4)
    6
  when vals.any?(3) && vals.any?(2)
    5
  when vals.any?(3) && tally.all? { |_, v| v != 2 }
    4
  when vals.any?(4)
    3
  when vals.count(2) == 2
    2
  when vals.one?(2) && tally.all? { |_, v| v <= 2 }
    1
  when vals.all?(1)
    0
  else
    puts "here?"
  end
end

def get_ranking(lines, score_map, scores)
  lines.zip(scores).to_h.sort do |a, b|
    a_line, a_score = a
    b_line, b_score = b
    if a_score == b_score
      a_hand, _ = a_line.split
      b_hand, _ = b_line.split
      diff = a_hand.chars.zip(b_hand.chars).drop_while { |a, b| a == b }[0]
      card_1 = score_map.index(diff[0])
      card_2 = score_map.index(diff[1])
      card_1 <=> card_2
    else
      a_score <=> b_score
    end
  end
end

def calculate_total_winnings(ranking)
  max_rank = ranking.size
  (1..max_rank).sum(0) do |rank|
    line = ranking[rank - 1]
    _, bid = line[0].split
    bid.to_i * rank
  end
end

score_map_p1 = %w[. . 2 3 4 5 6 7 8 9 T J Q K A]
score_map_p2 = %w[. . J 2 3 4 5 6 7 8 9 T Q K A]

execute(1) do |lines|
  scores = lines.map do |line|
    hand, _ = line.split
    tally = hand.split('').tally
    get_score tally
  end
  ranking = get_ranking(lines, score_map_p1, scores)
  calculate_total_winnings ranking
end

execute(2, test_only: false) do |lines|
  scores = lines.map do |line|
    hand, _ = line.split
    hand_split = hand.split('')
    tally = hand_split.tally
    if hand_split.any? { |c| c == 'J' }
      highest_non_j = tally.reject { |k, v| k == 'J' }.max_by { |k, v| v }
      if highest_non_j.nil?
        tally = { 'A': 5 }
      else
        tally[highest_non_j[0]] += tally['J']
      end
      tally.delete('J')
    end
    get_score tally
  end
  ranking = get_ranking(lines, score_map_p2, scores)
  calculate_total_winnings(ranking)
end
