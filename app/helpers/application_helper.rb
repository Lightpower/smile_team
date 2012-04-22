module ApplicationHelper
  def show_flash
    [:notice, :alert, :error].map { |type|
      content_tag(:div, flash[type], class: type) if flash[type]
    }.join.html_safe
  end
end
