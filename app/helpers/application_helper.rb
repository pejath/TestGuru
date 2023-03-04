# frozen_string_literal: true

module ApplicationHelper
  def flash_message(type, message)
    content_tag :p, message, class: "flash #{type}" unless message.nil?
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank'
  end
end
