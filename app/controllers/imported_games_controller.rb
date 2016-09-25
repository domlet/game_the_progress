class ImportedGamesController < ApplicationController
  def import
    s = Roo::CSV.new("./public/spreadsheets/test.csv")
    p "*" * 50
    p s
    p s.cell(1, 1)
    p "*" * 50
    # p ImportedGame.import(params[:file])
    redirect_to root_url, notice: "ImportedGames imported."
  end

  def index
  end




end
