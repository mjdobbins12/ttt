require './lib/game'
require './lib/player'
require 'victory_conditions_helper'

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
    @game.move(0)
    expect(@game.turn).to eq(@game.player2)
  end

  it 'allows players to put their sign on an unclaimed square' do
    @game.move(0)
    expect(@game.board[0]).to eq(@game.player1.sign)
  end

  it 'awards a victory if a player claims all the fields in one row' do
    row_victory
    expect(@game.victor).to eq(@game.player1)
    expect(@game.complete?).to eq(true)
  end

  it 'awards a victory if a player claims all the fields in one row' do
    row_vic_two
    expect(@game.victor).to eq(@game.player1)
    expect(@game.complete?).to eq(true)
  end
end
