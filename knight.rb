class Knight
  attr_reader :move_x, :move_y

  # initialize allowable movements for a knight
  def initialize
    @move_x = [-1, -1, 1, 1, -2, -2, 2, 2]
    @move_y = [-2, 2, -2, 2, -1, 1, -1, 1]
  end
end