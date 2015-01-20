class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :pax
      t.string :price
      t.string :name
      t.string :release_date
      t.string :compatible
      t.string :version
      t.string :encoding
      t.string :genre
      t.string :url
      t.string :image
      t.string :manufacturer

      t.timestamps
    end
  end
end
