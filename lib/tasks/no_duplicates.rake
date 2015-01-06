namespace :no_duplicates do
  desc "destroys duplicates in database"

  task :searchanddestroyduplicates => :environment do

    dbindex = 1

    Game.all.each do |game|
      if Game.where({pax: game.pax}).length > 1
        puts game.name
      end
    end

  end
end

# Game.all.group(:pax).having("count(*) > 1").each do |g|
#   Game.find(:pax => g.pax).destroy
# end


# Game.all.group(:pax).having("count(*) > 1").count.each do |key, value|
#   Game.find_by_pax(key).destroy
# end