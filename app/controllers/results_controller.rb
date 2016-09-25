class ResultsController < ApplicationController

  def index
  end

  def new
    @result = Result.new
  end

  def create
    p current_question = Question.find(params[:result][:question_id].to_i)
    p @game = Game.find(current_question.game_id)
    p @questions = @game.questions
    current_index = @questions.find_index(current_question)
    @question = @questions[current_index + 1]
    # current_question_id = params[:result][:question_id]
    # @question = Question.find(params[:result][:question_id] + 1)
    result = Result.new(result_params)
    p params
    result = Result.new(result_params)
    result.student_answer_id = case params[:commit]
      when "A" then @question.answers[0].id
      when "B" then @question.answers[1].id
      when "C" then @question.answers[2].id
    end
    p "******************************************"
    p result
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
