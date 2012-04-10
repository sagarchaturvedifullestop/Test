class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :token
      t.string :name
      t.string :github_username
      t.string :email
      t.string :site_url
      t.string :avatar_url
      t.boolean :admin
      t.string  :uid
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end