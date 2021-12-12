#Part 1

#Checks to make sure if won yet
def check_win(board)
  board.each do |row|
    if row == Array.new(row.size, nil)
      return true
    end
  end

  transpose(board).each do |row|
    if row == Array.new(row.size, nil)
      return true
    end
  end
  return false
end

#Takes a matrix and returns its transpose
def transpose(matrix)
  transpose = Array.new(matrix[0].size) { Array.new(matrix.size) }
  for x in 0...matrix.size
    for y in 0...matrix[0].size
      transpose[y][x] = matrix[x][y]
    end
  end
  return transpose
end

#Checks to see if the number is on the board, and marks it nil
def mark(board, target)
  board.each.with_index do |row, x|
    row.each.with_index do |num, y|
      if num == target
        board[x][y] = nil
      end
    end
  end
end

input = IO.read("input.txt").split("\n\n")

draws = input[0].split(",").map(&:to_i)
boards = input[1..]

#Make boards 2D arrays
boards.map! do |board|
  board.split("\n").map! do |board|
    board.split(" ").map(&:to_i)
  end
end

#draws.each do |draw|
#  boards.each do |board|
#    mark(board, draw)
#    if check_win(board)
#      #Find the sum of unmarked numbers
#      unmarked_sum = board.reduce(0) {|sum, row| sum += row.reject(&:nil?).reduce(:+) }
#      puts unmarked_sum * draw
#   end
#  end
#end

def print_board(board)
  board.each {|row| p row }
end

#Part B
winners = []
draws.each do |draw|
  boards.each do |board|
    next if winners.include?(board)
    mark(board, draw)
    if check_win(board)
      winners << board
      if winners.size == boards.size
        puts "Num of Winners #{winners.size}"
        puts "Draw #{draw}"
        print_board(board)
        unmarked_sum = board.reduce(0) {|sum, row| 
          row_sum = row.reject(&:nil?).reduce(:+)
          sum += (row_sum || 0)
        }
        puts unmarked_sum * draw
      end
    end
  end
end

