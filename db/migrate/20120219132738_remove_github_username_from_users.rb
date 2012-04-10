class RemoveGithubUsernameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :github_username
  end

  def down
    add_column :users, :github_username, :string
  end
end
