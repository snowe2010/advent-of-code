require 'pathname'
require 'pp'
require 'fileutils'

year_dir = if ARGV[0].nil?
             Pathname('.').each_child.find_all { |child| child.directory? && !child.basename.to_s.start_with?('.') }.max_by { |dir| dir.to_s.to_i }
           else
             Pathname(ARGV[0])
           end

day = if ARGV[1].nil?
            Pathname(year_dir).glob("day*").select(&:directory?).map(&:to_s).map { |dir| dir.delete_prefix("#{year_dir}/day").to_i}.max + 1
          else
            ARGV[1]
          end

day_dir = "day#{day}"

new_day_path = "#{year_dir.basename}/#{day_dir}"
FileUtils.mkdir_p(new_day_path)
FileUtils.cp(".template/template.rb", "#{new_day_path}/#{day_dir}.rb")
FileUtils.cp(".template/template.real.txt", "#{new_day_path}/#{day_dir}.real.txt")
FileUtils.cp(".template/template.test.txt", "#{new_day_path}/#{day_dir}.test.txt")
