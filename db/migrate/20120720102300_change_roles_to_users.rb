class ChangeRolesToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :role, :site_role
    add_column :users, :team_role, :string
  end
end
