class GamesController < ApplicationController

  def index
    if current_user == nil
      redirect_to new_user_session_path
    else
      @games = Game.all
    end
  end


  # The show page accesses the Questions controller and Answers controller...
  # ...and those controllers use the games.js listener (for Action Cable)
  def show
    if current_user
      p "in games controller"
      p params
      @game = Game.find_by(id: params[:id])
      @questions = Question.where(game_id: @game.id)
      @question = @questions[0] # starts at 0 but is updated dynamically
      @result = Result.new # prevents errors
    else
      redirect_to new_user_session_path
    end
  end

end
