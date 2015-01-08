class GamesController < ApplicationController
  # respond_to :json
  # def all_games
  #   games = Game.all
  #   respond_with games
  # end
  def search
    search_term = params[:q]
    # @results = Game.all
    # for i in 0..array.length
    #   @results = @results.where('name like ?', "%"+array[i]+"%")
    # end

    @results = Game.where('name like ?', "%"+search_term+"%")
    # @results = Game.where('name like ?', "%call%").where('name like ?', "%duty: Black Ops%").where(version: "Asia").where(compatible: "Xbox360 (360)")
  end
  
  def show
    @game = Game.find(params[:id])
    @listwantedusers = User.includes(:user_games).where(:user_games => {:game_id=>params[:id], :wantgive=>'w'})
    @listgivenusers = User.includes(:user_games).where(:user_games => {:game_id=>params[:id], :wantgive=>'g'})
    @user_games = UserGame.new
    # render json: @game
  end

  def add_to_trades
    @game = Game.find(params[:id])
    render json: @game
  end

end
