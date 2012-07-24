class Event < ActiveRecord::Base

  has_one :game
  belongs_to :author, foreign_key: :author_id, class_name: "User"

  validates_presence_of :author

  accepts_nested_attributes_for :game

  class << self
    def in_future
      self.where("start_date >= ?", Date.today)
    end

  end

  def type
    if self.game.present?
      "Game"
    else
      "Unknown"
    end
  end


end
