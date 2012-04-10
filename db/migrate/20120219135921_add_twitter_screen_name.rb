class AddTwitterScreenName < ActiveRecord::Migration
  def up
    add_column :users, :twitter_screen_name, :string
  end

  def down
    remove_column :users, :twitter_screen_name
  end
end
