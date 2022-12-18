board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board) 
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
    user_input.to_i - 1
end

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || (board[index] == nil)
        return false
    else
        return true
    end
end

def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
        return true
    end
end

def turn_count (board)
    counter = 0
    board.each do |spaces|
        if spaces == "X" || spaces == "O"
            counter += 1
        end
    end
    counter
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def over?(board)
  won?(board) || draw?(board)
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1] # value of board at win_index_1
       position_2 = board[win_index_2] # value of board at win_index_2
       position_3 = board[win_index_3] # value of board at win_index_3

       if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return win_combination # return the win_combination indexes that won.
       end
    end
    return false
end

def draw?(board)
    full?(board) && !won?(board)
end

def full?(board)
    board.all? do |element|
        element == "X" || element == "O"
    end
end

def winner(board)
    if winning_combination = won?(board)
        board[winning_combination.first]
    end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid
