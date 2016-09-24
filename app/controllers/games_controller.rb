class GamesController < ApplicationController

  def import
    Game.import(params[:file])
    redirect_to root_url, notice: "Game imported."
  end

end
