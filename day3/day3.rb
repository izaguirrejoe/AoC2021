lines = IO.readlines("input.txt", chomp: true)

#Part 1
result = ""

lines[0].size.times do |index|
  zeros = 0
  ones = 0
  lines.each do |bits|
    bit = bits[index].to_i
    if bit == 0
      zeros += 1
    else
      ones += 1
    end
  end
  result += (zeros > ones)? "0" : "1"
end

gamma = result.to_i(2)
epsilon = result.to_i(2) ^ (1 << result.size) - 1 
p gamma * epsilon

#Part 2
oxygen = 0
lines[0].size.times do |index|
  #Find most common bit
  zeros = 0
  ones = 0
  lines.each do |bits|
    if bits[index] == "0"
      zeros += 1
    else
      ones += 1
    end
  end

  most_common = ones >= zeros ? "1" : "0"
  lines.filter! { |bits| bits[index] == most_common }

  if lines.size == 1
    oxygen = lines.first.to_i(2)
    break
  end
end
 
lines = IO.readlines("input.txt", chomp: true)

co2 = 0
lines[0].size.times do |index|
  #Find least common bit
  zeros = 0
  ones = 0
  lines.each do |bits|
    if bits[index] == "0"
      zeros += 1
    else
      ones += 1
    end
  end

  least_common = ones >= zeros ? "0" : "1"
  lines.filter! { |bits| bits[index] == least_common }

  if lines.size == 1
    co2 = lines.first.to_i(2)
    break
  end
end

puts oxygen
puts co2

puts oxygen * co2
