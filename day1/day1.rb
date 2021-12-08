input = IO.readlines("input.txt").map(&:to_i)

#Part A
count = 0

input.drop(1).zip(input).each do |a,b|
  if a > b
    count += 1
  end
end
p count

#Part B
count = 0
input.drop(3).zip(input).each do |a,b|
  if a > b
    count += 1
  end
end

p count

