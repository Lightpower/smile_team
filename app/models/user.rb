class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Default scopes, default values (e.g. self.per_page =)
  ROLES = %w'guest mate leader captain admin'
  cattr_reader :per_page
  @@per_page = 20

  def is_admin?
    self.role == 'admin'
  end

end
