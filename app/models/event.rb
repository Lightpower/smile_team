class Event < ActiveRecord::Base

  has_one :game
  belongs_to :user, foreign_key: :author_id

end
