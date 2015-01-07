# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# creates default users
user0 = User.create(:email => "cchchoi1986@gmail.com", :password => 'thisisatest', :password_confirmation => "thisisatest", :username => 'bigbrother801', :location => 'Hong Kong')

user1 = User.create(:email => "user1@none.com", :password => '12345678', :password_confirmation => "12345678", :username => 'littlebro01', :location => 'Singapore')

user2 = User.create(:email => "user2@none.com", :password => '12345678', :password_confirmation => "12345678", :username => 'littlebro02', :location => 'Hong Kong')

user3 = User.create(:email => "user3@none.com", :password => '12345678', :password_confirmation => "12345678", :username => 'littlebro03', :location => 'Arctic Circle')

# creates default posts linked to a user_id
user_game1 = UserGame.create(game_id: 1122, wantgive: 'w', condition: 3, user_id: user1[:id])

user_game2 = UserGame.create(game_id: 1122, wantgive: 'g', condition: 5, user_id: user3[:id])

user_game3 = UserGame.create(game_id: 5132, wantgive: 'w', condition: 3, user_id: user2[:id])

user_game4 = UserGame.create(game_id: 4132, wantgive: 'w', condition: 5, user_id: user2[:id])

user_game5 = UserGame.create(game_id: 2151, wantgive: 'g', condition: 4, user_id: user1[:id])

user_game6 = UserGame.create(game_id: 1542, wantgive: 'g', condition: 5, user_id: user3[:id])

user_game7 = UserGame.create(game_id: 1124, wantgive: 'g', condition: 4, user_id: user3[:id])

user_game8 = UserGame.create(game_id: 251, wantgive: 'g', condition: 4, user_id: user0[:id])

user_game9 = UserGame.create(game_id: 2151, wantgive: 'g', condition: 5, user_id: user0[:id])

user_game10 = UserGame.create(game_id: 1122, wantgive: 'g', condition: 4, user_id: user0[:id])