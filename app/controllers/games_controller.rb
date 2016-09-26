class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    p @game = Game.find_by(id: params[:id])
    p @questions = Question.where(game_id: @game.id)
    p @question = @questions[0] # starts at 0 but is updated dynamically
    p @result = Result.new # prevents errors
  end

end
