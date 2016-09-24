class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])
    @questions = @game.questions
    @question = @questions[0]
    @result = Result.new
  end

end
