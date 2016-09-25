class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    p result = Result.new(result_params)
    # Conveys the answer that the student selected
    p "*" * 50
    p result.student_answer_id = 1
    p result
    p "*" * 50
    if result.save
      p "Result was saved"
      # test seed data
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
