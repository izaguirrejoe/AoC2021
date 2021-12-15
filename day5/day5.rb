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

#Part 2
map = []

lines.each do |line|
  x1,y1,x2,y2 = line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map(&:to_i)
  a, b = [[x1,y1], [x2,y2]].sort
  x1, y1 = a
  x2, y2 = b
  if x1 == x2 
    map[x1] ||= Array.new
    for y in y1..y2
      map[x1][y] ||= 0
      map[x1][y] += 1
    end
  elsif y1 == y2
    for x in x1..x2
      map[x] ||= Array.new
      map[x][y1] ||= 0
      map[x][y1] += 1
    end
  else
    x = x1
    y = y1

    if y1 < y2
      increment = 1
    else
      increment = -1
    end

    while x <= x2
      map[x] ||= Array.new
      map[x][y] ||= 0
      map[x][y] += 1
      x += 1
      y += increment
    end
  end
end

p map.flatten.compact.reduce(0) { |sum, num| sum += (num > 1) ? 1 : 0 }
