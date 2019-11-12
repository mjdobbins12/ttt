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
	
	it 'responds to upper corner opening with center' do
		@spg.move(0)
		expect(@spg.board[4]).to eq("Y")
	end
end