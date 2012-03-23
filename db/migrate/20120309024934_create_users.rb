class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :group_id
      t.string :role
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.integer :game_count
      t.integer :scores

      t.timestamps
    end
  end
end
