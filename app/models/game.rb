class Game < ActiveRecord::Base

  belongs_to :event
  belongs_to :project_format, foreign_key: :format_id

  validates_presence_of :event
  validates_presence_of :project_format

  def project
    self.project_format.project
  end

end
