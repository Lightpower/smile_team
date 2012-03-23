class CreateProjectFormat < ActiveRecord::Migration
  def change
    create_table :project_formats do |t|
      t.string :name

      t.timestamps
    end
    add_index :project_formats, :name, :unique => true
  end
end
