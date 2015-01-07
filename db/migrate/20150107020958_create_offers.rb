class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :send_id
      t.integer :received_id
      t.text :send_games
      t.text :receive_games
      t.string :status
      t.timestamps
    end
  end
end
