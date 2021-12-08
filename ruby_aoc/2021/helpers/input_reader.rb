require 'pp'

def execute(part, test_only = false, &block)
  puts "======"
  puts "Part #{part}"
  puts "======"
  puts
  print "Test output: "
  test &block
  puts
  unless test_only
    print "Real output: "
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