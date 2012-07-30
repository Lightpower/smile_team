class Event < ActiveRecord::Base

  has_one :game
  belongs_to :author, foreign_key: :author_id, class_name: "User"
  has_many :invites

  validates_presence_of :author

  accepts_nested_attributes_for :game

  class << self
    ##
    # Scope of events which start time is in future
    #
    def in_future
      self.where("start_date >= ?", Date.today)
    end

  end

  ##
  # Group of users which this event created for
  #
  def group
    self.author.group
  end

  ##
  # Create invite on current event for defined user
  #
  def invite(user)
    Invite.create(user_id: user.id, event_id: self.id, state: Invite::STATES[:sent]) if Invite.where(user_id: user.id, event_id: self.id).blank?
  end

  ##
  # Create invites on current event for all users in group
  #
  def invite_all
    self.group.users.each { |user| self.invite(user) }
  end


end
