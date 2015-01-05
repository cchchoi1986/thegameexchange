class UserGamesController < ApplicationController
  
  def create
    user_game = current_user.user_games.new(user_game_params)
    if user_games.save
      puts "yay"
    else
      puts "nay"
    end
  end

  def destroy
    
  end

  private
    def user_game_params
      params.require(:user_game).permit(:user_id, :game_id, :wantgive, :condition)
    end
end
