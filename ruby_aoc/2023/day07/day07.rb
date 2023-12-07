# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

score_map = %w[. . J 2 3 4 5 6 7 8 9 T Q K A]
execute(1) do |lines|
  scores = lines.map do |line|
    hand, bid = line.split
    tally = hand.split('').tally
    score = case
            when tally.any? { |k, v| v == 5 }
              # puts "five of a kind"
              7
            when tally.any? { |k, v| v == 4 }
              # puts "four of a kind"
              6
            when tally.any? { |k, v| v == 3 } && tally.any? { |k, v| v == 2 }
              #               puts "full house"
              5
            when tally.any? { |k, v| v == 3 } && tally.all? { |k, v| v != 2 }
              #               puts "three of a kind"
              4
            when tally.any? { |k, v| v == 4 }
              #               puts "four of a kind"
              3
            when tally.count { |k, v| v == 2 } == 2
              #               puts "two pair"
              2
            when tally.one? { |k, v| v == 2 } && tally.all? { |k, v| v <= 2 }
              #               puts "one pair"
              1
            when tally.all? { |k, v| v == 1 }
              #               puts "high card"
              0
            else
              puts "here?"
            end
  end
  p scores
  to_h = lines.zip(scores).to_h
  p to_h
  ranking = to_h.sort do |a, b|
    a_line, a_score = a
    b_line, b_score = b
    if a_score == b_score
      a_hand, a_bid = a_line.split
      b_hand, b_bid = b_line.split
      diff = a_hand.chars.zip(b_hand.chars).drop_while { |a, b| a == b }[0]
      card_1 = score_map.index(diff[0])
      card_2 = score_map.index(diff[1])
      card_1 <=> card_2
    else
      a_score <=> b_score
    end
  end
  p ranking
  max_rank = ranking.size
  (1..max_rank).sum(0) do |rank|
    line = ranking[rank - 1]
    hand, bid = line[0].split
    bid.to_i * rank
  end
end

execute(2, test_only: false) do |lines|
  scores = lines.map do |line|
    hand, bid = line.split
    hand_split = hand.split('')
    tally = hand_split.tally
    if hand_split.any? { |c| c == 'J' }
      highest_non_j = tally.reject { |k, v| k == 'J' }.max_by { |k, v| v }
      begin
        if highest_non_j.nil?
          tally = { 'A': 5 }
        else
          tally[highest_non_j[0]] += tally['J']
        end
      rescue Exception => e
        puts ''
      end

      tally.delete('J')
    end
    # p ""
    score = case
            when tally.any? { |k, v| v == 5 }
              puts "five of a kind #{hand}"
              7
            when tally.any? { |k, v| v == 4 }
              # puts "four of a kind"
              6
            when tally.any? { |k, v| v == 3 } && tally.any? { |k, v| v == 2 }
              #               puts "full house"
              5
            when tally.any? { |k, v| v == 3 } && tally.all? { |k, v| v != 2 }
              #               puts "three of a kind"
              4
            when tally.any? { |k, v| v == 4 }
              #               puts "four of a kind"
              3
            when tally.count { |k, v| v == 2 } == 2
              #               puts "two pair"
              2
            when tally.one? { |k, v| v == 2 } && tally.all? { |k, v| v <= 2 }
              #               puts "one pair"
              1
            when tally.all? { |k, v| v == 1 }
              #               puts "high card"
              0
            else
              puts "here?"
            end
  end
  p scores
  to_h = lines.zip(scores).to_h
  p to_h
  ranking = to_h.sort do |a, b|
    a_line, a_score = a
    b_line, b_score = b
    if a_score == b_score
      a_hand, a_bid = a_line.split
      b_hand, b_bid = b_line.split
      diff = a_hand.chars.zip(b_hand.chars).drop_while { |a, b| a == b }[0]
      card_1 = score_map.index(diff[0])
      card_2 = score_map.index(diff[1])
      card_1 <=> card_2
    else
      a_score <=> b_score
    end
  end
  p ranking
  max_rank = ranking.size
  (1..max_rank).sum(0) do |rank|
    line = ranking[rank - 1]
    hand, bid = line[0].split
    bid.to_i * rank
  end

end
