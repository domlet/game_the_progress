class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    p @game = Game.find_by(id: params[:id])
    p @questions = Question.where(game_id: @game.id)
    p @question = @questions[0]
    p @result = Result.new
  end

end
