class OffersController < ApplicationController
  def index
    @receiver = User.find(params[:id])
    @sender_given_list = UserGame.where({user_id: current_user.id, wantgive: "g"})
    @receiver_given_list = UserGame.where({user_id: params[:id], wantgive: "g"})
  end


end
