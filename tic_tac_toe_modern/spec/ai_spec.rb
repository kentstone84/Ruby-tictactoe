# spec/ai_spec.rb
require_relative '../lib/ai'
require_relative '../lib/board'

RSpec.describe AI do
  it "returns the best move to win or block" do
    board = Board.new
    board.update_cell(0, "X")
    board.update_cell(1, "X")
    board.update_cell(4, "O")
    ai = AI.new("X", "O")
    expect(ai.best_move(board)).to eq(2) # Win on [0,1,2]
  end
end
