class GroupsController < ApplicationController
  before_filter :authorize_join_requests


  def join_requests
    @users = User.unapproved(current_user.group)
  end

  def approve_all
    res = current_user.group.approve_all
    puts res
    render :join_requests
  end

  def reject_all
    res = current_user.group.reject_all
    puts res
    render :join_requests
  end

private

  def authorize_join_requests
    authorize! :manage, :join_requests
  end
end
