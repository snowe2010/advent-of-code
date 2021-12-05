require 'pp'

def execute(part, &block)
  puts "======"
  puts "Part #{part}"
  puts "======"
  puts
  print "Test output: "
  test &block
  puts
  print "Real output: "
  input &block
  puts
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