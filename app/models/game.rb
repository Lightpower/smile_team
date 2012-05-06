class Game < ActiveRecord::Base

  belongs_to :event
  belongs_to :project_format, foreign_key: :format_id

end
