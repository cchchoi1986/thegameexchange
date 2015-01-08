class Offer < ActiveRecord::Base
  has_many :users
  has_many :games
  serialize :send_games, Array
  serialize :receive_games, Array
end
