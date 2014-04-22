class Board

  def initialize(player='norman_no_name')
    @player = player
  end

  def rows
		board_array = []
		10.times{board_array << (1..10).to_a}
		return board_array
	end

  def owner
    @player.name
  end

end
