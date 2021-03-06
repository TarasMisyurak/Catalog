class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :member, :boolean, default: true
  end
end
