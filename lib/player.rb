require_relative './board.rb'

class Player

  def initialize(name)
    @name = name
    @board = Board.new(@name)
  end

  def has_ships_still_floating?
  	bad_array = []
    @board.rows.each{|row| row.each { |deeper_row| bad_array << deeper_row.include?("s")}}
    bad_array.empty?
  end

  def shoot(coordinates, opponent_board)
  end

end
