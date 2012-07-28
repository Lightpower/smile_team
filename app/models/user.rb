class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :events, as: :created_events
  has_many :invites
  has_many :events, through: :invites, as: :invited_events

  belongs_to :group

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
      :login, :first_name, :last_name, :birthday, :team_role, :group_id

  # Default scopes, default values (e.g. self.per_page =)
  ROLES = %w'guest mate leader captain admin'
  cattr_reader :per_page
  @@per_page = 20

  class << self
    def unapproved(group)
      if group.blank?
        []
      else
        where("group_id = ? and ((site_role is null) or (site_role=?) )", group.id, "guest")
      end
    end
  end


  def is_admin?
    self.site_role == 'admin'
  end

  ##
  # Create the string with name of this user
  #
  def show_name
    return_string = ""
    if first_name.present? || last_name.present?
      return_string = "#{first_name} #{last_name}".strip
    end
    if login.present?
      return_string = "#{return_string} (#{login})".strip
    end
    if return_string.blank?
      return_string = email
    end
    return_string
  end

  ##
  # Define if this user has no team and even did not request for one
  #
  # Returns {Boolean} - true if he has no team and request, otherwise false
  def has_no_team?
    self.group.blank?
  end

  ##
  # Define if this user requested for team joining and his request is not considered
  #
  # Returns {Boolean} - true if he is waiting for approving, otherwise false
  def waiting_for_approving?
    self.group.present? && (self.site_role.blank? || (self.site_role == "guest"))
  end

end
