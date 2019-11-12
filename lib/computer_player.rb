require 'player'

class InvincibleComputerPlayer < Player
  attr_reader :name, :sign

  def initialize(sign)
    @name = "ICP"
    @sign = sign
  end
  
  def move(square)
    unless complete?
      @board.map! { |x| x == square ? @turn.sign : x }
      check_victory_conditions
      change_turns
      icp_move
    end
  end
  
  def icp_move
  end
end
