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
	
	it 'blocks p1 from finishing a column' do
		@spg.move(4)
		@spg.move(1)
		expect(@spg.board[7]).to eq("Y")
	end
	
	it 'blocks p1 from finishing a row' do
		@spg.move(4)
		@spg.move(3)
		expect(@spg.board[5]).to eq("Y")
	end
	
	it 'blocks p1 from finishing a diagonal' do
		@spg.move(4)
		@spg.move(6)
		expect(@spg.board[2]).to eq("Y")
	end
	
	it 'wins when it can' do
		@spg.move(4)
		@spg.move(7)
		@spg.move(8)
		expect(@spg.board[2]).to eq("Y")
		expect(@spg.victor).to eq(@spg.player2)
	end
end