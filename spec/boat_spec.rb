require 'boat'

describe Boat do
	
  context 'creating a boat' do
  	let (:boat) {Boat.new(5)}
  	let (:board) {double :board}

  	it 'boat has a length' do
  		expect(boat.length).to eq 5
  	end

  end
end
#   it "knows the length of a boat"


	#   # it "knows the orientation of a boat"

	#   it "knows boats can not overlap"

	#   it "knows two boats can not be next to each other"
	# end 

