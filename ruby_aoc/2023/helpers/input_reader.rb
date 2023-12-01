require 'pp'

def golf(part, &block)
  execute(part, test_only: false, alternative_text: "Code Golf", &block)
end

def execute(part, test_only: false, alternative_text: nil, test_file_suffix: '', &block)
  puts "======"
  puts "Part #{part} #{": #{alternative_text}" if alternative_text}"
  puts "======"
  puts
  puts "Test output: "
  test(test_file_suffix, &block)
  puts
  unless test_only
    puts "Real output: "
    input &block
    puts
  end
end

def test(test_file_suffix)
  filename = File.basename($0, '.rb')
  output = yield File.readlines("#{filename}#{test_file_suffix}.test.txt", chomp: true)
  pp output
end

def input
  filename = File.basename($0, '.rb')
  output = yield File.readlines("#{filename}.real.txt", chomp: true)
  pp output
end