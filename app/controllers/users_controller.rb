class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy, :index]

  def show
    @user = User.find(params[:id])
    @wanted_game = UserGame.where({user_id: current_user, wantgive: "w"})
    @given_game = UserGame.where({user_id: current_user, wantgive: "g"})
  end

  def index
    redirect_to user_path(current_user)
  end
end
