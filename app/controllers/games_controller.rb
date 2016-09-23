class GamesController < ApplicationController

  def show
    @game = Game.find_by(id: params[:id])
    @results = Result.new
  end

end
