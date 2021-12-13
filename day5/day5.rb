#Part 1

lines = IO.readlines("input.txt", chomp: true)

map = []

lines.each do |line|
  x1,y1,x2,y2 = line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map(&:to_i)
  if x1 == x2 
    map[x1] ||= Array.new
    smaller, larger = [y1, y2].sort
    for y in smaller..larger
      map[x1][y] ||= 0
      map[x1][y] += 1
    end
  elsif y1 == y2
    smaller,larger = [x1, x2].sort
    for x in smaller..larger
      map[x] ||= Array.new
      map[x][y1] ||= 0
      map[x][y1] += 1
    end
  end
end

p map.flatten.compact.reduce(0) { |sum, num| sum += (num > 1) ? 1 : 0 }
