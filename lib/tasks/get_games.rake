namespace :get_games do
  desc "Scraping Games"

  task :scrape => :environment do

   # puts "hihi"
    require 'open-uri'
    require 'nokogiri'

    
    ind = 0
    
    tot_items = ind +1
    
    games_array = []


    # doc.css('//item').each do |game|
    #   ng = Hash.new
    #   ng["pax"] = game.css('pax').text
    #   ng["price"] = game.css('price').text
    #   ng["name"] = game.css('name').text
    #   ng["release_date"] = game.css('release_date').text
    #   ng["compatible"] = game.css('compatible').text
    #   ng["version"] = game.css('version').text
    #   ng["encoding"] = game.css('encoding').text
    #   ng["genre"] = game.css('genre').text
    #   ng["url"] = game.css('url').text
    #   ng["image"] = game.css('image').text
    #   ng["manufacturer"] = game.css('manufacturer').text
    #   # puts ng
    #   array.push(ng)
    # end


    while ind < tot_items do
      # puts data
      require_uri = 'http://www.play-asia.com/__api__.php?'
      require_query = 'query=listing&user=147&key=4ffdbb38a2fac2b68f5a804b37353c1e&mask=prnilgvecb&type=1&results=500&compatible=4&start='+ind.to_s
      url = "#{require_uri}#{require_query}"
      data = open(url).read
      doc = Nokogiri::XML(data)

      tot_items = doc.css('total_items').text.to_i
      index_diff = tot_items - ind
      puts index_diff

      doc.css('//item').each do |game|
        ng = Hash.new
        ng["pax"] = game.css('pax').text
        ng["price"] = game.css('price').text
        ng["name"] = game.css('name').text
        ng["release_date"] = game.css('release_date').text
        ng["compatible"] = game.css('compatible').text
        ng["version"] = game.css('version').text
        ng["encoding"] = game.css('encoding').text
        ng["genre"] = game.css('genre').text
        ng["url"] = game.css('url').text
        ng["image"] = game.css('image').text
        ng["manufacturer"] = game.css('manufacturer').text
        # puts ng
        games_array.push(ng)
      end
      
      if tot_items - ind < 500
        ind+=index_diff
      else
        ind+=500
      end
    end

    array_ind = 0

    while array_ind < games_array.length do
      Game.create(games_array[array_ind])
      array_ind+=1
    end

  end
end

# done: xbox360, xbox one, xbox, wii U(2), nintendo wii, playstation, playstation 2, playstation 4(2). nintendo 64