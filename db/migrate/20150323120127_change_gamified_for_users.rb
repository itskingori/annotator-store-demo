class ChangeGamifiedForUsers < ActiveRecord::Migration
  def change
    User.update_all gamified: false
    change_column :users, :gamified, :boolean, null: false
  end
end
