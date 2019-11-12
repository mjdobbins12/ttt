require 'game'
require 'computer_player'

class SinglePlayerGame < Game
  attr_reader :victory_rows
  
  def initialize(player1)
    @player1 = player1
    @player2 = InvincibleComputerPlayer.new(player1.sign.succ)
    @turn = @player1
    @board = [
      0, 1, 2,
      3, 4, 5,
      6, 7, 8
    ]
    @complete = false
    @victor = nil
    # @victory_rows = [
    #   @board.slice(0..2),
    #   @board.slice(3..5),
    #   @board.slice(6..8),
    #   [@board[0], @board[3], @board[6]],
    #   [@board[1], @board[4], @board[7]],
    #   [@board[2], @board[5], @board[8]],
    #   [@board[0], @board[4], @board[8]],
    #   [@board[2], @board[4], @board[6]]
    # ]
  end

  def move(square)
    unless complete?
      @board.map! { |x| x == square ? @player1.sign : x }
      check_victory_conditions
      change_turns
      computer_move
    end
  end

  def computer_move
    look_for_winning_moves
    check_victory_conditions
    block_player1
    if @board.count(@player2.sign) < @board.count(@player1.sign)
      normal_computer_move
    end
    change_turns
  end
  
  def look_for_winning_moves
    victory_rows = generate_victory_rows
    victory_rows.each do |row|
      if row.count(@player2.sign) == 2
        new_move = row.select{ |x| x != @player2.sign }
        if @board[new_move] != @player1.sign
          @board[new_move[0]] = @player2.sign
          break
        end
      end
    end
  end
  
  def block_player1
    victory_rows = generate_victory_rows
    victory_rows.each do |row|
      if row.count(@player1.sign) == 2
        new_move = row.select{ |x| x != @player1.sign }
        @board[new_move[0]] = @player2.sign
      end
    end
  end
  
  def normal_computer_move
    if @board[4] == 4
      @board[4] = @player2.sign
    elsif @board[0] == 0
      @board[0] = @player2.sign
    end
  end
  
  def generate_victory_rows
    victory_rows = [
      @board.slice(0..2),
      @board.slice(3..5),
      @board.slice(6..8),
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]],
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]]
    ]
    victory_rows
  end
end
