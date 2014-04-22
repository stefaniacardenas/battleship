require "board"

describe Board do 
	let(:board) {Board.new}
	it "returns one array with ten elements" do
		expect(board.rows.count).to eq 10
	end

	it "each element of the array is an array" do 
		expect(board.rows[0].class).to eq Array
	end 
	
end 