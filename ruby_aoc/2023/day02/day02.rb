# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |games|
  games_out = games.sum(0) do |game|
    game_id, rounds = game.split(':')
    rounds = rounds.split(';')
    p game_id
    maxes = {
      "red" => 0,
      "green" => 0,
      "blue" => 0,
    }
    rounds.map(&:strip).map do |round|
      round.split(", ").each do |color_count|
        count, color = color_count.split(" ")
        maxes[color] = if maxes[color] < count.to_i
                         count.to_i else maxes[color]
                       end
      end
    end
    p rounds
    p maxes
    if maxes["red"] <= 12 && maxes["green"] <= 13 && maxes["blue"] <= 14
      game_id.split(' ')[1].to_i
    else
      0
    end
  end
  p games_out
end

execute(2) do |games|
  games_out = games.map do |game|
    game_id, rounds = game.split(':')
    rounds = rounds.split(';')
    p game_id
    maxes = {
      "red" => 0,
      "green" => 0,
      "blue" => 0,
    }
    rounds.map(&:strip).map do |round|
      round.split(", ").each do |color_count|
        count, color = color_count.split(" ")
        maxes[color] = if maxes[color] < count.to_i
                         count.to_i else maxes[color]
                       end
      end
    end
    p rounds
    p maxes
    if maxes["red"] <= 12 && maxes["green"] <= 13 && maxes["blue"] <= 14
      game_id.split(' ')[1].to_i
    else
      0
    end
    maxes.each_value.reduce(&:*)
  end.sum
  p games_out
end
