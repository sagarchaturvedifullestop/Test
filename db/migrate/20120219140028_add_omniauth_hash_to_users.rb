class AddOmniauthHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :omniauth_hash, :text
  end
end
