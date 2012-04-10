class RenameTwitterNicknameToNickname < ActiveRecord::Migration
  def up
    rename_column :users, :twitter_nickname, :nickname
  end

  def down
    rename_column :users, :nickname, :twitter_nickname
  end
end
