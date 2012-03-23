class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :desc
      t.string :type
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :author_id

      t.timestamps
    end
  end
end
