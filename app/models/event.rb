class Event < ActiveRecord::Base

  belongs_to :user, foreign_key: :author_id
  has_one :game

end
