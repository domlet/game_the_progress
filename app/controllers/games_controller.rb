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

    if @game.save
      10.times do 
        Question.create(game_id: @game.id)
      end
      @game.questions.each do |question|
        Answer.create(question_id: question.id)
        Answer.create(question_id: question.id)
        Answer.create(question_id: question.id)
        Answer.create(question_id: question.id)
      end
    
    @game.questions[0].text = params[:question1]
      @game.questions[0].answers[0].text = params[:answer1]
      
      p @game.questions[0].answers[1].text

      @game.questions[0].answers[1].text = params[:answer2]
      @game.questions[0].answers[2].text = params[:answer3]
      @game.questions[0].answers[3].text = params[:answer4]
    @game.questions[1].text = params[:question2]
      @game.questions[1].answers[0].text = params[:answer5]
      @game.questions[1].answers[1].text = params[:answer6]
      @game.questions[1].answers[2].text = params[:answer7]
      @game.questions[1].answers[3].text = params[:answer8]
    @game.questions[2].text = params[:question3]
      @game.questions[2].answers[0].text = params[:answer9]
      @game.questions[2].answers[1].text = params[:answer10]
      @game.questions[2].answers[2].text = params[:answer11]
      @game.questions[2].answers[3].text = params[:answer12]
    @game.questions[3].text = params[:question4]
      @game.questions[3].answers[0].text = params[:answer13]
      @game.questions[3].answers[1].text = params[:answer14]
      @game.questions[3].answers[2].text = params[:answer15]
      @game.questions[3].answers[3].text = params[:answer16]
    @game.questions[4].text = params[:question5]
      @game.questions[4].answers[0].text = params[:answer17]
      @game.questions[4].answers[1].text = params[:answer18]
      @game.questions[4].answers[2].text = params[:answer19]
      @game.questions[4].answers[3].text = params[:answer20]  
    @game.questions[5].text = params[:question6]
      @game.questions[5].answers[0].text = params[:answer21]
      @game.questions[5].answers[1].text = params[:answer22]
      @game.questions[5].answers[2].text = params[:answer23]
      @game.questions[5].answers[3].text = params[:answer24]
    @game.questions[6].text = params[:question7]
      @game.questions[6].answers[0].text = params[:answer25]
      @game.questions[6].answers[1].text = params[:answer26]
      @game.questions[6].answers[2].text = params[:answer27]
      @game.questions[6].answers[3].text = params[:answer28]
    @game.questions[7].text = params[:question8]
      @game.questions[7].answers[0].text = params[:answer29]
      @game.questions[7].answers[1].text = params[:answer30]
      @game.questions[7].answers[2].text = params[:answer31]
      @game.questions[7].answers[3].text = params[:answer32]
    @game.questions[8].text = params[:question9]
      @game.questions[8].answers[0].text = params[:answer33]
      @game.questions[8].answers[1].text = params[:answer34]
      @game.questions[8].answers[2].text = params[:answer35]
      @game.questions[8].answers[3].text = params[:answer36]
    @game.questions[9].text = params[:question10]
      @game.questions[9].answers[0].text = params[:answer37]
      @game.questions[9].answers[1].text = params[:answer38]
      @game.questions[9].answers[2].text = params[:answer39]
      @game.questions[9].answers[3].text = params[:answer40]
    end
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


end
