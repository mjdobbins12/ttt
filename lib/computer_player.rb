require 'player'

class InvincibleComputerPlayer < Player
  attr_reader :name, :sign

  def initialize(sign)
    @name = "ICP"
    @sign = sign
  end
end
