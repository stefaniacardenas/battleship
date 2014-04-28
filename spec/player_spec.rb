require 'player'

describe Player do
  let(:opponent_board) {double :board}

	let(:player) { Player.new("TestPerson") }

	it 'returns true for ships still floating' do
		expect(player.has_ships_still_floating?).to be_true
	end

	it "registers a shot on the opponent's board" do
          expect(opponent_board).to receive(:register_shot)
          player.shoot("A1", opponent_board)
        end
end