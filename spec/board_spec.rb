require "board"

describe Board do 
  let(:player) {double :player, name: 'Bob'}
	let(:board)  {Board.new(player)}

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

end 
