#Part 1

lines = IO.readlines("input.txt", chomp: true)

horizontal = 0
depth = 0

lines.each do |line|
  dir, quant = line.split(' ')
  quant = quant.to_i
  if dir == "forward"
    horizontal += quant
  elsif dir == "up"
    depth -= quant
  elsif dir == "down"
    depth += quant
  end
end

puts "Horizontal: #{horizontal}"
puts "Depth: #{depth}"

puts horizontal * depth

#Part 2

horizontal = 0
depth = 0
aim = 0

lines.each do |line|
  dir, quant = line.split(' ')
  quant = quant.to_i

  if dir == "forward"
    horizontal += quant
    depth += quant * aim
  elsif dir == "up"
    aim -= quant
  elsif dir == "down"
    aim += quant
  end
end


puts horizontal * depth
