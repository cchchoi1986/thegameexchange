class AddIndexToPaxInGames < ActiveRecord::Migration
  def change
    add_index :games, :pax
  end
end
