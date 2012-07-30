# coding: utf-8
module GamesHelper
  ##
  # Form links for Game object
  #
  def game_links(game)
    result = ""
    result << link_to("Перейти к анонсу на сайте", game.link_to_site) if game.link_to_site.present?
    result << " | " if game.link_to_site.present? && game.link_to_forum.present?
    result << link_to("Перейти к форуму", game.link_to_forum) if game.link_to_forum.present?
    content_tag(:p, result.html_safe).html_safe
  end
end
