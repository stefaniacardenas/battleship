require_relative './board.rb'

class Player

  def initialize(name)
    @name = name
    @board = Board.new(@name)
  end

  def has_ships_still_floating?
    @rows.include?("s")
  end

end
