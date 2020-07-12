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

    # Select only valid moves (inside boundary of chess board)
    valid_moves = moves.select do |coord|
      (coord[0] >= 0 && coord[0] < 8) && (coord[1] >= 0 && coord[1] < 8)
    end

    # Add children to current node
    valid_moves.each do |valid_coord|
      chess_coord.children << Board.new(valid_coord[0], valid_coord[1], chess_coord)
    end
  end

  def search_for_route(start_coord, end_coord)
    start = Board.new(start_coord[0], start_coord[1])
    queue = [start]
    create_children(start)
    # Add all valid movements to search queue
    start.children.each do |child|
      queue << child
    end

    # Loop until end point is reached
    loop do 
      current = queue.shift
      if end_coord[0] == current.x_coord && end_coord[1] == current.y_coord
        return display_route(current)
      else
        create_children(current)
        current.children.each do |child|
          queue << child
        end
      end
    end
  end

  def display_route(final_coord)
    current_parent = final_coord.parent 
    # start route array with final destination
    final_route = [[final_coord.x_coord, final_coord.y_coord]]

    # Work back up the tree until start coord is reached
    until current_parent.nil?
      final_route.unshift([current_parent.x_coord, current_parent.y_coord])
      current_parent = current_parent.parent
    end
    puts "\nTotal of #{final_route.length - 1} moves required. Here's the path taken:"
    puts clean_route_print(final_route)
    puts "\n"
  end

  private

  def clean_route_print(route)
    # Accepts an array of coords, and returns a formatted route
    route_str = ""
    until route.empty?
      route_str += "#{route.shift}"
      route_str += " --> " unless route.size == 0
    end
    route_str
  end

end

knight = KnightMoves.new
knight.search_for_route([3,3], [4,3])