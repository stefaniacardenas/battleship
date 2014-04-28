require 'board'

describe 'Board' do

  let(:player) {double :player, name: 'Bob'}
  let(:board)  {Board.new(player)}
  let(:boat_1) {double :boat , boat_body: [[1,2],[1,3],[1,4],[1,5],[1,6]], boat_length: 5}
  let(:boat_2) {double :boat , boat_body: [[9,5],[8,5][7,5][6,5]], boat_length: 4}
  let(:boat_3) {double :boat, boat_body:  [[3,1],[3,2],[3,3]], boat_length: 3}
  let(:boat_4) {double :boat , boat_body: [[2,5],[2,6]], boat_length: 2}
  let(:boat_overlap) {double :boat , boat_body: [[1,6],[1,7],[1,8]], boat_length: 3}

  before do
    board.stub(:generate_boats)
  end

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

    it "translates coordinates B1 to array indices" do
      expect(board.translate('B1')).to eq [1,0]
    end

    it "translates coordinates A1 to array indices" do
      expect(board.translate('A1')).to eq [0,0]
    end



  end

  context "can place a boat" do

    it "can place a boat" do
      board.stub(:check_availability).and_return(true)
      board.place(boat_1)
      expect(board.rows[1][5]).to eq "s"
      expect(board.rows[1][6]).to eq "s"
    end

    it "knows the position of boat_1" do
      board.stub(:check_availability).and_return(true)
      board.place(boat_1)
      expect(board.rows[1][5]).to eq "s"
      expect(board.rows[1][6]).to eq "s"
    end

  end

  context 'Playing the game' do

    it 'can hit a boat' do
      board.stub(:check_availability).and_return(true)
      board.place(boat_1)
      board.register_shot('B3')
      expect(board.rows[1][2]).to eq 'x'
    end

    it "can register a miss" do
      board.register_shot('B2')
      expect(board.rows[1][1]).to eq "o"
    end

  end

  context 'Boats to board' do

    it 'can check availability for a boat' do
      expect(board.check_availability(boat_overlap)).to be_true
    end

    it "returns false when boat can't be placed" do
      board.place(boat_1)
      expect(board.check_availability(boat_overlap)).to be_false
    end

    it 'creates 4 boats' do
      expect(board.boats.count).to eq 4
    end

    it 'places 4 boats' do
      board.stub(:check_availability).and_return(true)
      board.place_all(board.boats)
    end

  end

end




# - an 'o' denotes a shot in the water
# - an 'x' denotes a hit on a ship
# - an 's' denotes a ship
