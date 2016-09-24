class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:id])
  end
end
