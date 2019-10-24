require 'game'
require 'computer_player'

class SinglePlayerGame < Game
  def initialize(player1)
    @player1 = player1
    @player2 = new InvincibleComputerPlayer(player1.name.succ)
    @turn = @player1
    @board = [
      0, 1, 2,
      3, 4, 5,
      6, 7, 8
    ]
    @complete = false
    @victor = nil
  end
end
