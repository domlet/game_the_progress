class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    p params
    # TODO: Add Flash notice
    # if Result.where("question_id = ? AND user_id = ?", params[:result][:question_id], params[:result][:user_id])
    #   flash[:notice] = "You have already submitted one answer." # TODO: ajax this
    #   p "been there, done that"
    #   return
    # end
    p "*" * 50
    # This will look incomplete until add'l params added
    p result = Result.new(result_params) # Doing this early to prevent errors

    # Submit the player's answer to the database
    if params.values.include?('a')
      result.student_answer_id = params.key('a')
    elsif params.values.include?('b')
      result.student_answer_id = params.key('b')
    elsif params.values.include?('c')
      result.student_answer_id = params.key('c')
    elsif params.values.include?('d')
      result.student_answer_id = params.key('d')
    end

    # Check if answer is correct
    if result.student_answer_id == Question.find(result.question_id).correct_answer_id
      result.is_correct = true
    else
      result.is_correct = false
    end

    if result.save
      p "Result was saved"
      p result
      p "*" * 50
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
