class UserGamesController < ApplicationController
  
  def create
    user_game = current_user.user_games.new(post_params)
    if user_games.save
      puts "yay"
    else
      puts "nay"
    end
  end

  def destroy
    
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
