require "board"

describe 'Board' do 
    
  let(:player) {double :player, name: 'Bob'}
	let(:board)  {Board.new(player)}
	let(:boat_1) {double :boat , boat_body: [[1,1],[1,2],[1,3],[1,4],[1,5],[1,6]]}
	let(:boat_2) {double :boat , boat_body: [[9,5],[8,5]]}

	context "Board" do

	  it "has a player when initialized." do
	    expect(board.owner).to eq 'Bob'
	  end  

	  it "returns one array with ten elements" do
	  	expect(board.rows.count).to eq 10
	  end

	  it "each element of the array is an array" do 
	  	expect(board.rows[0].class).to eq Array
	  end 

      it "each array within main array contains 10 elements" do
        expect(board.rows[0].count).to eq 10
      end

      it "coordinates [0][0] contains a string" do
      	expect(board.rows[0][0]).to eq ""
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

	  xit "LETTER_TO_COLUMN returns 0 for A" do
	    expect(board.show_letter_to_column('A')).to eq 0
	  end

	  xit "LETTER_TO_COLUMN returns 1 for B" do
	  expect(board.show_letter_to_column('B')).to eq 1
	  end  

	  it "translates coordinates B1 to array indices" do
	    expect(board.translate('B1')).to eq [1,0]
	  end

	  it "translates coordinates A1 to array indices" do
	  	expect(board.translate('A1')).to eq [0,0]
	  end

	  

	end


	  

	  # it "can count the boats"

	  # it "knows the length of a boat"

	context "can place a boat" do

	  it "can place a boat" do
	  	board.place(boat_1)
	  	expect(board.rows[1][5]).to eq "s"
	  	expect(board.rows[1][6]).to eq "s"
	  end

	  it "knows the position of boat_1" do
	  	board.place(boat_1)
	  	expect(board.rows[1][5]).to eq "s"
	  	expect(board.rows[1][6]).to eq "s"
	  end

	end

	context 'Playing the game' do

	  it 'can hit a boat' do
	  	board.place(boat_1)
	  	board.register_shot('B2')
	  	expect(board.rows[1][1]).to eq 'x'
	  end

	  it "can register a miss" do
	  	board.register_shot('B2')
	  	expect(board.rows[1][1]).to eq "o"
	  end




	end





  # - an 'o' denotes a shot in the water
  # - an 'x' denotes a hit on a ship
  # - an 's' denotes a ship





	




end
