class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    if can? :read, Event
      events_path
    elsif current_user.present? && (can? :read, current_user)
      user_path(current_user)
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
