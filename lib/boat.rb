class Boat

	def initialize(boat_length)
		if boat_length <= 6 && boat_length >= 2
			generate_random_starting_point_for(boat_length)
		else
			puts "Your ship can only range from 2 to 6"
		end
	end
	#generates a starting point for this
	def generate_random_starting_point_for(boat_length)
		orientation = ["horizontal","vertical"].sample
			
			if orientation == "horizontal"

				positioning_range = boat_length - 9
				starting_position = [rand(9),rand(positioning_range)]
				puts starting_position.inspect + orientation

			elsif orientation == "vertical"

				positioning_range = boat_length - 9
				starting_position = [rand(positioning_range), rand(9)]
				puts starting_position.inspect + orientation

			end
	end
end