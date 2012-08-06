class CreateEquipsAndCars < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.string :kind
      t.string :desc
      t.string :state, default: "ok"
      t.integer :owner_id
      t.integer :group_id
      t.integer :holder_id
      t.string :comment

      t.timestamps
    end
    add_index :equips, :owner_id
    add_index :equips, :group_id
    add_index :equips, :holder_id


    create_table :cars do |t|
      t.integer :user_id
      t.string :model
      t.string :number
      t.string :state, default: "ok"

      t.timestamps
    end
    add_index :cars, :user_id

  end
end
