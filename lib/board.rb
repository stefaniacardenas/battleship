class Board

  LETTER_TO_COLUMN = Hash[*[*'A'..'J'].each_with_index.map{
      |letters,index| [letters,index]
      }.flatten]

  def initialize(player='norman_no_name')
	@player = player
	@board_array = []
  rows
  end

  def show_letter_to_column(letter)
    LETTER_TO_COLUMN[letter]
  end

  # def board_array
  # 	@board_array ||= []
  # end

  def rows
    10.times { @board_array << Array.new(10,"")}
	return @board_array
  end

  def opponent_view
  	opponent_array = []
  	10.times { opponent_array << Array.new(10,"")}
	return opponent_array
  end

  def translate(coordinates)
    extract_column(coordinates) + extract_row(coordinates)
 	end

def extract_column(coordinates)
	letter = coordinates.chars.first
    [] << LETTER_TO_COLUMN[letter]
end

def extract_row(coordinates)
	number = coordinates.chars.last.to_i
    number -= 1
    [] << number
end


  def owner
    @player.name
  end

  def place(boat)


  end

end
