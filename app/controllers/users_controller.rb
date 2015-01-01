class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy, :index]

  def show
    @user = User.find(params[:id])
    @comments = Comment.where({wall_id: params[:id]})
    @wanted_game = UserGame.where({user_id: params[:id], wantgive: "w"})
    @given_game = UserGame.where({user_id: params[:id], wantgive: "g"})
    @comment = Comment.new
  end

  def search
    @games_users_w = User.includes(:user_games).where.not(:user_games => {:user_id=>nil, :wantgive=>'w'})
  end

  def index
    redirect_to user_path(current_user)
  end
end
