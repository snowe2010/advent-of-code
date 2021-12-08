require 'pp'

def execute(part, test_only = false, alternative_text: nil, &block)
  puts "======"
  puts "Part #{part} #{": #{alternative_text}" if alternative_text}"
  puts "======"
  puts
  puts "Test output: "
  test &block
  puts
  unless test_only
    puts "Real output: "
    input &block
    puts
  end
end

def test
  filename = File.basename($0, '.rb')
  output = yield File.readlines("#{filename}.test.txt", chomp: true)
  pp output
end

def input
  filename = File.basename($0, '.rb')
  output = yield File.readlines("#{filename}.real.txt", chomp: true)
  pp output
end