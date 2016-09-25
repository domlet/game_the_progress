class ImportedGamesController < ApplicationController
  def import
    ImportedGame.import(params[:file])
    redirect_to root_url, notice: "ImportedGames imported."
  end

  def index
  end
end
