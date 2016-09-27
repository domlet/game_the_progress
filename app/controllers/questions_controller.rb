class QuestionsController < ApplicationController

  def update
    p "We hit the update route!!!"
    p params
    p "*" * 50
    @game = Game.find(params[:id])
    # Find the id of button that was clicked
    current_question_id = (params.key('hidden-thing')).to_i
    @question = Question.find(current_question_id)

    # This is publisher (sends stuff out)
    # Triggered when 'next' button is clicked
    ActionCable.server.broadcast "game-#{@question.game_id}:questions",
        answer_options: @question.answers,
        question_text: @question.text,
        question_id: @question.id
    head :ok
  end

end



    # current_index = @questions.find_index(current_question)

    # # Enables first question to be answered
    # if current_index == 0
    #   @question = @questions[current_index]
    # else
    #   @question = @questions[current_index + 1]
    # end
