class Board

  def initialize(player='norman_no_name')
    @player = player
  end

  def rows
    row_array = Array.new(10, "")
    board_array = Array.new(10, row_array)
		return board_array
	end

  def owner
    @player.name
  end

  def place(boat)

  end

end
