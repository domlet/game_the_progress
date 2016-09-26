class GamesController < ApplicationController

  def index
    if current_user == nil
      redirect_to new_user_session_path
    else
      @games = Game.all
    end
  end

  def show
    p @game = Game.find_by(id: params[:id])
    p @questions = Question.where(game_id: @game.id)
    p @question = @questions[0] # starts at 0 but is updated dynamically
    p @result = Result.new # prevents errors
  end

end
