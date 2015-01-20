namespace :seeding do
  desc "Seeding users"

  task :seed => :environment do

  User.create(
    :email => "cchchoi1986@gmail.com", 
    :password => 'qwerasdf', 
    :password_confirmation => "qwerasdf", 
    :username => 'bigbro801', 
    :location => 'Hong Kong'
    )

  # creates default posts linked to a user_id
  games_on_list = 30

  games_on_list.each do |f|
    UserGame.create(game_id: 1022, wantgive: 'w', condition: 3, user_id: 2)

  UserGame.create(game_id: 3132, wantgive: 'g', condition: 4, user_id: 2)

  UserGame.create(game_id: 2112, wantgive: 'g', condition: 4, user_id: 2)

  end
end

# , :avatar => File.open('/Users/clementchoi86/Websites/thegameexchange/app/assets/images/avatar8.png')