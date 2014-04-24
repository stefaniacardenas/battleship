class Boat

	# def initialize(boat_length)
	# 	@length 
	# end
	attr_reader :boat_body, :boat_length

	def initialize(boat_length)
		@boat_length = boat_length
		generate_random_starting_point_for(boat_length)
	end
	#generates a starting point for this

	def generate_orientation
		@orientation = [:horizontal, :vertical].sample
	end

	def generate_random_starting_point_for(boat_length)
			
			if @orientation == :horizontal

				positioning_range = 10 - boat_length
				starting_position = [rand(10),rand(positioning_range)]
				puts "#{starting_position.inspect} , #{@orientation}"

			elsif @orientation == :vertical

				positioning_range = 10 - boat_length
				starting_position = [rand(positioning_range), rand(10)]
				puts "#{starting_position.inspect} , #{@orientation}"

			end
	end

	def boat_coordinates(starting_position)
		x,y = starting_position
		if @orientation == :horizontal
			columns = [*(y..(y+@boat_length))]
			coords = columns.map {|col| [x,col]}
			@boat_body = coords
		else rows = [*(x..(x+@boat_length))]
			coords = rows.map {|row| [row,y]}
			@boat_body = coords
			#columns == [5,6,7,8]
			#rows == [9]
		end	
	end


end