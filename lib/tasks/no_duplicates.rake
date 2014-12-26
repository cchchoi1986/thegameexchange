namespace :no_duplicates do
  desc "destroys duplicates in database"

  task :searchanddestroyduplicates => :environment do

    dbindex = 1

    while dbindex < Game.all.length do
      if Game.where({pax: Game.find(dbindex).pax}).length > 1
        puts dbindex
        dbindex+=1
      end
      dbindex+=1
    end

  end
end