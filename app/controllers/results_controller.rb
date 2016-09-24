class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    result = Result.new(result_params)
    # result.user = current_user
    p result_params
    p params
    if result.save
      p "It works!!!"
      # This is just for testing the seed data
      ActionCable.server.broadcast 'results',
        game: result.game_id,
        user: result.user_id
      head :ok
    else
      redirect_to games_path
    end
  end


  private

    def result_params
      params.require(:result).permit(:user_id, :game_id, :question_id)
    end
end
