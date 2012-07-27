class Group < ActiveRecord::Base

  has_many :users

  def captain
    self.users.where(site_role: "captain").first
  end

end
