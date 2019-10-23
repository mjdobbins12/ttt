def row_victory
  @game.move(0)
  @game.move(3)
  @game.move(1)
  @game.move(4)
  @game.move(2)
end

def row_vic_two
  @game.move(3)
  @game.move(1)
  @game.move(4)
  @game.move(0)
  @game.move(5)
end

def column_victory
  @game.move(0)
  @game.move(1)
  @game.move(3)
  @game.move(4)
  @game.move(6)
end

def diagonal_victory
  @game.move(0)
  @game.move(1)
  @game.move(4)
  @game.move(6)
  @game.move(8)
end
