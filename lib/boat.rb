class Boat

	# def initialize(boat_length)
	# 	@length 
	# end
	attr_reader :boat_body, :boat_length, :start_point

	def initialize(boat_length)
		@boat_length = boat_length
		generate_orientation
		generate_random_starting_point
	end
	#generates a starting point for this

	def generate_orientation
		@orientation = [:horizontal, :vertical].sample
	end

	def generate_random_starting_point
			
			if @orientation == :horizontal

				positioning_range = 10 - boat_length
				@start_point = [rand(10),rand(positioning_range)]

			elsif @orientation == :vertical

				positioning_range = 10 - boat_length
				@start_point = [rand(positioning_range), rand(10)]

			end
	end

	def boat_coordinates
		x,y = @start_point
		if @orientation == :horizontal
			columns = [*(y..(y+@boat_length-1))]
			coords = columns.map {|col| [x,col]}
			@boat_body = coords
		else rows = [*(x..(x+@boat_length-1))]
			coords = rows.map {|row| [row,y]}
			@boat_body = coords
			#columns == [5,6,7,8]
			#rows == [9]
		end	
	end


end