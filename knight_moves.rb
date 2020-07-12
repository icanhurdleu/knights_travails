require_relative 'board'
require_relative 'knight'

class KnightMoves

  def initialize
    @knight = Knight.new
  end

  def create_children(chess_coord)
    moves = []
    # Add all possible moves from initial coordinates to 'moves' array
    8.times do |i|
      moves << [chess_coord.x_coord + @knight.move_x[i], chess_coord.y_coord + @knight.move_y[i]]
    end
  end

  def test
    puts @knight.move_x[0]
    puts @knight.move_y[0]
  end

end

knight = KnightMoves.new
knight.test