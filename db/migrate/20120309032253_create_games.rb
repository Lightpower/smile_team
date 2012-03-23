class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :event_id
      t.integer :format_id
      t.integer :number
      t.text :legend
      t.text :prequel
      t.integer :price
      t.string :area
      t.string :brief_place
      t.string :team_list
      t.string :dopy_list

      t.timestamps
    end
    add_index :games, :event_id, :unique => true

  end
end
