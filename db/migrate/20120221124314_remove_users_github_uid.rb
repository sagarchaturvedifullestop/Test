class RemoveUsersGithubUid < ActiveRecord::Migration
  def up
    remove_column :users, :github_uid
  end

  def down
    add_column :users, :github_uid, :string
  end
end
