require './lib/game'
require './lib/player'

describe Game do
  before(:each) do
    p1 = Player.new("Xavier", "X")
    p2 = Player.new("Oscar", "O")
    @game = Game.new(p1, p2)
  end

  it 'has two players' do
    expect(@game.player1).to be_instance_of(Player)
    expect(@game.player2).to be_instance_of(Player)
  end

  it 'alternates between player moves' do
    expect(@game.turn).to eq(@game.player1)
    @game.move
    expect(@game.turn).to eq(@game.player2)
  end
end
