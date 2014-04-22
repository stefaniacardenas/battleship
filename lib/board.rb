class Board

  def initialize(player='norman_no_name')
    @player = player
  end

  def rows
		board_array = []
    row_array = []
		10.times{row_array << ""}
    10.times{board_array << row_array}
		return board_array
	end

  def owner
    @player.name
  end

  def place(boat)

  end

end
