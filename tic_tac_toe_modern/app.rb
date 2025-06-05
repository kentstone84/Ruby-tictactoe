require 'sinatra'
require_relative './lib/board'
require_relative './lib/ai'

enable :sessions

get '/' do
  session[:board] ||= Board.new
  @board = session[:board]
  erb :index
end

post '/move' do
  index = params[:move].to_i
  board = session[:board]
  ai = AI.new("O", "X")

  if board.valid_move?(index)
    board.update_cell(index, "X") # Human move

    unless board.winner || board.draw?
      ai_move = ai.best_move(board)
      board.update_cell(ai_move, "O") if ai_move
    end
  end

  redirect '/'
end

post '/reset' do
  session[:board] = Board.new
  redirect '/'
end
