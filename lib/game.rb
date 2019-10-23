require 'player'

class Game
  attr_reader :player1, :player2, :turn, :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = @player1
    @board = [
      [0,0], [0,1], [0,2],
      [1,0], [1,1], [1,2],
      [2,0], [2,1], [2,2]
    ]
  end

  def move
    change_turns
  end

  private

  def change_turns
    if @turn == @player1
      @turn = @player2
    else @turn = @player1
    end
  end
end
