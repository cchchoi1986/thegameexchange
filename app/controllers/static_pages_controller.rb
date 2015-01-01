class StaticPagesController < ApplicationController
  def index
    @games = Game.all
    # @user_games = UserGame.all
    # @given_games = @user_games.where({wantgive: 'g'})

    @given_games = Game.includes(:user_games).where.not(:user_games => {:game_id=>nil, :wantgive=>'w'})
    @test = @given_games
    @wanted_games = Game.includes(:user_games).where.not(:user_games => {:game_id=>nil, :wantgive=>'g'})
    # @given_games = @user_games.where({wantgive: 'g'})
    # @wanted_games = @user_games.where({wantgive: 'w'})

    # @give_count = @given_games.group(:game_id).count

    # puts '>>>>>>>>>', @given_games.group(:game)
    # puts '>>>>>>>>>', @given_games.group(:game).count
    # puts '>>>>>>>>>', @given_games.group(:game).count.count
  end
end
