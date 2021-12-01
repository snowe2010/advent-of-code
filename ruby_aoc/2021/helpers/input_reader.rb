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
  output = yield File.read("#{filename}.example.txt").each_line
  puts output
end

def input
  filename = File.basename($0, '.rb')
  output = yield File.read("#{filename}.txt").each_line
  puts output
end