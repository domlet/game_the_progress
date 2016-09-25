class QuestionsController < ApplicationController

  def update
    p "We hit the route!!!"
    p params
    p @game = Game.find(params[:question][:game_id])
    p @questions = @game.questions
    p current_question = Question.find(params[:question][:question_id].to_i)
    current_index = @questions.find_index(current_question)
    @question = @questions[current_index + 1]
    ActionCable.server.broadcast 'questions',
      answer_options: @question.answers,
      question_text: @question.text
    head :ok
  end

end
