require 'player'

class Game
  attr_reader :player1, :player2, :turn, :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = @player1
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
      @board.map! { |x| x == square ? @turn.sign : x }
      check_victory_conditions
      change_turns
    end
  end

  def complete?
    @complete = true if (@board.uniq.length == 2)
    @complete
  end

  def victor
    @victor
  end

  private

  def change_turns
    if @turn == @player1
      @turn = @player2
    else @turn = @player1
    end
  end

  def check_victory_conditions
    row_victory_conditions
    column_victory_conditions
    diagonal_victory_conditions
  end

  def row_victory_conditions
    row1 = (@board.slice(0..2).all? { |square| square == @turn.sign })
    row2 = (@board.slice(3..5).all? { |square| square == @turn.sign })
    row3 = (@board.slice(6..8).all? { |square| square == @turn.sign })
    if (row1 || row2 || row3)
      win
    end
  end

  def column_victory_conditions
    col1 = (@board.select.with_index{ |val, index| index % 3 == 0 }.all? { |square| square == @turn.sign })
    col2 = (@board.select.with_index{ |val, index| index % 3 == 1 }.all? { |square| square == @turn.sign })
    col3 = (@board.select.with_index{ |val, index| index % 3 == 2 }.all? { |square| square == @turn.sign })
    if (col1 || col2 || col3)
      win
    end
  end

  def diagonal_victory_conditions
    diag1 = ([@board[0], @board[4], @board[8]].all? { |square| square == @turn.sign })
    diag2 = ([@board[2], @board[4], @board[6]].all? { |square| square == @turn.sign })
    if (diag1 || diag2)
      win
    end
  end

  def win
    @victor = @turn
    @complete = true
  end
end
