
puts board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board
    puts row = ["   " "|" "   " "|" "   "]
    puts separator = "-----------"
    puts row
    puts separator
    puts row
  end


  def display_board(board) 
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

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
endcd 

def turn_count (board)
    counter = 0
    board.each do |spaces|
        if spaces == "X" || turn == "O"
            counter += 1
        end
    end
    counter
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

Play Model One 

def play(board)
    counter = 0
    until counter == 9
        turn(board)
        counter += 1
    end
end 

Play model Two

def play(board) 
    until over?(board)
        turn(board)
    end
    if won?(board)
        puts "Yay! You won #{winner(b  oard)}!"
    elsif draw?(board)
        puts "Tie Game, Try again?"
    end
end
    
#until the game is over
#players will keep taking turns
#plays the first gew turns of the Game
#If there's a winner...
    #Check who won
    #and congratulate them
    #if there's a draw, then print that message

    def turn(board)
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(board, index)
            move(board, index, current_player(board))
            turn(board)
        else
            display_board(board)
        end
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8], # Right column
        [0,4,8], # Left diagonal
        [2,4,6]  # Right diagonal
    ]

parent_array => WIN_COMBINATIONS = [ children_arrays ]
children_arrays => [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] 

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1] # value of board at win_index_1
       position_2 = board[win_index_2] # value of board at win_index_2
       position_3 = board[win_index_3] # value of board at win_index_3
       
       position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    end
end
    
#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) 
#The above code means to return first element (position_1) & make sure the position is taken by X or O

def full?(board)
    board.all? {|i| i == "X" || i == "O"}
end

#Defining what a ties game is 

def draw?(board)
    if !won?(board) && full?(board)
        return true
    elsif !won?(board) && !full?(board)
        return false
    else won?(board)
        return false
    end
end

#If the game is tied or theres a winner, end of game. 

def over?(board)
    if draw?(board) || won?(board) || full?(board)
        return true
    end 
end


#When a winner is made, look for the winning combo, if the player is x, the winner is x, otherwise its O.
    
def winner(board)
    if won?(board)
       return board[won?(board)[0]]
    end
 end