class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    result = Result.new(result_params)
    # result.user = current_user
    if result.save
      # This is just for testing the seed data
      ActionCable.server.broadcast 'results',
          game: result.game_id,
          user: result.user_id
    else
      redirect_to games_path
    end
  end


  private

    def result_params
      params.require(:result).permit(:user_id, :game_id)
    end
end
