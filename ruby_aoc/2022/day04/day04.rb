# frozen_string_literal: true

require 'pp'
require 'set'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  lines.map { |a| a.split(',') }.map do |elf_1, elf_2|
    elf_1_start, elf_1_end = elf_1.split('-').map(&:to_i)
    elf_2_start, elf_2_end = elf_2.split('-').map(&:to_i)
    elf_1_range = (elf_1_start..elf_1_end).to_set
    elf_2_range = (elf_2_start..elf_2_end).to_set
    elf_1_range.subset?(elf_2_range) || elf_2_range.subset?(elf_1_range)
  end.count(&:itself)
end

execute(2) do |lines|
  lines.map { |a| a.split(',') }.map do |elf_1, elf_2|
    elf_1_start, elf_1_end = elf_1.split('-').map(&:to_i)
    elf_2_start, elf_2_end = elf_2.split('-').map(&:to_i)
    elf_1_range = (elf_1_start..elf_1_end).to_set
    elf_2_range = (elf_2_start..elf_2_end).to_set
    elf_1_range.intersect?(elf_2_range)
  end.count(&:itself)
end
