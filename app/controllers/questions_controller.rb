class QuestionsController < ApplicationController

  def update
    p "We hit the route!!!"
    p params
    p @game = Game.find(params[:question][:game_id])
    p @questions = @game.questions
    p current_question = Question.find(params[:question][:question_id].to_i)
    current_index = @questions.find_index(current_question)
    p current_index

    # Enables first question to be answered
    if current_index == 0
      @question = @questions[current_index]
    else
      @question = @questions[current_index + 1]
    end

    # This is the publisher (sends stuff out):
    ActionCable.server.broadcast 'questions',
    answer_options: @question.answers,
    question_text: @question.text,
    question_id: @question.id
    head :ok
  end

end
