# coding: utf-8
class Game < ActiveRecord::Base

  belongs_to :event
  belongs_to :project_format, foreign_key: :format_id

  validates_presence_of :event
  validates_presence_of :project_format

  def project
    self.project_format.project
  end

  def css_class
    case project_format.name
      when "Lite"        # DozoR Lite
        "dozor_lite"
      when "Classic"     # DozoR Classic
        "dozor_classic"
      when "Klad"
        "dozor_klad"     # DozoR Klad
      when "neDostRoy"   # DozoR neDostRoy
        "dozor_nedostroy"
      when "Схватка"     # EN Схватка
        "en_cx"
      when "Точки"       # EN Точки
        "en_tochki"
      when "Лайт"        # CQ Лайт
        "cq_lite"
      else
        "content"
    end
  end

end
