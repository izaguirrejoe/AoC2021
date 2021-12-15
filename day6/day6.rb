#Part 1

nums = IO.read("input.txt").split(",").map(&:to_i)

# p nums

puts "Initial state: #{nums}"
256.times do |day|
  spawn = []
  nums.each.with_index do |num, index|
    num -= 1
    if num < 0
      num = 6
      spawn << 8
    end
    nums[index] = num
  end
  nums += spawn
  # puts "After #{day} days: #{nums}"
end

p nums.length
