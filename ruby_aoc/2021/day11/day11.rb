# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

Octopus = Struct.new(:x, :y, :energy, :flashed_this_step)

def parse_octopuses(lines) = lines.map(&:chars).each_with_index.map { |line, y| line.each_with_index.map { |oct, x| Octopus.new(x, y, oct.to_i, false) } }

def increment_energy_level(octopussies)
  octopussies.each do |line|
    line.each do |octopus|
      octopus.energy += 1
    end
  end
end

def increment_adjacent_octopussies(octopussies, octopus)
  x = octopus.x
  y = octopus.y

  octopussies[y - 1][x - 1].energy += 1 if y != 0 && x != 0
  octopussies[y - 1][x].energy += 1 if y != 0
  octopussies[y - 1][x + 1].energy += 1 if y != 0 && x != 9
  octopussies[y][x - 1].energy += 1 if x != 0
  octopussies[y][x].energy += 1 # already flashed, but do this just so I can simplify this all later
  octopussies[y][x + 1].energy += 1 if x != 9
  octopussies[y + 1][x - 1].energy += 1 if y != 9 && x != 0
  octopussies[y + 1][x].energy += 1 if y != 9
  octopussies[y + 1][x + 1].energy += 1 if y != 9 && x != 9
end

def flash(octopussies)
  flash_count = 0
  loop do
    flashing_octopussies = octopussies.flatten.find_all { |octopus| octopus.energy > 9 && !octopus.flashed_this_step }
    break if flashing_octopussies.empty?
    flashing_octopussies.each do |octopus|
      unless octopus.flashed_this_step
        octopus.flashed_this_step = true
        flash_count += 1
        increment_adjacent_octopussies octopussies, octopus
      end
    end
  end
  flash_count
end

def energy_returns_to_zero(octopussies)
  octopussies.each do |line|
    line.each do |oct|
      oct.energy = 0 if oct.energy > 9
      oct.flashed_this_step = false
    end
  end
end

def octopussies_struct_back_to_energy(octopussies)
  octopussies.map { |line| line.map { |oct| oct.energy } }
end

execute(1) do |lines|
  octopussies = parse_octopuses(lines)
  flash_count = 0
  100.times do
    increment_energy_level(octopussies)
    flash_count += flash(octopussies)
    energy_returns_to_zero(octopussies)
  end
  pp octopussies_struct_back_to_energy(octopussies)
  flash_count
end

execute(2) do |lines|
  octopussies = parse_octopuses(lines)
  step = 1
  loop do
    puts "Step #{step}"
    increment_energy_level(octopussies)
    flash(octopussies)
    energy_returns_to_zero(octopussies)
    break step if octopussies.all? { |line| line.all? { |oct| oct.energy == 0 } }
    step += 1
  end
  step
end
