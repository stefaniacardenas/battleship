class Board

	def rows
		board_array = []
		10.times{board_array << (1..10).to_a}
		return board_array
	end

end