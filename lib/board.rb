class Board

  LETTER_TO_COLUMN = Hash[*[*'A'..'J'].each_with_index.map{
      |letters,index| [letters,index]
      }.flatten]

  def initialize(player='norman_no_name')
	@player = player
	board_array
  end

  def show_letter_to_column(letter)
    LETTER_TO_COLUMN[letter]
  end

  def board_array
  	@board_array ||= []
  end

  def rows
    10.times { @board_array << Array.new(10,"")}
	return @board_array
  end

  def translate(coordinates)
  	coordinate = []
    letter = coordinates.chars.first
    coordinate << LETTER_TO_COLUMN[letter]
    number = coordinates.chars.last.to_i
    number -= 1
    coordinate << number
    coordinate
end


  def owner
    @player.name
  end

  def place(boat)

  end

end
