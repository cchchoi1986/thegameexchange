class AddUsername < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :avatar_id, :integer
  end
end
