class AddAndChangeColumn < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    change_column :users, :avatar_id, :string
  end
end
