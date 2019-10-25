require 'game'
require 'computer_player'

class SinglePlayerGame < Game
  def initialize(player1)
    @player1 = player1
    @player2 = new InvincibleComputerPlayer(player1.sign.succ)
    @board = [
      0, 1, 2,
      3, 4, 5,
      6, 7, 8
    ]
    @complete = false
    @victor = nil
  end

  def move(square)
    unless complete?
      @board.map! { |x| x == square ? @player1.sign : x }
      check_victory_conditions
      computer_move
    end
  end

  def computer_move
    if @board[4] == @player1.sign
      @board[0] = @player2.sign
    else @board[4] = @player2.sign
    end
  end
end
