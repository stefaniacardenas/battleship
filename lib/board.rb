class Board

  LETTER_TO_COLUMN = {"A"=>0, "B"=>1, "C"=>2, "D"=>3, "E"=>4, 
  	"F"=>5, "G"=>6, "H"=>7, "I"=>8, "J"=>9}

  attr_reader :board_array


  def initialize(player='norman_no_name')
	@player = player
	@rows = create_board
  end


  def owner
    @player.name
  end


  attr_reader :rows

  def create_board
    board=[]
    10.times { board << Array.new(10,"")}
    board
  end

  def translate(coordinates)
    extract_column(coordinates) + extract_row(coordinates)
  end

  def extract_column(coordinates)
  	letter = coordinates.chars.first
      [] << LETTER_TO_COLUMN[letter]
  end

  def show_letter_to_column(letter)
    LETTER_TO_COLUMN[letter]
  end

  def extract_row(coordinates)
  	number = coordinates.chars.last.to_i
      number -= 1
      [] << number
  end

  def opponent_view
    	opponent_array = []
    	10.times { opponent_array << Array.new(10,"")}
  	return opponent_array
  end


  def register_shot(coordinates)
    x, y = translate(coordinates)
    @rows[x][y] = 'o'
  end

  def place(boat)
    boat.boat_length.each do |coordinate|
      x, y = coordinate
      @rows[x][y] = 's'
  end

  

end
end

=begin 
This is how we created our LETTER to column constant:

Hash[*[*'A'..'J'].each_with_index.map{
      |letters,index| [letters,index]
      }.flatten]
=end
