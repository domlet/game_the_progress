class GamesController < ApplicationController

  def index
    if current_user == nil
      redirect_to new_user_session_path
    else
      @games = Game.all
    end
  end

  def create

  end

  def new
    @categories = Category.all
    @game = Game.new
    @question1 = Question.new
    @answer1 = Answer.new
    @answer2 = Answer.new
    @answer3 = Answer.new
    @answer4 = Answer.new
    @question2 = Question.new
    @answer5 = Answer.new
    @answer6 = Answer.new
    @answer7 = Answer.new
    @answer8 = Answer.new
    @question3 = Question.new
    @answer9 = Answer.new
    @answer10 = Answer.new
    @answer11 = Answer.new
    @answer12 = Answer.new
    @question4 = Question.new
    @answer13 = Answer.new
    @answer14 = Answer.new
    @answer15 = Answer.new
    @answer16 = Answer.new
    @question5 = Question.new
    @answer17 = Answer.new
    @answer18 = Answer.new
    @answer19 = Answer.new
    @answer20 = Answer.new
    @question6 = Question.new
    @answer21 = Answer.new
    @answer22 = Answer.new
    @answer23 = Answer.new
    @answer24 = Answer.new
    @question7 = Question.new
    @answer25 = Answer.new
    @answer26 = Answer.new
    @answer27 = Answer.new
    @answer28 = Answer.new
    @question8 = Question.new
    @answer29 = Answer.new
    @answer30 = Answer.new
    @answer31 = Answer.new
    @answer32 = Answer.new
    @question9 = Question.new
    @answer33 = Answer.new
    @answer34 = Answer.new
    @answer35 = Answer.new
    @answer36 = Answer.new
    @question10 = Question.new
    @answer37 = Answer.new
    @answer38 = Answer.new
    @answer39 = Answer.new
    @answer40 = Answer.new
    
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

end
