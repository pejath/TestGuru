# frozen_string_literal: true

module ApplicationHelper
  def flash_message(type, message)
    bootstrap_type = { notice: 'alert-success', alert: 'alert-danger' }

    content_tag :div, message, class: "alert #{bootstrap_type[type.to_sym]}" unless message.nil?
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank', class: 'text-decoration-none text-muted'
  end
end
