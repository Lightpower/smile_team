module InvitesHelper
  ##
  # Show one icon which represents invite state
  #
  def show_state_icon(invite)
    return_string = case invite.state
      when Invite::STATES[:sent]
        content_tag(:b, "__")
      when Invite::STATES[:read]
        content_tag(:b, "...")
      when Invite::STATES[:pending]
        content_tag(:b, "?")
      when Invite::STATES[:rejected]
        content_tag(:b, "-1")
      when Invite::STATES[:accepted]
        content_tag(:b, "+1")
      else
        content_tag(:b, "*")
    end
    return_string.html_safe
  end

  ##
  # Show icons for invite state managing
  #
  def edit_state_icons(invite, add_login=false)
    return_string = ""
    if add_login
      return_string += content_tag(:b, invite.user.login).html_safe
      return_string += " " if return_string.present?
    end
    { :accepted => "+1", :rejected => "-1", :pending => "?" }.each do |elem|
      return_string += " " if return_string.present?
      link_string = link_to(elem[1], class: "#{Invite::STATES[elem[0]]}_invite").html_safe
      link_string = content_tag(:b, link_string).html_safe if invite.state == elem[0]
      return_string += link_string
    end

    content_tag(:div, return_string.html_safe, { "data-id" => invite.id } ).html_safe
  end

  ##
  # Choose the invite of defined user from invite list
  #
  def show_my_invite(user, invites)
    invite = invites.where(user_id: user.id).first
    return_string = ""
    if invite.present?
      return_string += edit_state_icons(invite, true)
    end
    return_string.html_safe
  end
end
