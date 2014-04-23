require "board"

describe 'Board' do 
    
  let(:player) {double :player, name: 'Bob'}
	let(:board)  {Board.new(player)}
	let(:boat_1) {double :boat , start_point:[1,1] , end_point: [1,6]}
	let(:boat_2) {double :boat , start_point:[9,5] , end_point: [8,5]}

	context "Board" do

	  it "has a player when initialized." do
	    expect(board.owner).to eq 'Bob'
	  end  

	  it "returns one array with ten elements" do
	  	expect(board.board_array.count).to eq 10
	  end

	  it "each element of the array is an array" do 
	  	expect(board.rows[0].class).to eq Array
	  end 

      it "each array within main array contains 10 elements" do
        expect(board.rows[0].count).to eq 10
      end

    end

	context "Opponent Board" do

	  it "returns one array with ten elements" do
	  	expect(board.opponent_view.count).to eq 10
	  end

	  it "each array within main array contains 10 elements" do
	  	expect(board.opponent_view[0].count).to eq 10
	  end

	end

	context "Coordinates" do

	  it "LETTER_TO_COLUMN returns 0 for A" do
	    expect(board.show_letter_to_column('A')).to eq 0
	  end

	  it "LETTER_TO_COLUMN returns 1 for B" do
	  expect(board.show_letter_to_column('B')).to eq 1
	  end  

	  it "translates coordinates B1 to array indices" do
	    expect(board.translate('B1')).to eq [1,0]
	  end

	  it "translates coordinates A1 to array indices" do
	  	expect(board.translate('A1')).to eq [0,0]
	  end

	end

context "can place a boat" do

	  it "knows the position of boat_1" do
	  	board.place(boat_1)
	  	expect(board.board_array[1][5]).to eq "s"
	  	expect(board.board_array[1][6]).to eq "s"
	  end

	  it "returns a range of column" do 
			board.place(boat_1)
			expect(board.place(boat_1)).to eq (1..1)
	  end

	end



end






  # - an 'o' denotes a shot in the water
  # - an 'x' denotes a hit on a ship
  # - an 's' denotes a ship





	#   it "knows the length of a boat"

	#   # it "knows the orientation of a boat"

	#   it "knows boats can not overlap"

	#   it "knows two boats can not be next to each other"
	# end 
