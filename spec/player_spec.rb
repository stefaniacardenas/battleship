require 'player'

describe Player do

	let(:player) { Player.new("TestPerson") }

	it 'returns true for ships still floating' do
		expect(player.has_ships_still_floating?).to be_true
	end

	xit 'registers'
end