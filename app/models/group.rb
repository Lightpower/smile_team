class Group < ActiveRecord::Base

  has_many :users

  validates_uniqueness_of :name

  def captain
    self.users.where(site_role: "captain").first
  end

  def approve_all
    connection = ActiveRecord::Base.connection()
    connection.execute("update users set site_role='mate' where group_id=#{ActiveRecord::Base.sanitize(self.id)} and (site_role='guest' or site_role is null)")
  end

  def reject_all
    connection = ActiveRecord::Base.connection()
    connection.execute("update users set group_id=null where group_id=#{ActiveRecord::Base.sanitize(self.id)} and (site_role='guest' or site_role is null)")
  end

end
