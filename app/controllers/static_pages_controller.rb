class StaticPagesController < ApplicationController
  def index
    @user_games = UserGame.all
    @wanted_games = @user_games.where({wantgive: 'w'})
    @given_games = @user_games.where({wantgive: 'g'})
  end
end
