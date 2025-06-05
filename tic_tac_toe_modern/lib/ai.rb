class AI
  def initialize(ai_marker, human_marker)
    @ai_marker = ai_marker
    @human_marker = human_marker
  end

  def best_move(board)
    best_score = -Float::INFINITY
    move = nil

    board.cells.each_with_index do |cell, index|
      next unless cell == " "
      board.update_cell(index, @ai_marker)
      score = minimax(board, false)
      board.update_cell(index, " ")
      if score > best_score
        best_score = score
        move = index
      end
    end
    move
  end

  private

  def minimax(board, is_maximizing)
    winner = board.winner
    return score(winner) if winner || board.draw?

    if is_maximizing
      best_score = -Float::INFINITY
      board.cells.each_with_index do |cell, index|
        next unless cell == " "
        board.update_cell(index, @ai_marker)
        score = minimax(board, false)
        board.update_cell(index, " ")
        best_score = [score, best_score].max
      end
      best_score
    else
      best_score = Float::INFINITY
      board.cells.each_with_index do |cell, index|
        next unless cell == " "
        board.update_cell(index, @human_marker)
        score = minimax(board, true)
        board.update_cell(index, " ")
        best_score = [score, best_score].min
      end
      best_score
    end
  end

  def score(winner)
    return 10 if winner == @ai_marker
    return -10 if winner == @human_marker
    0
  end
end
