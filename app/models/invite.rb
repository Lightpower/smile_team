class Invite < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  ##
  #  Possible values for invite state
  #
  STATES = {sent: "sent", read: "read", pending: "pending", rejected: "rejected", accepted: "accepted"}

  ##
  # Accepting current invite
  #
  def accept
    self.state = STATES[:accepted]
    self.save
  end

  ##
  # Rejecting current invite
  #
  def reject
    self.state = STATES[:rejected]
    self.save
  end

  ##
  # Pending current invite
  #
  def pend
    self.state = STATES[:pending]
    self.save
  end
end
