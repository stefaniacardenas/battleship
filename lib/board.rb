require 'boat'

class Board


  attr_reader :rows

  def initialize(player='norman_no_name')
    @player = player
    @rows = create_board
  end

  def owner
    @player.name
  end

  def create_board
    board=[]
    10.times { board << Array.new(10,"")}
    board
  end

  def translate(coordinates)
    [extract_column(coordinates), extract_row(coordinates)]
  end

  def extract_column(coordinates)
    coordinates[0].upcase.ord - 65
  end

  def extract_row(coordinates)
    number = coordinates.chars.last.to_i
    number -= 1
  end

  def opponent_view
    opponent_array = []
    10.times { opponent_array << Array.new(10,"")}
    return opponent_array
  end

  def register_shot(coordinates)
    x, y = translate(coordinates)
    case @rows[x][y]
    when "s" then @rows[x][y] = "x"
    when "" then @rows[x][y] = 'o'
    end
  end

  def place(boat)
    if check_availability(boat)
      boat.boat_body.each do |coordinate|
        x, y = coordinate
        @rows[x][y] = 's'
      end
    else
    self.place(Boat.new(boat.boat_length))
    end
  end

  def check_availability(boat)
    bad_array = boat.boat_body.select do
      |cell|
      x,y = cell
      true if @rows[x][y] == "s"
    end
    bad_array.nil?
    end

end


=begin
This is how we created our LETTER to column constant:

Hash[*[*'A'..'J'].each_with_index.map{
      |letters,index| [letters,index]
      }.flatten]
=end
