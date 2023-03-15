# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_TYPE = { 'notice' => 'alert-success', 'alert' => 'alert-danger' }

  def flash_message(type, message)
    content_tag :div, message, class: "alert #{BOOTSTRAP_TYPE[type]}" unless message.nil?
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank', class: 'text-decoration-none text-muted'
  end
end
