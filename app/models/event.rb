class Event < ActiveRecord::Base

  has_one :game
  belongs_to :author, foreign_key: :author_id, class_name: "User"

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
    Invite.create(user: user, event: self, state: Invite::STATES[:sent]) if Invite.where(user: user, event: self).blank?
  end

  ##
  # Create invites on current event for all users in group
  #
  def invite_all
    self.group.users.each { |user| self.invite(user) }
  end


end
