class AddLinksToEvents < ActiveRecord::Migration
  def change
    change_table(:games) do |t|
      t.string :link_to_site
      t.string :link_to_forum
    end
  end
end
