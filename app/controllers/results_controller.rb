class ResultsController < ApplicationController

  def index
  end

  def show
    p "WHAT DO YOU WANT FROM US!!!!!"
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

  def update
    question = Question.find(params.key("hidden-thing"))
    a_answers = question.results.select do |result|
      result.student_answer_id == question.answers[0].id
    end
    b_answers = question.results.select do |result|
      result.student_answer_id == question.answers[1].id
    end
    c_answers = question.results.select do |result|
      result.student_answer_id == question.answers[2].id
    end
    d_answers = question.results.select do |result|
      result.student_answer_id == question.answers[3].id
    end
    percent_a = a_answers.length.to_f / question.results.length.to_f
    percent_b = b_answers.length.to_f / question.results.length.to_f
    percent_c = c_answers.length.to_f / question.results.length.to_f
    percent_d = d_answers.length.to_f / question.results.length.to_f
    ActionCable.server.broadcast 'class_results',
      percent_a: percent_a * 100,
      percent_b: percent_b * 100,
      percent_c: percent_c * 100,
      percent_d: percent_d * 100
    head :ok

      p percent_a
      p percent_b
      p percent_c
      p percent_d
  end


  private
    def result_params
      params.require(:result).permit(:user_id, :question_id)
    end
end
