namespace :seeding do
  desc "Seeding users"

  task :seed => :environment do

  User.create(:email => "hihi2@hihi.com", :password => 'qwerasdf', :password_confirmation => "qwerasdf", :username => 'hihi2guy', :location => 'Hong Kong', :avatar => File.open('/Users/clementchoi86/Websites/thegameexchange/app/assets/images/avatar9.png'))

  # creates default posts linked to a user_id
  UserGame.create(game_id: 4022, wantgive: 'w', condition: 3, user_id: 7)

  UserGame.create(game_id: 4122, wantgive: 'g', condition: 4, user_id: 7)



  end
end