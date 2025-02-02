class Knight
  def valid_moves(position)
    x, y = position
    # all valid moves
    moves = [
      [x + 2, y + 1], [x + 2, y - 1],
      [x - 2, y + 1], [x - 2, y - 1],
      [x + 1, y + 2], [x + 1, y - 2],
      [x - 1, y + 2], [x - 1, y - 2]
    ]
    # filter out moves that are off the board
    moves.select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
  end

  def knight_moves(start, finish)
    # check if start and finish are the same
    if start == finish
      puts "You're already there!"
      return
    end

    # initialize queue for BFS and visited array
    queue = [[start]]
    visited = []

    # BFS
    until queue.empty?
      current_path = queue.shift
      current_position = current_path.last

      # check if current position has been visited
      next if visited.include?(current_position)
      visited << current_position

      # check if current position is the finish
      if current_position == finish
        puts "You made it in #{current_path.length - 1} moves! Here's your path:"
        current_path.each { |move| puts "#{move}" }
        return
      end

      # add valid moves to queue
      valid_moves(current_position).each do |move|
        queue << (current_path + [move])
      end
    end
  end
end