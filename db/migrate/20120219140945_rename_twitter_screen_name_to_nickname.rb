class RenameTwitterScreenNameToNickname < ActiveRecord::Migration
  def up
    rename_column :users, :twitter_screen_name, :twitter_nickname
  end

  def down
    rename_column :users, :twitter_nickname, :twitter_screen_name
  end
end
