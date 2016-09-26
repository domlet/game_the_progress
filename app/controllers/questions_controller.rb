class QuestionsController < ApplicationController

  def update
    p "We hit the route!!!"
    p params
    p "*" * 50
    @game = Game.find(params[:id])
    @questions = @game.questions
    current_question_id = (params.key('current_question_id')).to_i
    current_question = Question.find(current_question_id)
    current_index = @questions.find_index(current_question)

    # Enables first question to be answered
    if current_index == 0
      @question = @questions[current_index]
    else
      @question = @questions[current_index + 1]
    end

    # This is publisher (sends stuff out)
    # Triggered when 'next' button is clicked
    ActionCable.server.broadcast 'questions',
        answer_options: @question.answers,
        question_text: @question.text,
        question_id: @question.id
    head :ok
  end

end
