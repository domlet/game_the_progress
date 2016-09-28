class UsersController < ApplicationController
  before_action :authenticate_user!

  # Also know that Devise is doing controller stuff

  def new
    @user = User.find(params[:id])
  end

  def show
    @games = Game.all
  end
end
