# coding: utf-8
module InvitesHelper
  ##
  # Show one icon which represents invite state
  #
  def show_state_icon(invite, add_login=false)
    return_string = ""
    return_string = content_tag(:div, content_tag(:b, link_to(invite.user.login, user_path(invite.user))), {class: "horizontal"}) + " " if add_login
    return_string += content_tag(:div, "", {class: invite.state})
    content_tag(:div, return_string.html_safe, {class: "show_invite"}).html_safe
  end

  ##
  # Show icons for invite state managing
  #
  def edit_state_icons(invite, add_login=false)
    return_string = ""
    if add_login
      return_string += content_tag(:div, content_tag(:b, link_to(invite.user.login, user_path(invite.user))), {class: "horizontal"})
      return_string += " " if return_string.present?
    end
    %w"accepted rejected pending".each do |elem|
      return_string += " " if return_string.present?
      if invite.state != elem.to_s
        return_string += link_to(content_tag(:div, "", {class: elem}), "#", class: elem).html_safe
      else
        return_string += content_tag(:div, "", {class: "#{elem}_selected"})
      end
    end
    content_tag(:div, return_string.html_safe, { "data-url" => invites_path, "data-id" => invite.id, class: "managed_invite" } ).html_safe
  end

  ##
  # Choose the invite of defined user from invite list and show it
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
