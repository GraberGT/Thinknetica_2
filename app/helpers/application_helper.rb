module ApplicationHelper
  ALERTS = { 'alert' => 'alert-warning', 'notice' => 'alert-info', 'error' => 'alert-danger' }

  def current_year
    Time.current.year
  end

  def github_url(author, repo = nil)
    link_to 'Github', "https://github.com/#{author}/#{repo}"
  end

  def flash_message(key, message)
    content_tag :div, message, class: "alert #{ALERTS[key]}", role: "alert"
  end
end
