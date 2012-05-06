class ProjectFormat < ActiveRecord::Base

  has_many :games, foreign_key: :format_id
  belongs_to :project

end
