class GamesController < ApplicationController

  def index
    if current_user == nil
      redirect_to new_user_session_path
    else
      @games = Game.all
    end
  end

  def new
    @categories = Category.all
    @game = Game.new
  
    # @categories = Category.all
    # @game = Game.new
    # @question1 = Question.new
    # @answer1 = Answer.new
    # @answer2 = Answer.new
    # @answer3 = Answer.new
    # @answer4 = Answer.new
    # @question2 = Question.new
    # @answer5 = Answer.new
    # @answer6 = Answer.new
    # @answer7 = Answer.new
    # @answer8 = Answer.new
    # @question3 = Question.new
    # @answer9 = Answer.new
    # @answer10 = Answer.new
    # @answer11 = Answer.new
    # @answer12 = Answer.new
    # @question4 = Question.new
    # @answer13 = Answer.new
    # @answer14 = Answer.new
    # @answer15 = Answer.new
    # @answer16 = Answer.new
    # @question5 = Question.new
    # @answer17 = Answer.new
    # @answer18 = Answer.new
    # @answer19 = Answer.new
    # @answer20 = Answer.new
    # @question6 = Question.new
    # @answer21 = Answer.new
    # @answer22 = Answer.new
    # @answer23 = Answer.new
    # @answer24 = Answer.new
    # @question7 = Question.new
    # @answer25 = Answer.new
    # @answer26 = Answer.new
    # @answer27 = Answer.new
    # @answer28 = Answer.new
    # @question8 = Question.new
    # @answer29 = Answer.new
    # @answer30 = Answer.new
    # @answer31 = Answer.new
    # @answer32 = Answer.new
    # @question9 = Question.new
    # @answer33 = Answer.new
    # @answer34 = Answer.new
    # @answer35 = Answer.new
    # @answer36 = Answer.new
    # @question10 = Question.new
    # @answer37 = Answer.new
    # @answer38 = Answer.new
    # @answer39 = Answer.new
    # @answer40 = Answer.new
  end

  def create
    @game = Game.new(result_params)
    p "---------- params ============================= "
    p params
    p "---------- params answer 1 ============================= "
    p params[:answer1]
    p params[:question1]

    if @game.save
      q1 = Question.new(game_id: @game.id, text: params[:question1], category_id: 1)
      q1.save
      a1 = Answer.new(question_id: q1.id, text: params[:answer4])
      a1.save
      a2 = Answer.new(question_id: q1.id, text: params[:answer2])
      a2.save
      a3 = Answer.new(question_id: q1.id, text: params[:answer3])
      a3.save
      a4 = Answer.new(question_id: q1.id, text: params[:answer1])
      a4.save
      q1.write_attribute(:correct_answer_id, a4.id)
      q1.save
      # q1.update_attribute(update_q1)
      # q1.correct_answer_id = a4.id
      # q1.update

      q2 = Question.new(game_id: @game.id, text: params[:question2], category_id: 1)
      q2.save
      a1 = Answer.new(question_id: q2.id, text: params[:answer7])
      a1.save
      a2 = Answer.new(question_id: q2.id, text: params[:answer6])
      a2.save
      a3 = Answer.new(question_id: q2.id, text: params[:answer5])
      a3.save
      a4 = Answer.new(question_id: q2.id, text: params[:answer8])
      a4.save
      q2.write_attribute(:correct_answer_id, a3.id)
      q2.save

      q3 = Question.new(game_id: @game.id, text: params[:question3])
      q3.save
      a1 = Answer.new(question_id: q3.id, text: params[:answer9])
      a1.save
      a2 = Answer.new(question_id: q3.id, text: params[:answer10])
      a2.save
      a3 = Answer.new(question_id: q3.id, text: params[:answer12])
      a3.save
      a4 = Answer.new(question_id: q3.id, text: params[:answer11])
      a4.save
      q3.write_attribute(:correct_answer_id, a1.id)
      q3.save

      q4 = Question.new(game_id: @game.id, text: params[:question4])
      q4.save
      a1 = Answer.new(question_id: q4.id, text: params[:answer16])
      a1.save
      a2 = Answer.new(question_id: q4.id, text: params[:answer14])
      a2.save
      a3 = Answer.new(question_id: q4.id, text: params[:answer13])
      a3.save
      a4 = Answer.new(question_id: q4.id, text: params[:answer15])
      a4.save
      q4.write_attribute(:correct_answer_id, a3.id)
      q4.save

      q5 = Question.new(game_id: @game.id, text: params[:question5])
      q5.save
      a1 = Answer.new(question_id: q5.id, text: params[:answer20])
      a1.save
      a2 = Answer.new(question_id: q5.id, text: params[:answer19])
      a2.save
      a3 = Answer.new(question_id: q5.id, text: params[:answer18])
      a3.save
      a4 = Answer.new(question_id: q5.id, text: params[:answer17])
      a4.save
      q5.write_attribute(:correct_answer_id, a4.id)
      q5.save


      q6 = Question.new(game_id: @game.id, text: params[:question6])
      q6.save
      a1 = Answer.new(question_id: q6.id, text: params[:answer21])
      a1.save
      a2 = Answer.new(question_id: q6.id, text: params[:answer22])
      a2.save
      a3 = Answer.new(question_id: q6.id, text: params[:answer24])
      a3.save
      a4 = Answer.new(question_id: q6.id, text: params[:answer23])
      a4.save
      q6.write_attribute(:correct_answer_id, a1.id)
      q6.save

      q7 = Question.new(game_id: @game.id, text: params[:question7])
      q7.save
      a1 = Answer.new(question_id: q7.id, text: params[:answer26])
      a1.save
      a2 = Answer.new(question_id: q7.id, text: params[:answer25])
      a2.save
      a3 = Answer.new(question_id: q7.id, text: params[:answer28])
      a3.save
      a4 = Answer.new(question_id: q7.id, text: params[:answer27])
      a4.save
      q7.write_attribute(:correct_answer_id, a2.id)
      q7.save

      q8 = Question.new(game_id: @game.id, text: params[:question8])
      q8.save
      a1 = Answer.new(question_id: q8.id, text: params[:answer30])
      a1.save
      a2 = Answer.new(question_id: q8.id, text: params[:answer29])
      a2.save
      a3 = Answer.new(question_id: q8.id, text: params[:answer31])
      a3.save
      a4 = Answer.new(question_id: q8.id, text: params[:answer32])
      a4.save
      q8.write_attribute(:correct_answer_id, a2.id)
      q8.save

      q9 = Question.new(game_id: @game.id, text: params[:question9])
      q9.save
      a1 = Answer.new(question_id: q9.id, text: params[:answer36])
      a1.save
      a2 = Answer.new(question_id: q9.id, text: params[:answer34])
      a2.save
      a3 = Answer.new(question_id: q9.id, text: params[:answer35])
      a3.save
      a4 = Answer.new(question_id: q9.id, text: params[:answer33])
      a4.save
      q9.write_attribute(:correct_answer_id, a4.id)
      q9.save

      q10 = Question.new(game_id: @game.id, text: params[:question10])
      q10.save
      a1 = Answer.new(question_id: q10.id, text: params[:answer37])
      a1.save
      a2 = Answer.new(question_id: q10.id, text: params[:answer38])
      a2.save
      a3 = Answer.new(question_id: q10.id, text: params[:answer39])
      a3.save
      a4 = Answer.new(question_id: q10.id, text: params[:answer40])
      a4.save
      q10.write_attribute(:correct_answer_id, a1.id)
      q10.save

    end 
    redirect_to games_path

    # if @game.save
    #   10.times do 
    #     Question.new(game_id: @game.id)
    #     Question.new(game_id: @game.id).save
    #   end
    #   @game.questions.each do |question|
    #     Answer.new(question_id: question.id)
    #     Answer.new(question_id: question.id).save
    #     Answer.new(question_id: question.id)
    #     Answer.new(question_id: question.id).save
    #     Answer.new(question_id: question.id)
    #     Answer.new(question_id: question.id).save
    #     Answer.new(question_id: question.id)
    #     Answer.new(question_id: question.id).save
    #   end
    # end
    # @game.questions[0].text = params[:question1]

    #   @game.questions[0].answers[0].update_attribute(:text, params[:answer2])

    #   p "---------- params game questions answers text ============================= "
    #   # @game.questions[0].answers[0].save
    #   # @game.questions[0].answers[0].text = 'crumbs'
    #   p @game.questions[0].answers[0].text

    #   @game.questions[0].answers[1].text = params[:answer2]

    #   @game.questions[0].answers[2].text = params[:answer3]
    #   @game.questions[0].answers[3].text = params[:answer4]
    # @game.questions[1].text = params[:question2]
    #   @game.questions[1].answers[0].text = params[:answer5]
    #   @game.questions[1].answers[1].text = params[:answer6]
    #   @game.questions[1].answers[2].text = params[:answer7]
    #   @game.questions[1].answers[3].text = params[:answer8]
    # @game.questions[2].text = params[:question3]
    #   @game.questions[2].answers[0].text = params[:answer9]
    #   @game.questions[2].answers[1].text = params[:answer10]
    #   @game.questions[2].answers[2].text = params[:answer11]
    #   @game.questions[2].answers[3].text = params[:answer12]
    # @game.questions[3].text = params[:question4]
    #   @game.questions[3].answers[0].text = params[:answer13]
    #   @game.questions[3].answers[1].text = params[:answer14]
    #   @game.questions[3].answers[2].text = params[:answer15]
    #   @game.questions[3].answers[3].text = params[:answer16]
    # @game.questions[4].text = params[:question5]
    #   @game.questions[4].answers[0].text = params[:answer17]
    #   @game.questions[4].answers[1].text = params[:answer18]
    #   @game.questions[4].answers[2].text = params[:answer19]
    #   @game.questions[4].answers[3].text = params[:answer20]  
    # @game.questions[5].text = params[:question6]
    #   @game.questions[5].answers[0].text = params[:answer21]
    #   @game.questions[5].answers[1].text = params[:answer22]
    #   @game.questions[5].answers[2].text = params[:answer23]
    #   @game.questions[5].answers[3].text = params[:answer24]
    # @game.questions[6].text = params[:question7]
    #   @game.questions[6].answers[0].text = params[:answer25]
    #   @game.questions[6].answers[1].text = params[:answer26]
    #   @game.questions[6].answers[2].text = params[:answer27]
    #   @game.questions[6].answers[3].text = params[:answer28]
    # @game.questions[7].text = params[:question8]
    #   @game.questions[7].answers[0].text = params[:answer29]
    #   @game.questions[7].answers[1].text = params[:answer30]
    #   @game.questions[7].answers[2].text = params[:answer31]
    #   @game.questions[7].answers[3].text = params[:answer32]
    # @game.questions[8].text = params[:question9]
    #   @game.questions[8].answers[0].text = params[:answer33]
    #   @game.questions[8].answers[1].text = params[:answer34]
    #   @game.questions[8].answers[2].text = params[:answer35]
    #   @game.questions[8].answers[3].text = params[:answer36]
    # @game.questions[9].text = params[:question10]
    #   @game.questions[9].answers[0].text = params[:answer37]
    #   @game.questions[9].answers[1].text = params[:answer38]
    #   @game.questions[9].answers[2].text = params[:answer39]
    #   @game.questions[9].answers[3].text = params[:answer40]
    
  end



  # The show page accesses the Questions controller and Answers controller...
  # ...and those controllers use the games.js listener (for Action Cable)
  def show
    if current_user
      p "in games controller"
      p params
      @game = Game.find_by(id: params[:id])
      @questions = Question.where(game_id: @game.id)
      @question = @questions[0] # starts at 0 but is updated dynamically
      @result = Result.new # prevents errors
    else
      redirect_to new_user_session_path
    end
  end

  private
  
  def result_params
    params.require(:game).permit(:title, :subject)
  end

  def update_q1
    params.require(:question).permit(:text, :game_id, :correct_answer_id)
  end

end
