# lib/player.rb
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class HumanPlayer < Player
  def move(board)
    puts "Enter your move (1-9):"
    gets.chomp.to_i - 1
  end
end

class ComputerPlayer < Player
  def initialize(marker, opponent_marker)
    super(marker)
    @ai = AI.new(marker, opponent_marker)
  end

  def move(board)
    @ai.best_move(board)
  end
end
