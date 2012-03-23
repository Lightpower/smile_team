class CreateInvite < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :state
      t.string :email

      t.timestamps
    end
  end
end
