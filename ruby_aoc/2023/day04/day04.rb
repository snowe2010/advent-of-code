# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

# execute(1) do |cards|
#   cards.map do |card|
#     winning, mine = card.split(':')[1].split('|')
#     winning_numbers = winning.split.map(&:to_i)
#     mine_numbers = mine.split.map(&:to_i)
#     count = winning_numbers.intersection(mine_numbers).count
#     a = if count > 1
#           2 ** (count - 1)
#         else
#           count
#         end
#     p a
#     a
#   end.sum
# end

def how_many_winning_numbers?(game)
  winning, mine = game.split(':')[1].split('|')
  winning_numbers = winning.split.map(&:to_i)
  mine_numbers = mine.split.map(&:to_i)
  winning_numbers.intersection(mine_numbers).count
end

def won_copies(cards, recursion_depth: 0)
  puts "#{"  "*recursion_depth}New recursion:"
  puts "#{"  "*recursion_depth}Cards: #{cards}"
  mapped_cards = cards.each_with_index.map do |game, game_number|
    puts "#{"  "*recursion_depth}Game #{game}"
    count_of_next_cards = how_many_winning_numbers?(game)
    puts "#{"  "*recursion_depth}I should get the next #{count_of_next_cards} cards"
    next_cards = cards[game_number+1..count_of_next_cards+1]
    puts "#{"  "*recursion_depth}["
    count_of_next_cards += won_copies(next_cards, recursion_depth: recursion_depth + 1)
    puts "#{"  "*recursion_depth}]"
    count_of_next_cards
  end
  puts "#{"  "*recursion_depth}mapped counts #{mapped_cards}"
  puts "#{"  "*recursion_depth}sum #{mapped_cards.sum }"
  mapped_cards.sum
end

# execute(2, test_only: true) do |cards|
#   won_copies(cards)
# end

execute(2, test_only: false) do |cards|
  default_hash = Array.new(cards.size, 1)
  cards.each do |card|
    count = how_many_winning_numbers?(card)
    game = /Card\s+(\d+):.*/.match(card).captures[0].to_i
    current_game_count = default_hash[game-1]
    (game...(count+game)).each do |next_card_index|
      if next_card_index < cards.size
        default_hash[next_card_index] += (1* current_game_count)
      end
    end
  end
  default_hash.sum
end
