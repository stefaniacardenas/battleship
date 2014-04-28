require 'boat'

describe Boat do

	let (:boat) {Boat.new(5)}
  let (:board) {double :board}

  context 'Horizontal boat' do
  	
    before do
      boat.stub(:generate_orientation).and_return(:horizontal)
    end

    it 'has a length' do
  		expect(boat.boat_length).to eq 5
  	end

    it 'generates a starting point' do
      expect(boat.start_point.count).to eq 2
    end

    it 'returns an array with 2 elements as coordinates' do
      expect(boat.boat_coordinates.count).to eq 5
    end
    

  end
end
#   it "knows the length of a boat"


	#   # it "knows the orientation of a boat"

	#   it "knows boats can not overlap"

	#   it "knows two boats can not be next to each other"
	# end 

