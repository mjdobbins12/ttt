require './lib/single_player'

describe SinglePlayerGame do
	before(:each) do
		p1 = Player.new("Xavier", "X")
		@spg = SinglePlayerGame.new(p1)
	end
	
	it 'responds to center square opening with upper corner' do
		@spg.move(4)
		expect(@spg.board[0]).to eq("Y")
	end
end