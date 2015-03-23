class AddGamifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gamified, :boolean
  end
end
