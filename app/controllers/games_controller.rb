class GamesController < ApplicationController
  # respond_to :json
  # def all_games
  #   games = Game.all
  #   respond_with games
  # end
  def search
    search_term = params[:q]
    @results = Game.where('name like ?', "%"+search_term+"%")
  end
  
  def show
    @game = Game.find(params[:id])
    @listwantedusers = User.includes(:user_games).where(:user_games => {:game_id=>params[:id], :wantgive=>'w'})
    @listgivenusers = User.includes(:user_games).where(:user_games => {:game_id=>params[:id], :wantgive=>'g'})
    @user_games = UserGame.new
  end


end
