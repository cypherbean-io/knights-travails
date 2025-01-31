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
end