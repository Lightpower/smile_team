class Event < ActiveRecord::Base

  has_one :game
  belongs_to :author, foreign_key: :author_id, class_name: "User"

  class << self
    def in_future
      self.where("start_date >= ?", Date.today)
    end

  end


end
