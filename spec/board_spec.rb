require "board"

describe Board do 
  let(:player) {double :player, name: 'Bob'}
	let(:board)  {Board.new(player)}
	let(:boat_1) {double :boat , start_point:[1,1] , end_point: [1,7]}
	let(:boat_2) {double :boat , start_point:[9,5] , end_point: [8,5]}

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

  it "can place a boat" do
  	board.place(boat_1)
  	expect(board.rows[1][5]).to eq "s"
  end

  it "knows the length of a boat"

  # it "knows the orientation of a boat"

  it "knows boats can not overlap"

  it "knows two boats can not be next to each other"
end 
