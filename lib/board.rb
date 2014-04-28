require_relative './boat'

class Board

  attr_reader :rows, :boats
  attr_accessor :opponent_view

  def initialize(player='norman_no_name')
    @player = player
    @rows = create_board
    @boats = []
    opponent_array
    generate_boats
  end

  def owner
    @player.name
  end

  def create_board
    board=[]
    10.times { board << Array.new(10,"")}
    board
  end

  def generate_boats
    @boats = []
    @boats << Boat.new(5)
    @boats <<  Boat.new(4)
    @boats <<  Boat.new(3)
    @boats <<  Boat.new(2)
    place_all(@boats)
  end

  def place_all(boats)
    boats.each do |boat|
      until check_availability(boat)
        boat = Boat.new(boat.boat_length)
      end
      place(boat)
    end
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

  def opponent_array
    @opponent_view = []
    10.times { @opponent_view << Array.new(10,"")}
    return @opponent_view
  end

  def register_shot(coordinates)
    x, y = translate(coordinates)
    case @rows[x][y]
    when "s" 
      @rows[x][y] = "x"
      @opponent_view[x][y] = "x"
    when ""
      @rows[x][y] = 'o'
      @opponent_view[x][y] = 'o'
    end
  end

  def place(boat)
    boat.boat_body.each do |coordinate|
      x, y = coordinate
      @rows[x][y] = 's'
    end
  end

  def check_availability(boat)
    bad_array = boat.boat_body.select do |cell|
      x,y = cell
      true if @rows[x][y] == "s"
    end
    bad_array.empty?
  end

end


=begin
This is how we created our LETTER to column constant:

Hash[*[*'A'..'J'].each_with_index.map{
      |letters,index| [letters,index]
      }.flatten]
=end
