class Project < ActiveRecord::Base

  has_many :project_formats

  validates_uniqueness_of :name

end
