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


execute(1, alternative_text: "Code Golf") do |games|
  games_out = games.sum(0) do |game|
    game_id, rounds = game.split(':')
    rounds = rounds.split(';')
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
    if maxes["red"] <= 12 && maxes["green"] <= 13 && maxes["blue"] <= 14
      game_id.split(' ')[1].to_i
    else
      0
    end
  end
  p games_out
end

execute(2, alternative_text: "Code Golf Readable") do |games|
  games_out = games.map do |line|
    line.sub!(/.*:/,'')
    maxes = Hash.new(0)
    line.split(?;) do |round|
      round.split(?,) do |color_count|
        count, color = color_count.split
        maxes[color] = maxes[color]<count.to_i ?count.to_i : maxes[color]
      end
    end
    maxes.each_value.reduce(&:*)
  end.sum
  p games_out
end

execute(2, alternative_text: "Code Golf 142 chars") do |g|
p g.map{_1.sub!(/.*:/,'')
m=Hash.new(0)
_1.split(?;){|r|r.split(?,){|a|b,c=a.split
m[c]=[m[c],b.to_i].max}}
m.values.reduce(&:*)}.sum
end


# https://www.reddit.com/r/adventofcode/comments/188w447/2023_day_2_solutions/kbneo94/
execute(2, alternative_text: "Code Golf modified cwby_bbop solution") do |games|
  games_out = games.map do |line|
    line.sub!(/.*:/,'')
    maxes = Hash.new(0)
    line.split(?;) do |round|
      round.scan(/(\d+) (\w+)/).map do |k, v|
        maxes[v] = [maxes[v], k.to_i].max
      end
    end
    maxes.values.reduce(&:*)
  end.sum
  p games_out
end


# https://www.reddit.com/r/adventofcode/comments/188w447/2023_day_2_solutions/kbneo94/
execute(2, alternative_text: "Code Golf modified cwby_bbop compressed") do |g|
p g.map{|l|l.sub!(/.*:/,'')
m=Hash.new(0)
l.split(?;){|r|r.scan(/(\d+) (\w+)/){|k,v|m[v]=[m[v],k.to_i].max}}
m.values.reduce(&:*)}.sum
end