# lib/board.rb
class Board
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position_taken?(index)
    @cells[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def update_cell(index, marker)
    @cells[index] = marker
  end

  def full?
    @cells.none? { |c| c == " " }
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      spots = combo.map { |i| @cells[i] }
      if spots.uniq.size == 1 && spots.first != " "
        return spots.first
      end
    end
    nil
  end

  def draw?
    full? && winner.nil?
  end

  def cells
    @cells
  end
end
