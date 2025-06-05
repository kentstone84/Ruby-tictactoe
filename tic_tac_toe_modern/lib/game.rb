# lib/game.rb
require_relative 'board'
require_relative 'player'
require_relative 'ai'

class Game
  def initialize
    @board = Board.new
    @human = HumanPlayer.new("X")
    @computer = ComputerPlayer.new("O", "X")
    @current_player = @human
  end

  def play
    until @board.winner || @board.draw?
      @board.display
      index = @current_player.move(@board)
      if @board.valid_move?(index)
        @board.update_cell(index, @current_player.marker)
        switch_player
      else
        puts "Invalid move. Try again."
      end
    end

    @board.display
    if @board.winner
      puts "Winner: #{@board.winner}"
    else
      puts "It's a draw!"
    end
  end

  private

  def switch_player
    @current_player = (@current_player == @human) ? @computer : @human
  end
end
