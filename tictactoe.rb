class AI
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def initialize(ai_marker, human_marker)
    @ai_marker = ai_marker
    @human_marker = human_marker
  end

  def best_move(board)
    best_score = -Float::INFINITY
    move = nil

    board.each_with_index do |spot, index|
      next unless spot == ' '
      board[index] = @ai_marker
      score = minimax(board, false)
      board[index] = ' '
      if score > best_score
        best_score = score
        move = index
      end
    end
    move
  end

  private

  def minimax(board, is_maximizing)
    winner = check_winner(board)
    return score(winner) if winner

    if is_maximizing
      best_score = -Float::INFINITY
      board.each_with_index do |spot, index|
        next unless spot == ' '
        board[index] = @ai_marker
        score = minimax(board, false)
        board[index] = ' '
        best_score = [score, best_score].max
      end
      best_score
    else
      best_score = Float::INFINITY
      board.each_with_index do |spot, index|
        next unless spot == ' '
        board[index] = @human_marker
        score = minimax(board, true)
        board[index] = ' '
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

  def check_winner(board)
    WIN_COMBINATIONS.each do |combo|
      spots = combo.map { |i| board[i] }
      if spots.all? { |s| s == @ai_marker }
        return @ai_marker
      elsif spots.all? { |s| s == @human_marker }
        return @human_marker
      end
    end
    return 'draw' if board.none? { |s| s == ' ' }
    nil
  end
end
