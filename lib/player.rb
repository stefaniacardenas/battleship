require_relative './board.rb'

class Player

  def initialize(name)
    @name = name
    @board = Board.new(@name)
  end

  def has_ships_still_floating?
    bad_array = @board.rows.flatten.select {|cell| cell.include?("s")}
    !bad_array.empty?
  end

  def shoot(at_coordinates, opponent_board)
    opponent_board.register_shot(at_coordinates)
  end

end
