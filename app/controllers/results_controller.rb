class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    result = Result.new(result_params)
    result.student_answer_id = case params[:commit]
    when "A" then 1
    when "B" then 2
    end
    # result.user = current_user

    p result_params
    p params
    if result.save
      p "It works!!!"
      # This is just for testing the seed data
      ActionCable.server.broadcast 'results',
        answer: result.student_answer_id,
        user: current_user.username
      head :ok
    else
      redirect_to games_path
    end
  end


  private

    def result_params
      params.require(:result).permit(:user_id, :question_id)
    end
end
