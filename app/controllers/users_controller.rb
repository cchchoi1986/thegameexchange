class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy, :index]

  def show
    @user = User.find(params[:id])
    @comments = Comment.where({wall_id: params[:id]})
    @ioffers = Offer.where({send_id: params[:id], status: "pending"})
    @youoffers = Offer.where({received_id: params[:id], status: "pending"})
    @iacceptedoffers = Offer.where({send_id: params[:id], status: "Accepted"})
    @youacceptedoffers = Offer.where({received_id: params[:id], status: "Accepted"})
    @ideclinedoffers = Offer.where({send_id: params[:id], status: "Declined"})
    @youdeclinedoffers = Offer.where({received_id: params[:id], status: "Declined"})
    @wanted_game = UserGame.where({user_id: params[:id], wantgive: "w"})
    @given_game = UserGame.where({user_id: params[:id], wantgive: "g"})
    @comment = Comment.new
  end

  def update
    @user = current_user
    @user.update(:avatar => params[:user][:avatar])
    redirect_to :back
  end

  def search
    @games_users_w = User.includes(:user_games).where.not(:user_games => {:user_id=>nil, :wantgive=>'w'})
  end

  def index
    redirect_to user_path(current_user)
  end
end
